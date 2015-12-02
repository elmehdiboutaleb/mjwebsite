<?php
/*
* Plugin Name: PDF Image Generator
* Plugin URI: http://web.contempo.jp/weblog/tips/p1522
* Description: Generate automatically cover image of PDF by using ImageMagick. Insert PDF link with image into editor. Allow PDF to be set as featured image and to be used as image filetype.
* Author: Mizuho Ogino 
* Author URI: http://web.contempo.jp
* Version: 1.3.5
* License: http://www.gnu.org/licenses/gpl.html GPL v2 or later
* Text Domain: pigen
* Domain Path: /languages
*/


if ( !class_exists( 'PIGEN' ) ) {
class PIGEN {


	public function __construct() {
		load_plugin_textdomain( 'pigen', false, dirname( plugin_basename( __FILE__ ) ) . '/languages' ); 
		register_activation_hook( __FILE__, array( $this,'pigen_activate' ) );
		add_action( 'admin_menu', array( $this,'pigen_admin_menu' ) );
		add_filter( 'add_attachment', array( $this,'pigen_attachment' ), 100 );
		add_filter( 'media_send_to_editor', array( $this,'pigen_insert' ), 100, 3 );
		add_filter( 'delete_attachment', array( $this,'pigen_delete' ) );
		add_filter( 'wp_mime_type_icon', array( $this,'pigen_change_icon' ), 10, 3 );
		add_filter( 'wp_get_attachment_image_src', array( $this,'pigen_wp_get_attachment_image_src' ), 10, 4 );
		add_filter( 'ajax_query_attachments_args', array( $this,'pigen_ajax_query_attachments_args' ), 100, 1 );
		add_action( 'admin_footer-post-new.php', array( $this,'pigen_override_filter_object' ) );
		add_action( 'admin_footer-post.php', array( $this,'pigen_override_filter_object' ) );
		add_filter( 'attachment_fields_to_edit', array( $this,'pigen_attachment_fields_to_edit' ), 10, 2 );
		add_filter( 'attachment_fields_to_save', array( $this,'pigen_attachment_fields_to_save' ), 10, 2 );
		add_action( 'save_post', array( $this,'pigen_save_featuredimage'), 100, 1 );
	}


	public function pigen_activate() { // Check the server whether or not it has imageMagick enabled.
		$opt = get_option( 'pigen_options' );
		if ( empty( $opt ) ){ // update older version settings
			delete_option( '_pigen_verify_imagick' );
			if ( function_exists('exec') ) {
				exec( 'convert -version', $out, $ver ); //Try to get ImageMagick "convert" program version number.
				if ( $ver === 0 && count($out) > 2 ) {
					if ( shell_exec( 'gs --version' ) ) {
						$verify_imagick = 'imageMagick';
					} else {
						_e( 'Please install GhostScript before activate the plugin!', 'pigen' );
						exit;
					}
				} else {
					_e( 'Please install ImageMagick and GhostScript before activate!', 'pigen' );
					exit;
				}
			} elseif( extension_loaded('imagick') ) {
				$verify_imagick = 'imagick';
			} else {
				_e( 'Please install ImageMagick and GhostScript before activate!', 'pigen' );
				exit;
			}
		} 
		$update_option = array( 
			'keepthumbs' => isset( $opt[ 'keepthumbs' ] ) ? $opt[ 'keepthumbs' ] : 'true',
			'changeicon' => isset( $opt[ 'changeicon' ] ) ? $opt[ 'changeicon' ] : 'true',
			'hidethumb' => isset( $opt[ 'hidethumb' ] ) ? $opt[ 'hidethumb' ] : 'true',
			'property' => isset( $opt[ 'property' ] ) ? $opt[ 'property' ] : 'true',
			'quality' => isset( $opt[ 'quality' ] ) ? $opt[ 'quality' ] : 80,
			'maxwidth' => isset( $opt[ 'maxwidth' ] ) ? $opt[ 'maxwidth' ] : 1024,
			'maxheight' => isset( $opt[ 'maxheight' ] ) ? $opt[ 'maxheight' ] : 1024,
			'featured' => isset( $opt[ 'featured' ] ) ? $opt[ 'featured' ] : 'true',
			'verify_imagick' => isset( $opt[ 'verify_imagick' ] ) ? $opt[ 'verify_imagick' ] : $verify_imagick
		);
		update_option( 'pigen_options', $update_option );
	}


	public function pigen_admin_menu() {
		add_options_page( __( 'PDF Image Generator Settings', 'pigen' ), __( 'PDF Image Generator', 'pigen' ), 'administrator', __FILE__, array( $this,'pigen_options') );
	}


	public function pigen_options() { 
		if ( isset( $_POST['pigen_options_nonce'] ) && wp_verify_nonce( $_POST['pigen_options_nonce'], basename(__FILE__) ) ) { // save options
			$update_options = array( 
				'changeicon' => ( isset( $_POST[ 'pigen_changeicon' ] ) ? $_POST[ 'pigen_changeicon' ] : '' ),
				'featured' => ( isset( $_POST[ 'pigen_featured' ] ) ? $_POST[ 'pigen_featured' ] : '' ),
				'hidethumb' => ( isset( $_POST[ 'pigen_hidethumb' ] ) ? $_POST[ 'pigen_hidethumb' ] : '' ),
				'property' => ( isset( $_POST[ 'pigen_property' ] ) ? $_POST[ 'pigen_property' ] : '' ),
				'quality' => ( isset( $_POST[ 'pigen_quality' ] ) ? $_POST[ 'pigen_quality' ] : '' ),
				'maxwidth' => ( isset( $_POST[ 'pigen_maxwidth' ] ) ? $_POST[ 'pigen_maxwidth' ] : '' ),
				'maxheight' => ( isset( $_POST[ 'pigen_maxheight' ] ) ? $_POST[ 'pigen_maxheight' ] : '' ),
				'keepthumbs' => ( isset( $_POST[ 'pigen_keepthumbs' ] ) ? $_POST[ 'pigen_keepthumbs' ] : '' ),
				'verify_imagick' => ( isset( $_POST[ 'pigen_verify_imagick' ] ) ? $_POST[ 'pigen_verify_imagick' ] : 'imageMagick' )
			);
			update_option( 'pigen_options', $update_options );
			echo '<div class="updated fade"><p><strong>'. __('Options saved.', 'pigen'). '</strong></p></div>';
		}
		$opt = get_option( 'pigen_options' );
		echo '<div class="wrap">'."\n";

		if ( isset($_GET['run']) ) {
			echo
				'<h2>' .__( 'Generate uploaded PDF thumbnails', 'pigen' ). '</h2>'."\n".
				'<div id="pdf-list">'."\n".
				'<style type="text/css">#pdf-list { padding:20px 0; } #pdf-list .pdf { display:table; } #pdf-list .pdf .img { display:table-cell; width:120px; padding:5px 0; vertical-align:middle; } #pdf-list .pdf img { border:4px solid #999; max-width:100px; max-height:100px; height:auto; width:auto; } #pdf-list .pdf.generated img { border-color:#0bf; } #pdf-list .pdf.generated strong { color:#0bf; } #pdf-list .pdf.generated img { border-color:#f6d; } #pdf-list .pdf.generated strong { color:#f6d; } #pdf-list .pdf .txt { display:table-cell; font-size:12px; vertical-align:middle; }</style>'."\n";
			$pigen_num = 0;
			$pdfs = get_posts(array('post_type'=>'attachment','post_mime_type'=>'application/pdf','numberposts'=>-1));
			$_GET['run'] == 'regenerate' ? $regenerate = true : $regenerate = false; 
			if( $pdfs ): foreach( $pdfs as $pdf ):
				$thumbnail_id = get_post_meta( $pdf->ID, '_thumbnail_id', true );
				if ( !$thumbnail_id || $regenerate ){
					$pigen_num ++;
					$this->pigen_attachment( $pdf->ID );
					echo '<div class="pdf generated' .( $regenerate && $thumbnail_id ? ' regenerated' : '' ). '"><p class="img">'.get_the_post_thumbnail( $pdf->ID, 'medium' ).'</p><p class="txt">ID: '.$pdf->ID.' / <strong>' .( $regenerate && $thumbnail_id ? 'An image was REGENERATED' : 'A new image was GENERATED' ). '</strong></p></div>';
				} else {
					echo '<div class="pdf"><p class="img">'.get_the_post_thumbnail( $pdf->ID, 'medium' ).'</p><p class="txt">ID: '.$pdf->ID.' / An image already exists</p></div>';
				}
			endforeach; endif;
			echo '</div><!-- #pdf-list -->'."\n";
			if ( $pigen_num == 0 ) $pigen_num = 'No image'; elseif ( $pigen_num == 1 ) $pigen_num = '1 image'; else $pigen_num = $pigen_num.' images'; echo '<h3>'.$pigen_num.' generated.</h3>'."\n";
			echo '<p><a href="'.remove_query_arg( 'run', $_SERVER['REQUEST_URI'] ).'" class="button button-primary">' .__( 'Back to PDF Image Generator Settings', 'pigen' ).'</a></p><br/>'."\n";

		} else {
			echo
				'<style type="text/css">#pigen-fields { margin:0; font-size:1em; } #pigen-fields p { clear:left; padding:15px 0 3px 0; margin:0; font-size:1em; } #pigen-fields .float { float:left; clear:none; margin-right:25px; } #pigen-fields .subfield { padding:3px 0; margin:0 0 0 25px; } #pigen-fields small { font-size:.85em; } #pigen-fields input[type=text]+label { display:inline; font-size:.9em; line-height:1.4em; } #pigen-fields input[type=text]+label span { float:left; display:inline-block; padding:8px 5px 0 0; } #pigen-fields input:disabled+label { color:#aaa; } #pigen-fields label { font-size:1.2em; padding:5px 0; } #pigen-fields input + label { padding-left:6px; }</style>'."\n".
				'<h2>' .__( 'PDF Image Generator Settings', 'pigen' ).'</h2>'."\n".
				'<h3>' .__( 'Default plugin settings', 'pigen' ). '</h3>'."\n".
				'<p>'.__( 'If you want to disable some functions, uncheck boxes below.', 'pigen' ).'</p>'."\n".
				'<form action="" method="post">'."\n";
			$imagemagick = $imagick = 'disabled'; 
			if ( function_exists('exec') ) {
				exec( 'convert -version', $out, $ver ); //Try to get ImageMagick "convert" program version number.
				if ( $ver === 0 && count($out) > 2 && shell_exec( 'gs --version' ) ) $imagemagick = ''; 
			}
			if( extension_loaded('imagick') ) $imagick = '';
			echo
				"\t".'<fieldset id="pigen-fields">'."\n".
				"\t\t".'<p><legend class="screen-reader-text"><span>Default plugin settings</span></legend></p>'."\n".
				"\t\t".'<p><input name="pigen_changeicon" type="checkbox" id="pigen_changeicon" value="true" '.( $opt['changeicon'] === 'true' ? 'checked="checked"' : '' ).' /><label for="pigen_changeicon">'.__( 'Display Generated Image instead of default wp mime-type icon', 'pigen' ).'</label></p>'."\n".
				"\t\t".'<p><input name="pigen_featured" type="checkbox" id="pigen_featured" value="true" '.( $opt['featured'] === 'true' ? 'checked="checked"' : '' ).' /><label for="pigen_featured">'.__( 'Allow to set PDF as Featured Image', 'pigen' ).'</label></p>'."\n".
				"\t\t".'<p class="subfield"><small>'.__( 'If the plugin is deactivated, a Featured Image that has a PDF file will return no image.', 'pigen' ). '</small></p>'."\n".
				"\t\t".'<p class="subfield"><input name="pigen_featured" type="checkbox" id="pigen_featured_option" value="thumbnail" '.( $opt['featured'] === 'thumbnail' ? 'checked="checked"' : '' ).' /><label for="pigen_featured_option">'.__( 'Allow to set Generate Image file itself as Featured Image', 'pigen' ).'</label></p>'."\n".
				"\t\t".'<p class="subfield"><small>'.__('You can also optionally choose to permit users set a Generated Image file ID into a Featured Image', 'pigen' ). '</small><br/><small>'.__('Or, if you don\'t want to permit a Generated Image to be set as a Featured Image, uncheck both checkboxes.', 'pigen' ). '</small></p>'."\n".
				"\t\t".'<p><input name="pigen_hidethumb" type="checkbox" id="pigen_hidethumb" value="true" '.( $opt['hidethumb'] === 'true' ? 'checked="checked"' : '' ).' /><label for="pigen_hidethumb">'.__( 'Hide Generated Images themselves in the Media Library', 'pigen' ).'</label></p>'."\n".
				"\t\t".'<p class="subfield"><small>'.__( 'When this checkbox is unchecked and a PDF is deleted, a Generated Image will NOT be deleted together.', 'pigen' ). '</small></p>'."\n".
				"\t\t".'<p><input name="pigen_property" type="checkbox" id="pigen_property" value="true" '.( $opt['property'] === 'true' ? 'checked="checked"' : '' ).' /><label for="pigen_property">'.__( 'Customize Generated Image properties', 'pigen' ).'</label></p>'."\n".
				"\t\t".'<p class="subfield"><small>'.__( 'In case of frequent HTTP error when uploading PDF, there maybe not enough memory to run imageMagick. <br/>Uncheck this checkbox and try again.', 'pigen' ). '</small></p>'."\n".
				"\t\t".'<p class="subfield float"><input name="pigen_maxwidth" type="number" id="pigen_maxwidth" value="'.( $opt['maxwidth'] ).'" onKeyup="this.value=this.value.replace(/[^0-9a-z]+/i,\'\')" /><label for="pigen_maxwidth"><span>'.__( 'Max Width' ).': </span>px</label></p><p class="subfield float"><input name="pigen_maxheight" type="number" id="pigen_maxheight" value="'.$opt['maxheight'].'" onKeyup="this.value=this.value.replace(/[^0-9a-z]+/i,\'\')" /><label for="pigen_maxheight"><span>'.__( 'Max Height' ).': </span>px</label></p><p class="subfield float"><input name="pigen_quality" type="number" min="1" max="100" id="pigen_quality" value="'.$opt['quality'].'" onKeyup="this.value=this.value.replace(/[^0-9a-z]+/i,\'\')" /><label for="pigen_quality"><span>'.__( 'Compression Quality', 'pigen' ).': </span>(1 - 100)</label></p>'."\n".
				"\t\t".'<p class="subfield"><small>'.__( 'The parameter will be calculated if 0 or blank is entered.', 'pigen' ).'</small></p>'."\n".
				"\t\t".'<p><input name="pigen_keepthumbs" type="checkbox" id="pigen_keepthumbs" value="true" '.( $opt['keepthumbs'] === 'true' ? 'checked="checked"' : '' ).' /><label for="pigen_keepthumbs">'.__( 'Keep Generated Images after the plugin is uninstalled', 'pigen' ).'</label></p>'."\n".
				"\t\t".'<p class="subfield"><small>' .__( 'If the plugin is deactivated, Generated Image files will be handled as ordinary image files.', 'pigen' ). '</small></p>'."\n".
				"\t\t".'<p class="float"><input type="radio" id="pigen_verify_imageMagick" name="pigen_verify_imagick" value="imageMagick" '.( $opt['verify_imagick'] === 'imageMagick' ? 'checked="checked"' : $imagemagick ).' /><label for="pigen_verify_imageMagick">'.__( 'Use imageMagick with exec function', 'pigen' ).'</label></p><p class="float"><input type="radio" id="pigen_verify_imagick" name="pigen_verify_imagick" value="imagick" '.( $opt['verify_imagick'] === 'imagick' ? 'checked="checked"' : $imagick ).' /><label for="pigen_verify_imagick">'.__( 'Use imagick PHP Extension', 'pigen' ).'</label></p>'."\n".
				"\t".'</fieldset>'."\n".
				"\t".'<p class="submit"><input type="submit" name="Submit" class="button-primary" value="'.__( 'Save changes', 'pigen' ).'" /></p>'."\n".
				"\t".'<input type="hidden" name="pigen_options_nonce" value="'.wp_create_nonce(basename(__FILE__)).'" />'."\n".
				'</form>'."\n";
			echo
				'<h3 style="margin-top:40px;">' .__( 'Generate uploaded PDF thumbnails', 'pigen' ). '</h3>'."\n".
				'<p>' .__( 'It allows you to generate images of any already-uploaded PDFs in the Media Library. <br/>Please save changes before running the script.', 'pigen' ). '</p>'."\n".
				'<p><a href="'.add_query_arg( 'run', 'generate', $_SERVER['REQUEST_URI'] ).'" class="button button-primary">' .__( 'Generate images of PDFs that have no thumb', 'pigen' ). '</a></p>'."\n".
				'<p><a href="'.add_query_arg( 'run', 'regenerate', $_SERVER['REQUEST_URI'] ).'" class="button button-primary">' .__( 'Regenerate and replace images of all PDFs', 'pigen' ). '</a></p>'."\n";
		}
		echo 
			'<h3 style="margin-top:40px;">' .__( 'Donate', 'pigen' ).'</h3>'."\n".
			'<p>' .__( 'If you find this plugin useful and you want to support its future development, please consider making a donation.', 'pigen' ). '</p>'."\n".
			'<p><a href="http://web.contempo.jp/donate?pigen" class="button button-primary" target="_blank">' .__( 'Donate via PayPal', 'pigen' ).'</a></p>'."\n".
			'<p style="padding-top:30px; font-size:.9em;">' .__( 'If you are having problems with the plugin, see the plugin page on <a href="https://wordpress.org/plugins/pdf-image-generator/" target="_blank">the WordPress.org plugin directory</a>.', 'pigen' ).'</p>'."\n".
			'</div><!-- .wrap -->'."\n".
			'<script type="text/javascript">jQuery(function($) { '.
				'$( "#pigen_featured" ).on( "change keyup",function(){ '.
					'if ( $(this).is(":checked") ) $( "#pigen_featured_option" ).prop( "checked", false ).attr( "disabled", "disabled" ); '.
					'else $( "#pigen_featured_option" ).removeAttr( "disabled" ); '.
				'}).trigger( "keyup" ); '.
				'$( "#pigen_property" ).on( "change keyup",function(){ '.
					'if ( $(this).is(":checked") ) $( "#pigen_maxwidth, #pigen_maxheight, #pigen_quality" ).removeAttr( "disabled" ); '.
					'else $( "#pigen_maxwidth, #pigen_maxheight, #pigen_quality" ).attr( "disabled", "disabled" ); '.
				'}).trigger( "keyup" ); '.
			'});</script>'."\n";
	}


	public function pigen_generate( $file ){ // Generate thumbnail from PDF
		$file_basename = str_replace( '.', '-', basename($file) ).'.jpg';
		$file_basename = apply_filters( 'pigen_filter_convert_file_basename', $file_basename );
		$file_url = str_replace( basename($file), $file_basename, $file );
		$opt = get_option( 'pigen_options' );
		$max_width = ( $opt[ 'maxwidth' ] ? (int) $opt[ 'maxwidth' ] : 0 );
		$max_height = ( $opt[ 'maxheight' ] ? (int) $opt[ 'maxheight' ] : 0 );
		$quality = ( $opt[ 'quality' ] ? (int) $opt[ 'quality' ] : 80 );
		if ( $quality > 100 ) $quality = 100;
		if ( $opt[ 'verify_imagick' ] == 'imagick' ) {
			try { 
				$imagick = new imagick();
				if ( $opt['property'] ) {
					$imagick->setResolution( 150, 150 );
					$imagick->readimage( $file.'[0]' );
					$imagick->setResolution( 72, 72 );
					$imagick->setCompressionQuality( $quality );
					$imagick->scaleImage( $max_width, $max_height, true);
				} else {
					$imagick->setResolution( 72, 72 );
					$imagick->readimage( $file.'[0]' );
				}
				$imagick->setImageBackgroundColor( 'white' );
				$imagick->setImageFormat( 'jpg' ); 
				$imagick = apply_filters( 'pigen_filter_convert_imagick', $imagick );
				$imagick = $imagick->flattenImages();
				$imagick->writeImage( $file_url ); 
				$imagick->clear();
				$imagick->destroy();
			} catch ( ImagickException $e ){
				$file_url = false;
			} catch ( Exception $e ){
				$file_url = false;
			}
		} else {
			if ( $max_width == 0 ) $max_width = ''; 
			if ( $max_height == 0 ) $max_height = ''; 
			if ( $opt['property'] ) {
				$imageMagick = "convert -density 150 -set units PixelsPerInch -density 72 -quality {$quality} -background white -flatten -resize {$max_width}x{$max_height} {$file}[0] {$file_url}";
			} else {
				$imageMagick = "convert -density 72 -background white -flatten {$file}[0] {$file_url}";
			}
			$imageMagick = apply_filters( 'pigen_filter_convert_imageMagick', $imageMagick, $file.'[0]', $file_url, $max_width, $max_height );
			exec( $imageMagick ); // convert pdf to image
		}
		return $file_url;
	}


	public function pigen_attachment( $attachment_id ){ // Generate thumbnail from PDF
		if( get_post_mime_type( $attachment_id ) === 'application/pdf' ){
			$file = get_attached_file( $attachment_id );
			$file_url = $this->pigen_generate( $file );
			if( file_exists( $file_url ) ){
				$thumbnail_id = get_post_meta( $attachment_id, '_thumbnail_id', true );
				if ( !$thumbnail_id ){
					$file_title = esc_attr( get_the_title( $attachment_id ) );
					$attachment = get_post( $attachment_id );
					$thumbnail = array(
						'post_type' => 'attachment',
						'post_mime_type' => 'image/jpeg',
						'post_title' => $file_title,
						'post_excerpt' => $attachment->post_excerpt,
						'post_content' => $attachment->post_content,
						'post_parent' => $attachment_id
					);
					$thumbnail_id = wp_insert_attachment( $thumbnail, $file_url );
					update_post_meta( $thumbnail_id, '_wp_attachment_image_alt', 'thumbnail of '.$file_title );
				}
				update_post_meta( $attachment_id, '_thumbnail_id', $thumbnail_id );
				$metadata = wp_generate_attachment_metadata( $thumbnail_id, $file_url );
				if ( !empty( $metadata ) && ! is_wp_error( $metadata ) ) {
					wp_update_attachment_metadata( $thumbnail_id, $metadata );
				}
			}
		}
		return $attachment_id;
	}


	public function pigen_insert( $html, $send_id, $attachment ) { // Insert thumbnail instead of PDF
		$attach_id = isset( $attachment['id'] ) ? $attachment['id'] : '';
		$thumbnail_id = get_post_meta( $attach_id, '_thumbnail_id', true );
		if( $attach_id && $thumbnail_id && get_post_mime_type ( $attach_id ) === 'application/pdf' ){
			$linkto = get_post_meta( $attach_id, '_pigen_attach_linkto', true );
			if ( $linkto === 'file' ) $attach_url = wp_get_attachment_url( $attach_id );
			elseif ( $linkto === 'post' ) $attach_url = get_attachment_link( $attach_id );
			else $attach_url = '';
			$attach_title = isset( $attachment['post_title'] ) ? $attachment['post_title'] : '';
			$attach_caption = isset( $attachment['post_excerpt'] ) ? $attachment['post_excerpt'] : '';
			$attach_desc = isset( $attachment['post_content'] ) ? $attachment['post_content'] : '';
			$size = get_post_meta( $attach_id, '_pigen_attach_size', true );
			if ( $size === 'url' ){
				$html = $attach_url;
			} if ( $size === 'title' ){
				$html = isset( $attachment['post_title'] ) ? $attachment['post_title'] : '';
			} elseif ( $size ) {
				$thumbnail = wp_get_attachment_image_src( $thumbnail_id, $size );
				if( $thumbnail ){
					$align = 'none';
					$align = get_post_meta( $attach_id, '_pigen_attach_align', true );
					$html = '<img src="'. $thumbnail[0] .'" alt="'.get_post_meta( $thumbnail_id, '_wp_attachment_image_alt', true ).'" width="'. $thumbnail[1] .'" height="'. $thumbnail[2] .'" class="'.( $attach_caption ? '' : 'align' .$align. ' ' ). 'size-' .esc_attr( $size ). ' wp-image-'.$thumbnail_id.'" />';
				}
			}
			if ( $attach_url ){
				$html =  '<a class="link-to-pdf" href="'.$attach_url.'" rel="attachment wp-att-' .esc_attr($send_id). '" title="'.$attach_title.'" target="_blank">' .$html. '</a>';
			}
			if ( $thumbnail && $attach_caption ){
				$html = '[caption id="attachment_'.$send_id.'" align="align' .$align. '" width="'.$thumbnail[1].'"]'.$html.' '.$attach_caption.'[/caption]';
			}
		}
		return $html;
	}


	public function pigen_delete( $attachment_id ) { // Delete thumbnail when PDF is deleted
		if( get_post_mime_type ( $attachment_id ) === 'application/pdf' ){
			$thumbnail_id = get_post_meta( $attachment_id, '_thumbnail_id', true );
			$opt = get_option( 'pigen_options' );
			if( $thumbnail_id ){
				if ( isset( $opt[ 'hidethumb' ] ) && $opt[ 'hidethumb' ] == 'true' ) {
					wp_delete_post( $thumbnail_id );
				} else {
					$post_parent = get_post( $attachment_id )->post_parent;
					if ( $post_parent ){
						$thumb = array();
						$thumb['ID'] = $thumbnail_id;
						$thumb['post_parent'] = $post_parent;
						wp_update_post( $thumb );
					}
				}
			}
		}
	}


	public function pigen_change_icon ( $icon, $mime, $attachment_id ){ // Display thumbnail instead of document.png
		$opt = get_option( 'pigen_options' );
		if ( isset( $opt[ 'changeicon' ] ) && $opt[ 'changeicon' ] == '' ) return $icon;
		if ( strpos( $_SERVER[ 'REQUEST_URI' ], '/wp-admin/upload.php' ) === false && $mime === 'application/pdf' ){
			$thumbnail = wp_get_attachment_image_src ( $attachment_id, 'medium' );
			if( $thumbnail ) $icon = $thumbnail[0];
		}
		return $icon;
	}


	public function pigen_wp_get_attachment_image_src( $image, $attachment_id, $size, $icon ) {
		if ( get_post_mime_type ( $attachment_id ) === 'application/pdf' ){
			$thumbnail_id = get_post_meta( $attachment_id, '_thumbnail_id', true );
			if( $thumbnail_id ){
				$get_image = wp_get_attachment_image_src ( $thumbnail_id, $size );
				$image = array( $get_image[0], $get_image[1], $get_image[2] );
			}
		}
		return $image;
	}


	public function pigen_ajax_query_attachments_args( $query ) { // Hide thumbnail files in the library.
		$opt = get_option( 'pigen_options' );
		// 's', 'order', 'orderby', 'posts_per_page', 'paged', 'post_mime_type',
		// 'post_parent', 'post__in', 'post__not_in', 'year', 'monthnum'
		if ( isset( $query[ 'post_mime_type' ] ) && $query['post_mime_type'] == 'image_n_pdf' ){
			$post_parent = ( isset( $query['post_parent'] ) && $query['post_parent'] ? '&post_parent='.$query['post_parent'] : '' );
			if ( isset( $opt[ 'featured' ] ) && $opt[ 'featured' ] == 'thumbnail' ){
				$post__in = array();
				$get_posts = get_posts( 'posts_per_page=-1&post_type=attachment&post_mime_type=image'.$post_parent );
				if ( $get_posts ): foreach ( $get_posts as $get ):
					$post__in[] = $get->ID;
				endforeach; endif;
				$get_posts = get_posts( 'posts_per_page=-1&post_type=attachment&post_mime_type=application/pdf'.$post_parent );
				if ( $get_posts ): foreach ( $get_posts as $get ):
					if( $thumbnail_id = get_post_meta( $get->ID, '_thumbnail_id', true ) ) $post__in[] = $thumbnail_id;
				endforeach; endif;
				$query['post_parent'] = false;
				$query['post__in'] = $post__in;
				$query['post_mime_type'] = array('image');
				return $query;
			} elseif ( isset( $opt[ 'featured' ] ) && $opt[ 'featured' ] == 'true' ){
				$query['post_mime_type'] = array('image','application/pdf');
			}
		} 
		if ( isset( $opt[ 'hidethumb' ] ) && $opt[ 'hidethumb' ] == '' ){
			if ( isset( $query['post_parent'] ) && $query['post_parent'] ){
				$post__in = array();
				$get_posts = get_posts( 'posts_per_page=-1&post_type=attachment&post_parent='.$query['post_parent'] );
				if ( $get_posts ): foreach ( $get_posts as $get ):
					$post__in[] = $get->ID;
					$thumbnail_id = get_post_meta( $get->ID, '_thumbnail_id', true );
					if( get_post_mime_type( $get->ID ) == 'application/pdf' && $thumbnail_id ) $post__in[] = $thumbnail_id;
				endforeach; endif;
				if ( $post__in ){
					$query['post_parent'] = false;
					$query['post__in'] = $post__in;
				}
			}
			return $query;
		}
		$get_posts = get_posts( 'posts_per_page=-1&post_type=attachment&post_mime_type=application/pdf' );
		$post__not_in = array();
		if ( $get_posts ): foreach ( $get_posts as $get ):
			if( $thumbnail_id = get_post_meta( $get->ID, '_thumbnail_id', true ) ) $post__not_in[] = $thumbnail_id;
		endforeach; endif;
		$query['post__not_in'] = $post__not_in;

		return $query;
	}


	public function pigen_override_filter_object() { // Override relevant media manager javascript functions 
		$opt = get_option( 'pigen_options' );
		if ( isset( $opt[ 'featured' ] ) && $opt[ 'featured' ] == '' ) return;
	?>
	<script type="text/javascript">
	l10n = wp.media.view.l10n = typeof _wpMediaViewsL10n === 'undefined' ? {} : _wpMediaViewsL10n;
	wp.media.view.AttachmentFilters.Uploaded.prototype.createFilters = function() {
		var type = this.model.get('type'),
			types = wp.media.view.settings.mimeTypes,
			text;
		if ( types && type ) text = types[ type ];
		filters = {
			all: { text: text || l10n.allMediaItems, props: { uploadedTo: null, orderby: 'date', order: 'DESC' }, priority: 10 },
			uploaded: { text: l10n.uploadedToThisPost, props: { uploadedTo: wp.media.view.settings.post.id, orderby: 'menuOrder', order: 'ASC' }, priority: 20 }
		};
		if ( this.options.controller._state.indexOf( 'featured-image' ) !== -1 ) {
			filters.all = { text: <?php echo '\''.__('Image').' & '.__( 'PDF' ).'\''; ?>, props: { type: 'image_n_pdf', uploadedTo: null, orderby: 'date', order: 'DESC' }, priority: 20 };
			filters.image = { text: <?php echo '\''.__('Image').'\''; ?>, props: { type: 'image', uploadedTo: null, orderby: 'date', order: 'DESC' }, priority: 20 };
			filters.uploaded = { text: l10n.uploadedToThisPost, props: { type: 'image_n_pdf', uploadedTo: wp.media.view.settings.post.id, orderby: 'menuOrder', order: 'ASC' }, priority: 10 };
			filters.unattached = { text: l10n.unattached, props: { 	status: null, uploadedTo: 0, type: null, orderby: 'menuOrder', order: 'ASC' }, priority: 50 };
		}
		this.filters = filters;
	}; // End create filters

	jQuery(function($) { 
		wp.media.featuredImage.frame().on( 'ready', function(){ 
			$( 'select.attachment-filters [value="uploaded"]' ).attr( 'selected', true ).parent().trigger('change'); // Change the default view to "Uploaded to this post".
		});
	}); 
	</script>
	<?php }


	public function pigen_attachment_fields_to_edit( $form_fields, $post ) {
		if ( get_post_mime_type( $post->ID ) !== 'application/pdf' ) return $form_fields;
		if ( !get_post_meta( $post->ID, '_thumbnail_id', true ) ) return $form_fields;
		$val = get_post_meta( $post->ID, '_pigen_attach_linkto', true );
		if ( empty( $val ) ) {
			$val = get_option( 'image_default_link_type' ); 
			if (!$val) $val = 'file';
			update_post_meta( $post->ID, '_pigen_attach_linkto', $val );
		}
		$form_fields['pigen_attach_linkto']['label'] = __('Link To');
		$form_fields['pigen_attach_linkto']['input'] = 'html';
		$form_fields['pigen_attach_linkto']['html'] = 
			'<select name='. "attachments[{$post->ID}][pigen_attach_linkto]" .'">'.
			'<option ' .selected( $val, 'file', false ). ' value="file">'. __('PDF Media File', 'pigen'). '</option>'.
			'<option ' .selected( $val, 'post', false ). ' value="post">'. __('Attachment Page'). '</option>'.
			'<option ' .selected( $val, 'none', false ). ' value="none">'. __('None'). '</option>'.
			'</select>'. "\n";

		$val = get_post_meta( $post->ID, '_pigen_attach_size', true );
		if ( empty( $val ) ) {
			$val = get_option( 'image_default_size' );
			if (!$val) $val = 'medium';
			update_post_meta( $post->ID, '_pigen_attach_size', $val );
		}
		$form_fields['pigen_attach_size']['label'] = __( 'Media' );
		$form_fields['pigen_attach_size']['input'] = 'html';
		$form_fields['pigen_attach_size']['html'] = '<select name='. "attachments[{$post->ID}][pigen_attach_size]" .'">';
		$sizes = apply_filters( 'image_size_names_choose', array(
			'thumbnail'	=> __('Thumbnail'),
			'medium'	=> __('Medium size'),
			'large'		=> __('Large size'),
			'full'		=> __('Full Size'),
			'url'		=> __('URL'),
			'title'		=> __('Title'),
		));
		foreach ( $sizes as $slug => $name ) : 
			if ( $slug == 'url' || $slug == 'title' ){
				$form_fields['pigen_attach_size']['html'] .= 
					'<option ' .selected( $val, $slug, false ). ' value="'.esc_attr( $slug ).'">'. esc_html( $name ). '</option>';
			} elseif ( $thumbdata = wp_get_attachment_image_src( $post->ID, $slug ) ){
				$form_fields['pigen_attach_size']['html'] .= 
					'<option ' .selected( $val, $slug, false ). ' value="'.esc_attr( $slug ).'">'. esc_html( $name ). ' &ndash; '.$thumbdata[1].' &times; '.$thumbdata[2].'</option>';
			}
		endforeach;
		$form_fields['pigen_attach_size']['html'] .= '</select>'. "\n";

		$val = get_post_meta( $post->ID, '_pigen_attach_align', true );
		if ( empty( $val ) ) {
			$val = get_option( 'image_default_align' );
			if (!$val) $val = 'none';
			update_post_meta( $post->ID, '_pigen_attach_align', $val );
		}
		$form_fields['pigen_attach_align']['label'] = __('Alignment');
		$form_fields['pigen_attach_align']['input'] = 'html';
		$form_fields['pigen_attach_align']['html'] = 
			'<select name='. "attachments[{$post->ID}][pigen_attach_align]" .'">'.
			'<option ' .selected( $val, 'left', false ). ' value="left">'. __('Left'). '</option>'.
			'<option ' .selected( $val, 'center', false ). ' value="center">'. __('Center'). '</option>'.
			'<option ' .selected( $val, 'right', false ). ' value="right">'. __('Right'). '</option>'.
			'<option ' .selected( $val, 'none', false ). ' value="none">'. __('None'). '</option>'.
			'</select>'. "\n".
			'<style type="text/css">.attachment-details[data-id="' .$post->ID. '"]:after { content:"' .__('Attachment Display Settings'). '"; font-weight:bold; color:#777; padding:20px 0 0; text-transform:uppercase; clear:both; display:block; } .attachment-display-settings, .attachment-compat, #post-body .compat-attachment-fields { display:none!important; }</style>'."\n";
		return $form_fields;
	}


	public function pigen_attachment_fields_to_save( $post, $attachment ){
		if ( isset( $attachment['pigen_attach_linkto'] ) )
			update_post_meta( $post['ID'], '_pigen_attach_linkto', $attachment['pigen_attach_linkto'] );
		if ( isset( $attachment['pigen_attach_size'] ) ) 
			update_post_meta( $post['ID'], '_pigen_attach_size', $attachment['pigen_attach_size'] );
		if ( isset( $attachment['pigen_attach_align'] ) ) 
			update_post_meta( $post['ID'], '_pigen_attach_align', $attachment['pigen_attach_align'] );
		return $post;
	}


	function pigen_save_featuredimage( $post_id ){
		if ( defined('DOING_AUTOSAVE') && DOING_AUTOSAVE) return $post_id;
		if ( isset( $opt[ 'featured' ] ) && $opt[ 'featured' ] !== 'thumbnail' ) return $post_id;
		$featuredimage = get_post_meta( $post_id, '_thumbnail_id', true );
		if ( $featuredimage && get_post_mime_type ( $featuredimage ) === 'application/pdf' ){
			if ( $new_featuredimage = get_post_meta( $featuredimage, '_thumbnail_id', true ) ){
				update_post_meta( $post_id, '_thumbnail_id', $new_featuredimage );
			}
		}
		return $post_id;
	}


}
new PIGEN();
}
