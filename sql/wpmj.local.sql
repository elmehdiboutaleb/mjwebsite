-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 02 Décembre 2015 à 11:24
-- Version du serveur :  5.6.26
-- Version de PHP :  5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `wpmj`
--

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjcommentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_mjcommentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjcomments`
--

CREATE TABLE IF NOT EXISTS `wp_mjcomments` (
  `comment_ID` bigint(20) unsigned NOT NULL,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `wp_mjcomments`
--

INSERT INTO `wp_mjcomments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Monsieur WordPress', '', 'https://wordpress.org/', '', '2015-12-01 15:29:57', '2015-12-01 14:29:57', 'Bonjour, ceci est un commentaire.\nPour supprimer un commentaire, connectez-vous et affichez les commentaires de cet article. Vous pourrez alors les modifier ou les supprimer.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjgallery_albums`
--

CREATE TABLE IF NOT EXISTS `wp_mjgallery_albums` (
  `album_id` int(10) unsigned NOT NULL,
  `album_name` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `album_date` date DEFAULT NULL,
  `description` text,
  `album_order` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `wp_mjgallery_albums`
--

INSERT INTO `wp_mjgallery_albums` (`album_id`, `album_name`, `author`, `album_date`, `description`, `album_order`) VALUES
(1, 'Demo Album', 'admin_mj', '2015-12-02', '', 1),
(2, 'Untitled Album', 'admin_mj', '2015-12-02', '', 2);

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjgallery_pics`
--

CREATE TABLE IF NOT EXISTS `wp_mjgallery_pics` (
  `pic_id` int(10) unsigned NOT NULL,
  `album_id` int(10) unsigned NOT NULL,
  `title` text,
  `description` text,
  `thumbnail_url` text NOT NULL,
  `sorting_order` int(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `video` int(10) NOT NULL,
  `tags` text,
  `pic_name` text NOT NULL,
  `album_cover` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `wp_mjgallery_pics`
--

INSERT INTO `wp_mjgallery_pics` (`pic_id`, `album_id`, `title`, `description`, `thumbnail_url`, `sorting_order`, `date`, `url`, `video`, `tags`, `pic_name`, `album_cover`) VALUES
(1, 1, '', '', 'coffee.jpg', 1, '2015-12-02', 'http://', 0, '', 'coffee.jpg', 1),
(2, 1, '', '', 'hunter.jpg', 2, '2015-12-02', 'http://', 0, '', 'hunter.jpg', 0),
(3, 1, '', '', 'ice-cream.jpg', 3, '2015-12-02', 'http://', 0, '', 'ice-cream.jpg', 0),
(4, 1, '', '', 'like.jpg', 4, '2015-12-02', 'http://', 0, '', 'like.jpg', 0),
(5, 1, '', '', 'pawns.jpg', 5, '2015-12-02', 'http://', 0, '', 'pawns.jpg', 0),
(6, 1, '', '', 'wallpaper.jpg', 6, '2015-12-02', 'http://', 0, '', 'wallpaper.jpg', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjgallery_settings`
--

CREATE TABLE IF NOT EXISTS `wp_mjgallery_settings` (
  `setting_id` int(10) unsigned NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `wp_mjgallery_settings`
--

INSERT INTO `wp_mjgallery_settings` (`setting_id`, `setting_key`, `setting_value`) VALUES
(1, 'thumbnails_custom_enable', '1'),
(2, 'thumbnails_width', '160'),
(3, 'thumbnails_height', '120'),
(4, 'thumbnails_opacity', '1'),
(5, 'thumbnails_border_size', '2'),
(6, 'thumbnails_border_radius', '2'),
(7, 'thumbnails_border_color', '#000000'),
(8, 'margin_btw_thumbnails', '5'),
(9, 'thumbnail_text_color', '#ffffff'),
(10, 'thumbnail_text_align', 'center'),
(11, 'thumbnail_font_family', 'Verdana'),
(12, 'heading_font_size', '16'),
(13, 'text_font_size', '12'),
(14, 'thumbnail_desc_length', '60'),
(15, 'cover_custom_enable', '1'),
(16, 'cover_thumbnail_width', '160'),
(17, 'cover_thumbnail_height', '120'),
(18, 'cover_thumbnail_opacity', '1'),
(19, 'cover_thumbnail_border_size', '2'),
(20, 'cover_thumbnail_border_radius', '2'),
(21, 'cover_thumbnail_border_color', '#000000'),
(22, 'margin_btw_cover_thumbnails', '5'),
(23, 'album_text_align', 'left'),
(24, 'album_font_family', 'Verdana'),
(25, 'album_heading_font_size', '16'),
(26, 'album_text_font_size', '12'),
(27, 'album_desc_length', '400'),
(28, 'lightbox_type', 'pretty_photo'),
(29, 'lightbox_overlay_opacity', '0.6'),
(30, 'lightbox_overlay_border_size', '5'),
(31, 'lightbox_overlay_border_radius', '5'),
(32, 'lightbox_text_color', '#ffffff'),
(33, 'lightbox_overlay_border_color', '#ffffff'),
(34, 'lightbox_inline_bg_color', '#ffffff'),
(35, 'lightbox_overlay_bg_color', '#000000'),
(36, 'lightbox_fade_in_time', '500'),
(37, 'lightbox_fade_out_time', '500'),
(38, 'lightbox_text_align', 'left'),
(39, 'lightbox_font_family', 'Verdana'),
(40, 'lightbox_heading_font_size', '16'),
(41, 'lightbox_text_font_size', '12'),
(42, 'facebook_comments', '0'),
(43, 'social_sharing', '0'),
(44, 'image_title_setting', '1'),
(45, 'image_desc_setting', '1'),
(46, 'autoplay_setting', '0'),
(47, 'slide_interval', '5'),
(48, 'pagination_setting', '0'),
(49, 'images_per_page', '10'),
(50, 'filters_setting', '0'),
(51, 'filter_font_family', 'Verdana'),
(52, 'filter_font_size', '12'),
(53, 'back_button_text', 'Back to Albums'),
(54, 'album_click_text', 'Click to View Album'),
(55, 'album_text_color', '#C0C0C0'),
(56, 'button_color', '#000000'),
(57, 'button_text_color', '#CCCCCC'),
(58, 'filters_color', '#2a83ed'),
(59, 'filters_text_color', '#ffffff'),
(60, 'album_seperator', '1'),
(61, 'back_button_font_family', 'Verdana'),
(62, 'back_button_font_size', '12'),
(63, 'admin_full_control', '1'),
(64, 'admin_read_control', '1'),
(65, 'admin_write_control', '1'),
(66, 'editor_full_control', '0'),
(67, 'editor_read_control', '1'),
(68, 'editor_write_control', '0'),
(69, 'author_full_control', '0'),
(70, 'author_read_control', '1'),
(71, 'author_write_control', '0'),
(72, 'contributor_full_control', '0'),
(73, 'contributor_read_control', '1'),
(74, 'contributor_write_control', '0'),
(75, 'subscriber_full_control', '0'),
(76, 'subscriber_read_control', '1'),
(77, 'subscriber_write_control', '0'),
(78, 'language_direction', 'inherit');

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjlinks`
--

CREATE TABLE IF NOT EXISTS `wp_mjlinks` (
  `link_id` bigint(20) unsigned NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjngg_album`
--

CREATE TABLE IF NOT EXISTS `wp_mjngg_album` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `previewpic` bigint(20) NOT NULL DEFAULT '0',
  `albumdesc` mediumtext COLLATE utf8mb4_unicode_ci,
  `sortorder` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pageid` bigint(20) NOT NULL DEFAULT '0',
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjngg_gallery`
--

CREATE TABLE IF NOT EXISTS `wp_mjngg_gallery` (
  `gid` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` mediumtext COLLATE utf8mb4_unicode_ci,
  `title` mediumtext COLLATE utf8mb4_unicode_ci,
  `galdesc` mediumtext COLLATE utf8mb4_unicode_ci,
  `pageid` bigint(20) NOT NULL DEFAULT '0',
  `previewpic` bigint(20) NOT NULL DEFAULT '0',
  `author` bigint(20) NOT NULL DEFAULT '0',
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjngg_pictures`
--

CREATE TABLE IF NOT EXISTS `wp_mjngg_pictures` (
  `pid` bigint(20) NOT NULL,
  `image_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint(20) NOT NULL DEFAULT '0',
  `galleryid` bigint(20) NOT NULL DEFAULT '0',
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `alttext` mediumtext COLLATE utf8mb4_unicode_ci,
  `imagedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exclude` tinyint(4) DEFAULT '0',
  `sortorder` bigint(20) NOT NULL DEFAULT '0',
  `meta_data` longtext COLLATE utf8mb4_unicode_ci,
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjoptions`
--

CREATE TABLE IF NOT EXISTS `wp_mjoptions` (
  `option_id` bigint(20) unsigned NOT NULL,
  `option_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `wp_mjoptions`
--

INSERT INTO `wp_mjoptions` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wpmj', 'yes'),
(2, 'home', 'http://localhost/wpmj', 'yes'),
(3, 'blogname', 'Meddy Johnson', 'yes'),
(4, 'blogdescription', 'un artiste éclectique', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'johnson.meddy@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'G \\h i \\m\\i\\n', 'yes'),
(25, 'links_updated_date_format', 'j F Y G \\h i \\m\\i\\n', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:1:{i:0;s:29:"nextgen-gallery/nggallery.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '1', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', '', 'no'),
(41, 'template', 'make', 'yes'),
(42, 'stylesheet', 'make', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '33056', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '0', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'posts', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(82, 'uninstall_plugins', 'a:1:{s:29:"gallery-bank/gallery-bank.php";s:40:"plugin_uninstall_script_for_gallery_bank";}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '0', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'finished_splitting_shared_terms', '1', 'yes'),
(89, 'initial_db_version', '33056', 'yes'),
(90, 'wp_mjuser_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:72:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:24:"NextGEN Gallery overview";b:1;s:19:"NextGEN Use TinyMCE";b:1;s:21:"NextGEN Upload images";b:1;s:22:"NextGEN Manage gallery";b:1;s:19:"NextGEN Manage tags";b:1;s:29:"NextGEN Manage others gallery";b:1;s:18:"NextGEN Edit album";b:1;s:20:"NextGEN Change style";b:1;s:22:"NextGEN Change options";b:1;s:24:"NextGEN Attach Interface";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(91, 'WPLANG', 'fr_FR', 'yes'),
(92, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'sidebars_widgets', 'a:8:{s:19:"wp_inactive_widgets";a:0:{}s:12:"sidebar-left";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"sidebar-right";N;s:8:"footer-1";a:0:{}s:8:"footer-2";N;s:8:"footer-3";N;s:8:"footer-4";N;s:13:"array_version";i:3;}', 'yes'),
(99, 'cron', 'a:6:{i:1449052450;a:1:{s:29:"ngg_delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"ngg_custom";s:4:"args";a:0:{}s:8:"interval";i:900;}}}i:1449066599;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1449066648;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1449079740;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1449132726;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(114, '_site_transient_timeout_browser_c4ad11723f9adaddd6e43884d917b605', '1449585048', 'yes'),
(115, '_site_transient_browser_c4ad11723f9adaddd6e43884d917b605', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"46.0.2490.86";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(121, 'can_compress_scripts', '1', 'yes'),
(134, 'theme_mods_twentyfifteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1448980446;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(135, 'current_theme', 'Make', 'yes'),
(136, 'theme_mods_make', 'a:41:{i:0;b:0;s:16:"background_image";s:0:"";s:17:"background_repeat";s:6:"repeat";s:21:"background_position_x";s:12:"bottom-right";s:21:"background_attachment";s:5:"fixed";s:23:"header-background-image";s:0:"";s:21:"main-background-image";s:57:"http://localhost/wpmj/wp-content/uploads/2015/12/wrap.jpg";s:22:"main-background-repeat";s:6:"repeat";s:26:"main-background-attachment";s:6:"scroll";s:20:"main-background-size";s:5:"cover";s:23:"footer-background-image";s:0:"";s:28:"footer-background-attachment";s:6:"scroll";s:22:"footer-background-size";s:7:"contain";s:18:"nav_menu_locations";a:3:{s:7:"primary";i:2;s:6:"social";i:0;s:10:"header-bar";i:0;}s:15:"background_size";s:5:"cover";s:24:"social-facebook-official";s:39:"https://www.facebook.com/meddy.johnson/";s:14:"social-twitter";s:27:"https://twitter.com/Meddy_J";s:25:"social-google-plus-square";s:49:"https://plus.google.com/u/0/111224917723285270133";s:16:"social-instagram";s:34:"https://www.instagram.com/meddy_j/";s:14:"social-youtube";s:61:"https://www.youtube.com/channel/UCKCZlfO8Jd7A9NeGvx4C7Ww/feed";s:17:"footer-text-color";s:7:"#ededed";s:23:"footer-background-color";s:7:"#000000";s:31:"footer-background-color-opacity";d:1;s:12:"logo-regular";s:61:"http://localhost/wpmj/wp-content/uploads/2015/12/logotmjs.jpg";s:12:"social-email";s:23:"johnson.meddy@gmail.com";s:15:"social-hide-rss";i:1;s:23:"layout-page-hide-header";i:0;s:23:"layout-page-hide-footer";i:0;s:25:"layout-page-sidebar-right";i:0;s:19:"footer-widget-areas";s:1:"0";s:13:"footer-layout";s:1:"1";s:23:"footer-hide-padding-top";i:0;s:11:"footer-text";s:31:"Copyright Kira &amp; Meddy 2015";s:21:"font-size-footer-icon";i:25;s:13:"header-layout";s:1:"3";s:24:"header-branding-position";s:4:"left";s:25:"header-bar-content-layout";s:7:"default";s:26:"header-hide-padding-bottom";i:0;s:18:"header-show-social";i:0;s:19:"footer-border-color";s:7:"#0c0c0c";s:23:"footer-link-hover-color";b:0;}', 'yes'),
(137, 'theme_switched', '', 'yes'),
(138, 'widget_calendar', 'a:3:{i:1;a:0:{}s:12:"_multiwidget";i:1;i:3;a:0:{}}', 'yes'),
(140, 'widget_nav_menu', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(141, 'widget_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(142, 'widget_pages', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(146, 'nav_menu_options', 'a:1:{s:8:"auto_add";a:0:{}}', 'yes'),
(173, 'site_icon', '16', 'yes'),
(178, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/fr_FR/wordpress-4.3.1.zip";s:6:"locale";s:5:"fr_FR";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/fr_FR/wordpress-4.3.1.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.3.1";s:7:"version";s:5:"4.3.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1449047490;s:15:"version_checked";s:5:"4.3.1";s:12:"translations";a:0:{}}', 'yes'),
(180, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1449047492;s:7:"checked";a:4:{s:4:"make";s:5:"1.6.6";s:13:"twentyfifteen";s:3:"1.3";s:14:"twentyfourteen";s:3:"1.5";s:14:"twentythirteen";s:3:"1.6";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(185, '_site_transient_timeout_theme_roots', '1449047991', 'yes'),
(186, '_site_transient_theme_roots', 'a:4:{s:4:"make";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'yes'),
(214, '_site_transient_timeout_available_translations', '1449057686', 'yes'),
(215, '_site_transient_available_translations', 'a:69:{s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-18 00:32:07";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:3:"ary";a:8:{s:8:"language";s:3:"ary";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-27 20:45:33";s:12:"english_name";s:15:"Moroccan Arabic";s:11:"native_name";s:31:"العربية المغربية";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.3.1/ary.zip";s:3:"iso";a:2:{i:1;s:5:"ar_MA";i:3;s:3:"ary";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-22 14:16:17";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-25 14:32:58";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bn_BD";a:8:{s:8:"language";s:5:"bn_BD";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-16 05:09:40";s:12:"english_name";s:7:"Bengali";s:11:"native_name";s:15:"বাংলা";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/bn_BD.zip";s:3:"iso";a:1:{i:1;s:2:"bn";}s:7:"strings";a:1:{s:8:"continue";s:23:"এগিয়ে চল.";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-18 21:20:44";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-07 03:25:59";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-19 09:17:13";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-18 19:34:34";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-02 05:19:03";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:12:"de_DE_formal";a:8:{s:8:"language";s:12:"de_DE_formal";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-12-01 08:58:06";s:12:"english_name";s:15:"German (Formal)";s:11:"native_name";s:13:"Deutsch (Sie)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/4.3.1/de_DE_formal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-12-01 09:00:55";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-11-29 18:40:51";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_NZ";a:8:{s:8:"language";s:5:"en_NZ";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-17 22:20:50";s:12:"english_name";s:21:"English (New Zealand)";s:11:"native_name";s:21:"English (New Zealand)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/en_NZ.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-17 20:57:21";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-14 00:38:16";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_ZA";a:8:{s:8:"language";s:5:"en_ZA";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-11-24 06:32:23";s:12:"english_name";s:22:"English (South Africa)";s:11:"native_name";s:22:"English (South Africa)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/en_ZA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-13 23:56:05";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-16 10:50:33";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-26 22:31:40";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/es_ES.zip";s:3:"iso";a:1:{i:1;s:2:"es";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-30 19:20:19";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/es_MX.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-19 14:33:57";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/es_PE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-26 19:53:52";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/es_CL.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CO";a:8:{s:8:"language";s:5:"es_CO";s:7:"version";s:6:"4.3-RC";s:7:"updated";s:19:"2015-08-04 06:10:33";s:12:"english_name";s:18:"Spanish (Colombia)";s:11:"native_name";s:20:"Español de Colombia";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.3-RC/es_CO.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_VE";a:8:{s:8:"language";s:5:"es_VE";s:7:"version";s:5:"4.2.5";s:7:"updated";s:19:"2015-10-29 16:32:18";s:12:"english_name";s:19:"Spanish (Venezuela)";s:11:"native_name";s:21:"Español de Venezuela";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.2.5/es_VE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"et";a:8:{s:8:"language";s:2:"et";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-05 16:34:02";s:12:"english_name";s:8:"Estonian";s:11:"native_name";s:5:"Eesti";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/et.zip";s:3:"iso";a:2:{i:1;s:2:"et";i:2;s:3:"est";}s:7:"strings";a:1:{s:8:"continue";s:6:"Jätka";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-12 17:21:08";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-20 13:36:08";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-15 15:41:04";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_BE";a:8:{s:8:"language";s:5:"fr_BE";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-06 20:37:24";s:12:"english_name";s:16:"French (Belgium)";s:11:"native_name";s:21:"Français de Belgique";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/fr_BE.zip";s:3:"iso";a:2:{i:1;s:2:"fr";i:2;s:3:"fra";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-11-09 14:35:27";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-24 15:25:30";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-18 23:34:00";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:5:"4.1.8";s:7:"updated";s:19:"2015-03-26 15:20:27";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1.8/haz.zip";s:3:"iso";a:1:{i:3;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-22 08:59:41";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:5:"hi_IN";a:8:{s:8:"language";s:5:"hi_IN";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-11-20 14:39:18";s:12:"english_name";s:5:"Hindi";s:11:"native_name";s:18:"हिन्दी";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/hi_IN.zip";s:3:"iso";a:2:{i:1;s:2:"hi";i:2;s:3:"hin";}s:7:"strings";a:1:{s:8:"continue";s:12:"जारी";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-11-04 22:14:16";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-11-15 12:00:25";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:2:"hy";a:8:{s:8:"language";s:2:"hy";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-17 13:36:47";s:12:"english_name";s:8:"Armenian";s:11:"native_name";s:14:"Հայերեն";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/hy.zip";s:3:"iso";a:2:{i:1;s:2:"hy";i:2;s:3:"hye";}s:7:"strings";a:1:{s:8:"continue";s:20:"Շարունակել";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-11-24 08:17:28";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"is_IS";a:8:{s:8:"language";s:5:"is_IS";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-22 13:47:37";s:12:"english_name";s:9:"Icelandic";s:11:"native_name";s:9:"Íslenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/is_IS.zip";s:3:"iso";a:2:{i:1;s:2:"is";i:2;s:3:"isl";}s:7:"strings";a:1:{s:8:"continue";s:6:"Áfram";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-06 06:16:37";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-30 16:23:05";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-11-06 04:24:53";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-18 07:48:28";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:5:"4.1.8";s:7:"updated";s:19:"2015-03-26 15:57:42";s:12:"english_name";s:17:"Myanmar (Burmese)";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.8/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-23 10:49:34";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-28 15:14:19";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nn_NO";a:8:{s:8:"language";s:5:"nn_NO";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-17 18:56:13";s:12:"english_name";s:19:"Norwegian (Nynorsk)";s:11:"native_name";s:13:"Norsk nynorsk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/nn_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nn";i:2;s:3:"nno";}s:7:"strings";a:1:{s:8:"continue";s:9:"Hald fram";}}s:3:"oci";a:8:{s:8:"language";s:3:"oci";s:7:"version";s:6:"4.3-RC";s:7:"updated";s:19:"2015-08-02 07:53:33";s:12:"english_name";s:7:"Occitan";s:11:"native_name";s:7:"Occitan";s:7:"package";s:63:"https://downloads.wordpress.org/translation/core/4.3-RC/oci.zip";s:3:"iso";a:2:{i:1;s:2:"oc";i:2;s:3:"oci";}s:7:"strings";a:1:{s:8:"continue";s:9:"Contunhar";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-27 13:38:57";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:2:"ps";a:8:{s:8:"language";s:2:"ps";s:7:"version";s:5:"4.1.8";s:7:"updated";s:19:"2015-03-29 22:19:48";s:12:"english_name";s:6:"Pashto";s:11:"native_name";s:8:"پښتو";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.8/ps.zip";s:3:"iso";a:2:{i:1;s:2:"ps";i:2;s:3:"pus";}s:7:"strings";a:1:{s:8:"continue";s:8:"دوام";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-11-27 16:41:01";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-11-05 03:15:53";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-18 16:44:05";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-03 10:08:50";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-20 09:27:40";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-06 16:10:24";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:10:"Nadaljujte";}}s:2:"sq";a:8:{s:8:"language";s:2:"sq";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-27 07:05:44";s:12:"english_name";s:8:"Albanian";s:11:"native_name";s:5:"Shqip";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/sq.zip";s:3:"iso";a:2:{i:1;s:2:"sq";i:2;s:3:"sqi";}s:7:"strings";a:1:{s:8:"continue";s:6:"Vazhdo";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-17 18:31:56";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-19 10:43:45";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-11-08 12:30:32";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:2:"tl";a:8:{s:8:"language";s:2:"tl";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-20 03:52:15";s:12:"english_name";s:7:"Tagalog";s:11:"native_name";s:7:"Tagalog";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/tl.zip";s:3:"iso";a:2:{i:1;s:2:"tl";i:2;s:3:"tgl";}s:7:"strings";a:1:{s:8:"continue";s:10:"Magpatuloy";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-19 13:55:59";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"ug_CN";a:8:{s:8:"language";s:5:"ug_CN";s:7:"version";s:5:"4.1.8";s:7:"updated";s:19:"2015-03-26 16:45:38";s:12:"english_name";s:6:"Uighur";s:11:"native_name";s:9:"Uyƣurqə";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.8/ug_CN.zip";s:3:"iso";a:2:{i:1;s:2:"ug";i:2;s:3:"uig";}s:7:"strings";a:1:{s:8:"continue";s:26:"داۋاملاشتۇرۇش";}}s:2:"uk";a:8:{s:8:"language";s:2:"uk";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-10-08 09:34:14";s:12:"english_name";s:9:"Ukrainian";s:11:"native_name";s:20:"Українська";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/uk.zip";s:3:"iso";a:2:{i:1;s:2:"uk";i:2;s:3:"ukr";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продовжити";}}s:2:"vi";a:8:{s:8:"language";s:2:"vi";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-11-27 09:19:03";s:12:"english_name";s:10:"Vietnamese";s:11:"native_name";s:14:"Tiếng Việt";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.3.1/vi.zip";s:3:"iso";a:2:{i:1;s:2:"vi";i:2;s:3:"vie";}s:7:"strings";a:1:{s:8:"continue";s:12:"Tiếp tục";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-09-21 11:18:12";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:5:"4.3.1";s:7:"updated";s:19:"2015-08-20 19:10:20";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.3.1/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}}', 'yes'),
(216, 'rewrite_rules', 'a:70:{s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(229, 'recently_activated', 'a:1:{s:29:"gallery-bank/gallery-bank.php";i:1449047309;}', 'yes'),
(230, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1449057873', 'yes');
INSERT INTO `wp_mjoptions` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(231, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:100:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"5590";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3496";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3442";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"2953";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2691";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"2153";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"2143";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1967";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1927";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1908";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1902";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1859";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1755";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1564";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1481";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1454";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:4:"1339";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1272";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1243";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1221";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:4:"1117";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:4:"1048";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:4:"1011";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"968";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"928";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"898";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"864";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"856";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:3:"856";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"855";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"831";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"792";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"754";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"723";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"717";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"717";}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";s:3:"716";}s:10:"responsive";a:3:{s:4:"name";s:10:"responsive";s:4:"slug";s:10:"responsive";s:5:"count";s:3:"711";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"705";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"696";}s:5:"share";a:3:{s:4:"name";s:5:"Share";s:4:"slug";s:5:"share";s:5:"count";s:3:"694";}s:10:"e-commerce";a:3:{s:4:"name";s:10:"e-commerce";s:4:"slug";s:10:"e-commerce";s:5:"count";s:3:"678";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"671";}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";s:3:"664";}s:5:"embed";a:3:{s:4:"name";s:5:"embed";s:4:"slug";s:5:"embed";s:5:"count";s:3:"638";}s:9:"analytics";a:3:{s:4:"name";s:9:"analytics";s:4:"slug";s:9:"analytics";s:5:"count";s:3:"638";}s:4:"form";a:3:{s:4:"name";s:4:"form";s:4:"slug";s:4:"form";s:5:"count";s:3:"628";}s:3:"css";a:3:{s:4:"name";s:3:"CSS";s:4:"slug";s:3:"css";s:5:"count";s:3:"624";}s:6:"search";a:3:{s:4:"name";s:6:"search";s:4:"slug";s:6:"search";s:5:"count";s:3:"621";}s:9:"slideshow";a:3:{s:4:"name";s:9:"slideshow";s:4:"slug";s:9:"slideshow";s:5:"count";s:3:"618";}s:6:"custom";a:3:{s:4:"name";s:6:"custom";s:4:"slug";s:6:"custom";s:5:"count";s:3:"593";}s:5:"stats";a:3:{s:4:"name";s:5:"stats";s:4:"slug";s:5:"stats";s:5:"count";s:3:"588";}s:6:"slider";a:3:{s:4:"name";s:6:"slider";s:4:"slug";s:6:"slider";s:5:"count";s:3:"580";}s:7:"comment";a:3:{s:4:"name";s:7:"comment";s:4:"slug";s:7:"comment";s:5:"count";s:3:"575";}s:6:"button";a:3:{s:4:"name";s:6:"button";s:4:"slug";s:6:"button";s:5:"count";s:3:"569";}s:4:"menu";a:3:{s:4:"name";s:4:"menu";s:4:"slug";s:4:"menu";s:5:"count";s:3:"566";}s:5:"theme";a:3:{s:4:"name";s:5:"theme";s:4:"slug";s:5:"theme";s:5:"count";s:3:"564";}s:4:"tags";a:3:{s:4:"name";s:4:"tags";s:4:"slug";s:4:"tags";s:5:"count";s:3:"562";}s:9:"dashboard";a:3:{s:4:"name";s:9:"dashboard";s:4:"slug";s:9:"dashboard";s:5:"count";s:3:"558";}s:10:"categories";a:3:{s:4:"name";s:10:"categories";s:4:"slug";s:10:"categories";s:5:"count";s:3:"551";}s:10:"statistics";a:3:{s:4:"name";s:10:"statistics";s:4:"slug";s:10:"statistics";s:5:"count";s:3:"537";}s:3:"ads";a:3:{s:4:"name";s:3:"ads";s:4:"slug";s:3:"ads";s:5:"count";s:3:"524";}s:6:"mobile";a:3:{s:4:"name";s:6:"mobile";s:4:"slug";s:6:"mobile";s:5:"count";s:3:"520";}s:4:"user";a:3:{s:4:"name";s:4:"user";s:4:"slug";s:4:"user";s:5:"count";s:3:"512";}s:6:"editor";a:3:{s:4:"name";s:6:"editor";s:4:"slug";s:6:"editor";s:5:"count";s:3:"509";}s:5:"users";a:3:{s:4:"name";s:5:"users";s:4:"slug";s:5:"users";s:5:"count";s:3:"498";}s:7:"picture";a:3:{s:4:"name";s:7:"picture";s:4:"slug";s:7:"picture";s:5:"count";s:3:"497";}s:4:"list";a:3:{s:4:"name";s:4:"list";s:4:"slug";s:4:"list";s:5:"count";s:3:"494";}s:7:"plugins";a:3:{s:4:"name";s:7:"plugins";s:4:"slug";s:7:"plugins";s:5:"count";s:3:"493";}s:9:"affiliate";a:3:{s:4:"name";s:9:"affiliate";s:4:"slug";s:9:"affiliate";s:5:"count";s:3:"489";}s:9:"multisite";a:3:{s:4:"name";s:9:"multisite";s:4:"slug";s:9:"multisite";s:5:"count";s:3:"464";}s:6:"simple";a:3:{s:4:"name";s:6:"simple";s:4:"slug";s:6:"simple";s:5:"count";s:3:"461";}s:12:"contact-form";a:3:{s:4:"name";s:12:"contact form";s:4:"slug";s:12:"contact-form";s:5:"count";s:3:"453";}s:8:"pictures";a:3:{s:4:"name";s:8:"pictures";s:4:"slug";s:8:"pictures";s:5:"count";s:3:"448";}s:7:"contact";a:3:{s:4:"name";s:7:"contact";s:4:"slug";s:7:"contact";s:5:"count";s:3:"442";}s:12:"social-media";a:3:{s:4:"name";s:12:"social media";s:4:"slug";s:12:"social-media";s:5:"count";s:3:"442";}s:10:"navigation";a:3:{s:4:"name";s:10:"navigation";s:4:"slug";s:10:"navigation";s:5:"count";s:3:"425";}s:5:"flash";a:3:{s:4:"name";s:5:"flash";s:4:"slug";s:5:"flash";s:5:"count";s:3:"420";}s:3:"url";a:3:{s:4:"name";s:3:"url";s:4:"slug";s:3:"url";s:5:"count";s:3:"414";}s:4:"html";a:3:{s:4:"name";s:4:"html";s:4:"slug";s:4:"html";s:5:"count";s:3:"413";}s:10:"newsletter";a:3:{s:4:"name";s:10:"newsletter";s:4:"slug";s:10:"newsletter";s:5:"count";s:3:"406";}s:3:"api";a:3:{s:4:"name";s:3:"api";s:4:"slug";s:3:"api";s:5:"count";s:3:"406";}s:4:"shop";a:3:{s:4:"name";s:4:"shop";s:4:"slug";s:4:"shop";s:5:"count";s:3:"400";}s:4:"meta";a:3:{s:4:"name";s:4:"meta";s:4:"slug";s:4:"meta";s:5:"count";s:3:"396";}s:4:"news";a:3:{s:4:"name";s:4:"News";s:4:"slug";s:4:"news";s:5:"count";s:3:"393";}s:9:"marketing";a:3:{s:4:"name";s:9:"marketing";s:4:"slug";s:9:"marketing";s:5:"count";s:3:"392";}s:3:"tag";a:3:{s:4:"name";s:3:"tag";s:4:"slug";s:3:"tag";s:5:"count";s:3:"390";}s:6:"events";a:3:{s:4:"name";s:6:"events";s:4:"slug";s:6:"events";s:5:"count";s:3:"385";}s:8:"tracking";a:3:{s:4:"name";s:8:"tracking";s:4:"slug";s:8:"tracking";s:5:"count";s:3:"382";}s:8:"calendar";a:3:{s:4:"name";s:8:"calendar";s:4:"slug";s:8:"calendar";s:5:"count";s:3:"380";}s:9:"thumbnail";a:3:{s:4:"name";s:9:"thumbnail";s:4:"slug";s:9:"thumbnail";s:5:"count";s:3:"379";}s:11:"advertising";a:3:{s:4:"name";s:11:"advertising";s:4:"slug";s:11:"advertising";s:5:"count";s:3:"377";}s:4:"text";a:3:{s:4:"name";s:4:"text";s:4:"slug";s:4:"text";s:5:"count";s:3:"376";}s:4:"code";a:3:{s:4:"name";s:4:"code";s:4:"slug";s:4:"code";s:5:"count";s:3:"374";}s:8:"lightbox";a:3:{s:4:"name";s:8:"lightbox";s:4:"slug";s:8:"lightbox";s:5:"count";s:3:"368";}s:6:"upload";a:3:{s:4:"name";s:6:"upload";s:4:"slug";s:6:"upload";s:5:"count";s:3:"368";}s:10:"shortcodes";a:3:{s:4:"name";s:10:"shortcodes";s:4:"slug";s:10:"shortcodes";s:5:"count";s:3:"365";}s:9:"automatic";a:3:{s:4:"name";s:9:"automatic";s:4:"slug";s:9:"automatic";s:5:"count";s:3:"363";}s:7:"profile";a:3:{s:4:"name";s:7:"profile";s:4:"slug";s:7:"profile";s:5:"count";s:3:"361";}s:7:"sharing";a:3:{s:4:"name";s:7:"sharing";s:4:"slug";s:7:"sharing";s:5:"count";s:3:"360";}}', 'yes'),
(233, 'gallery-bank-updation-check-url', 'http://tech-banker.com/wp-admin/admin-ajax.php', 'yes'),
(234, 'gallery-bank-pro-edition', '3.1', 'yes'),
(235, 'gallery-bank-automatic_update', '1', 'yes'),
(237, 'gallery-bank-demo', '1', 'yes'),
(239, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1449047937;s:7:"checked";a:3:{s:19:"akismet/akismet.php";s:5:"3.1.5";s:9:"hello.php";s:3:"1.6";s:29:"nextgen-gallery/nggallery.php";s:6:"2.1.15";}s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:3:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.1.5";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.1.5.zip";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}s:29:"nextgen-gallery/nggallery.php";O:8:"stdClass":6:{s:2:"id";s:3:"592";s:4:"slug";s:15:"nextgen-gallery";s:6:"plugin";s:29:"nextgen-gallery/nggallery.php";s:11:"new_version";s:6:"2.1.15";s:3:"url";s:46:"https://wordpress.org/plugins/nextgen-gallery/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/nextgen-gallery.2.1.15.zip";}}}', 'yes'),
(240, 'ngg_transient_groups', 'a:6:{s:9:"__counter";i:6;s:3:"MVC";a:2:{s:2:"id";i:2;s:7:"enabled";b:1;}s:17:"col_in_wp_mjposts";a:2:{s:2:"id";i:3;s:7:"enabled";b:1;}s:23:"col_in_wp_mjngg_gallery";a:2:{s:2:"id";i:4;s:7:"enabled";b:1;}s:21:"col_in_wp_mjngg_album";a:2:{s:2:"id";i:5;s:7:"enabled";b:1;}s:24:"col_in_wp_mjngg_pictures";a:2:{s:2:"id";i:6;s:7:"enabled";b:1;}}', 'yes'),
(241, 'ngg_options', 'a:70:{s:11:"gallerypath";s:19:"wp-content\\gallery\\";s:11:"wpmuCSSfile";s:13:"nggallery.css";s:9:"wpmuStyle";b:0;s:9:"wpmuRoles";b:0;s:16:"wpmuImportFolder";b:0;s:13:"wpmuZipUpload";b:0;s:14:"wpmuQuotaCheck";b:0;s:17:"datamapper_driver";s:22:"custom_post_datamapper";s:21:"gallerystorage_driver";s:25:"ngglegacy_gallery_storage";s:20:"maximum_entity_count";i:500;s:17:"router_param_slug";s:9:"nggallery";s:22:"router_param_separator";s:2:"--";s:19:"router_param_prefix";s:0:"";s:9:"deleteImg";b:1;s:9:"swfUpload";b:1;s:13:"usePermalinks";b:0;s:13:"permalinkSlug";s:9:"nggallery";s:14:"graphicLibrary";s:2:"gd";s:14:"imageMagickDir";s:15:"/usr/local/bin/";s:11:"useMediaRSS";b:0;s:18:"galleries_in_feeds";b:0;s:12:"activateTags";i:0;s:10:"appendType";s:4:"tags";s:9:"maxImages";i:7;s:14:"relatedHeading";s:23:"<h3>Images liées:</h3>";s:10:"thumbwidth";i:240;s:11:"thumbheight";i:160;s:8:"thumbfix";b:1;s:12:"thumbquality";i:100;s:8:"imgWidth";i:800;s:9:"imgHeight";i:600;s:10:"imgQuality";i:100;s:9:"imgBackup";b:1;s:13:"imgAutoResize";b:0;s:9:"galImages";s:2:"20";s:17:"galPagedGalleries";i:0;s:10:"galColumns";i:0;s:12:"galShowSlide";b:1;s:12:"galTextSlide";s:33:"[Montrer sous forme de diaporama]";s:14:"galTextGallery";s:33:"[Montrer sous forme de vignettes]";s:12:"galShowOrder";s:7:"gallery";s:7:"galSort";s:9:"sortorder";s:10:"galSortDir";s:3:"ASC";s:10:"galNoPages";b:1;s:13:"galImgBrowser";i:0;s:12:"galHiddenImg";i:0;s:10:"galAjaxNav";i:0;s:11:"thumbEffect";s:8:"fancybox";s:9:"thumbCode";s:41:"class="ngg-fancybox" rel="%GALLERY_NAME%"";s:18:"thumbEffectContext";s:14:"nextgen_images";s:5:"wmPos";s:8:"botRight";s:6:"wmXpos";i:5;s:6:"wmYpos";i:5;s:6:"wmType";i:0;s:6:"wmPath";s:0:"";s:6:"wmFont";s:9:"arial.ttf";s:6:"wmSize";i:10;s:6:"wmText";s:13:"Meddy Johnson";s:7:"wmColor";s:6:"000000";s:8:"wmOpaque";s:3:"100";s:7:"slideFX";s:4:"fade";s:7:"irWidth";i:600;s:8:"irHeight";i:400;s:12:"irRotatetime";i:10;s:11:"activateCSS";i:1;s:7:"CSSfile";s:13:"nggallery.css";s:28:"always_enable_frontend_logic";b:0;s:22:"dynamic_thumbnail_slug";s:13:"nextgen-image";s:23:"dynamic_stylesheet_slug";s:12:"nextgen-dcss";s:11:"installDate";i:1449048909;}', 'yes'),
(243, 'photocrati_auto_update_admin_update_list', '', 'yes'),
(244, 'photocrati_auto_update_admin_check_date', '', 'yes'),
(245, 'ngg_db_version', '1.8.1', 'yes'),
(262, 'pope_module_list', 'a:34:{i:0;s:17:"photocrati-fs|0.4";i:1;s:19:"photocrati-i18n|0.1";i:2;s:25:"photocrati-validation|0.1";i:3;s:21:"photocrati-router|0.7";i:4;s:32:"photocrati-wordpress_routing|0.6";i:5;s:23:"photocrati-security|0.2";i:6;s:31:"photocrati-nextgen_settings|0.9";i:7;s:18:"photocrati-mvc|0.5";i:8;s:19:"photocrati-ajax|0.8";i:9;s:25:"photocrati-datamapper|0.8";i:10;s:30:"photocrati-nextgen-legacy|0.14";i:11;s:28:"photocrati-nextgen-data|0.10";i:12;s:33:"photocrati-dynamic_thumbnails|0.6";i:13;s:28:"photocrati-nextgen_admin|0.9";i:14;s:39:"photocrati-nextgen_gallery_display|0.13";i:15;s:34:"photocrati-frame_communication|0.4";i:16;s:30:"photocrati-attach_to_post|0.11";i:17;s:38:"photocrati-nextgen_addgallery_page|0.6";i:18;s:36:"photocrati-nextgen_other_options|0.8";i:19;s:33:"photocrati-nextgen_pagination|0.3";i:20;s:33:"photocrati-dynamic_stylesheet|0.3";i:21;s:34:"photocrati-nextgen_pro_upgrade|0.4";i:22;s:20:"photocrati-cache|0.2";i:23;s:24:"photocrati-lightbox|0.14";i:24;s:38:"photocrati-nextgen_basic_templates|0.5";i:25;s:37:"photocrati-nextgen_basic_gallery|0.13";i:26;s:42:"photocrati-nextgen_basic_imagebrowser|0.10";i:27;s:39:"photocrati-nextgen_basic_singlepic|0.11";i:28;s:38:"photocrati-nextgen_basic_tagcloud|0.11";i:29;s:35:"photocrati-nextgen_basic_album|0.10";i:30;s:21:"photocrati-widget|0.5";i:31;s:33:"photocrati-third_party_compat|0.4";i:32;s:29:"photocrati-nextgen_xmlrpc|0.4";i:33;s:20:"photocrati-wpcli|0.1";}', 'yes'),
(329, '_transient_timeout_ttfmake-571841b6e0a862e9eb98d23a338c0784', '1449137988', 'no'),
(330, '_transient_ttfmake-571841b6e0a862e9eb98d23a338c0784', 'a:2:{s:5:"width";i:960;s:6:"height";i:960;}', 'no'),
(331, '_transient_timeout_2__974818834', '1449053629', 'no'),
(332, '_transient_2__974818834', '{"photocrati-ajax#ajax.min.js||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/ajax\\/static\\/ajax.min.js","photocrati-nextgen_admin#gritter\\/gritter.min.js||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/gritter\\/gritter.min.js","photocrati-nextgen_admin#gritter\\/css\\/gritter.css||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/gritter\\/css\\/gritter.min.css","photocrati-nextgen_admin#ngg_progressbar.js||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/ngg_progressbar.min.js","photocrati-nextgen_admin#ngg_progressbar.css||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/ngg_progressbar.min.css","photocrati-nextgen_admin#select2\\/select2.css||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/select2\\/select2.min.css","photocrati-nextgen_admin#select2\\/select2.modded.js||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/select2\\/select2.modded.min.js","photocrati-nextgen_admin#jquery.nextgen_radio_toggle.js||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/jquery.nextgen_radio_toggle.min.js","photocrati-nextgen_admin#jquery-ui\\/jquery-ui-1.10.4.custom.css||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_admin\\/static\\/jquery-ui\\/jquery-ui-1.10.4.custom.min.css","photocrati-frame_communication#frame_event_publisher.js||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/frame_communication\\/static\\/frame_event_publisher.min.js","photocrati-nextgen_gallery_display#nextgen_gallery_display_settings.js||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/nextgen_gallery_display_settings.min.js","photocrati-nextgen_gallery_display#nextgen_gallery_display_settings.css||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_gallery_display\\/static\\/nextgen_gallery_display_settings.min.css","photocrati-nextgen_addgallery_page#browserplus-2.4.21.min.js||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/browserplus-2.4.21.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/moxie.min.js||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/moxie.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/plupload.dev.min.js||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/plupload.dev.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/jquery.plupload.queue\\/jquery.plupload.queue.min.js||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/jquery.plupload.queue\\/jquery.plupload.queue.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/jquery.plupload.queue\\/css\\/jquery.plupload.queue.css||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/plupload-2.1.1\\/jquery.plupload.queue\\/css\\/jquery.plupload.queue.min.css","photocrati-nextgen_addgallery_page#styles.css||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/styles.min.css","photocrati-nextgen_addgallery_page#jquery.filetree\\/jquery.filetree.js||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/jquery.filetree\\/jquery.filetree.min.js","photocrati-nextgen_addgallery_page#jquery.filetree\\/jquery.filetree.css||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/jquery.filetree\\/jquery.filetree.min.css","photocrati-nextgen_addgallery_page#media-library-import.js||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/media-library-import.min.js","photocrati-nextgen_addgallery_page#media-library-import.css||http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/mu-plugins|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make|http:\\/\\/localhost\\/wpmj\\/wp-content\\/themes\\/make":"http:\\/\\/localhost\\/wpmj\\/wp-content\\/plugins\\/nextgen-gallery\\/products\\/photocrati_nextgen\\/modules\\/nextgen_addgallery_page\\/static\\/media-library-import.min.css"}', 'no'),
(333, '_transient_timeout_2__536483053', '1449053508', 'no'),
(334, '_transient_2__536483053', '{"photocrati-ajax#ajax.min.js|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\ajax\\\\static\\\\ajax.min.js","photocrati-nextgen_admin#gritter\\/gritter.min.js|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_admin\\\\static\\\\gritter\\\\gritter.min.js","photocrati-nextgen_admin#gritter\\/css\\/gritter.css|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_admin\\\\static\\\\gritter\\\\css\\\\gritter.min.css","photocrati-nextgen_admin#ngg_progressbar.js|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_admin\\\\static\\\\ngg_progressbar.min.js","photocrati-nextgen_admin#ngg_progressbar.css|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_admin\\\\static\\\\ngg_progressbar.min.css","photocrati-nextgen_admin#select2\\/select2.css|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_admin\\\\static\\\\select2\\\\select2.min.css","photocrati-nextgen_admin#select2\\/select2.modded.js|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_admin\\\\static\\\\select2\\\\select2.modded.min.js","photocrati-nextgen_admin#jquery.nextgen_radio_toggle.js|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_admin\\\\static\\\\jquery.nextgen_radio_toggle.min.js","photocrati-nextgen_admin#jquery-ui\\/jquery-ui-1.10.4.custom.css|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_admin\\\\static\\\\jquery-ui\\\\jquery-ui-1.10.4.custom.min.css","photocrati-frame_communication#frame_event_publisher.js|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\frame_communication\\\\static\\\\frame_event_publisher.min.js","photocrati-nextgen_gallery_display#nextgen_gallery_display_settings.js|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_gallery_display\\\\static\\\\nextgen_gallery_display_settings.min.js","photocrati-nextgen_gallery_display#nextgen_gallery_display_settings.css|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_gallery_display\\\\static\\\\nextgen_gallery_display_settings.min.css","photocrati-nextgen_addgallery_page#browserplus-2.4.21.min.js|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_addgallery_page\\\\static\\\\browserplus-2.4.21.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/moxie.min.js|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_addgallery_page\\\\static\\\\plupload-2.1.1\\\\moxie.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/plupload.dev.min.js|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_addgallery_page\\\\static\\\\plupload-2.1.1\\\\plupload.dev.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/jquery.plupload.queue\\/jquery.plupload.queue.min.js|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_addgallery_page\\\\static\\\\plupload-2.1.1\\\\jquery.plupload.queue\\\\jquery.plupload.queue.min.js","photocrati-nextgen_addgallery_page#plupload-2.1.1\\/jquery.plupload.queue\\/css\\/jquery.plupload.queue.css|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_addgallery_page\\\\static\\\\plupload-2.1.1\\\\jquery.plupload.queue\\\\css\\\\jquery.plupload.queue.min.css","photocrati-nextgen_addgallery_page#styles.css|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_addgallery_page\\\\static\\\\styles.min.css","photocrati-nextgen_addgallery_page#jquery.filetree\\/jquery.filetree.js|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_addgallery_page\\\\static\\\\jquery.filetree\\\\jquery.filetree.min.js","photocrati-nextgen_addgallery_page#jquery.filetree\\/jquery.filetree.css|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_addgallery_page\\\\static\\\\jquery.filetree\\\\jquery.filetree.min.css","photocrati-nextgen_addgallery_page#media-library-import.js|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_addgallery_page\\\\static\\\\media-library-import.min.js","photocrati-nextgen_addgallery_page#media-library-import.css|0":"C:\\\\xampp\\\\htdocs\\\\wpmj\\\\wp-content\\\\plugins\\\\nextgen-gallery\\\\products\\\\photocrati_nextgen\\\\modules\\\\nextgen_addgallery_page\\\\static\\\\media-library-import.min.css"}', 'no');

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjpostmeta`
--

CREATE TABLE IF NOT EXISTS `wp_mjpostmeta` (
  `meta_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `wp_mjpostmeta`
--

INSERT INTO `wp_mjpostmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 4, '_wp_attached_file', '2015/12/rideau-theatre-marseille1.jpg'),
(3, 4, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:3600;s:6:"height";i:2400;s:4:"file";s:37:"2015/12/rideau-theatre-marseille1.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:37:"rideau-theatre-marseille1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:37:"rideau-theatre-marseille1-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:38:"rideau-theatre-marseille1-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:18:"Frog 974 - Fotolia";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(4, 4, '_wp_attachment_image_alt', 'curtain'),
(5, 5, '_wp_attached_file', '2015/12/wrap.jpg'),
(6, 5, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1600;s:6:"height";i:709;s:4:"file";s:16:"2015/12/wrap.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:16:"wrap-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:16:"wrap-300x133.jpg";s:5:"width";i:300;s:6:"height";i:133;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:17:"wrap-1024x454.jpg";s:5:"width";i:1024;s:6:"height";i:454;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:1;}}'),
(7, 5, '_wp_attachment_is_custom_background', 'make'),
(8, 6, '_menu_item_type', 'post_type'),
(9, 6, '_menu_item_menu_item_parent', '0'),
(10, 6, '_menu_item_object_id', '2'),
(11, 6, '_menu_item_object', 'page'),
(12, 6, '_menu_item_target', ''),
(13, 6, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(14, 6, '_menu_item_xfn', ''),
(15, 6, '_menu_item_url', ''),
(24, 8, '_menu_item_type', 'post_type'),
(25, 8, '_menu_item_menu_item_parent', '0'),
(26, 8, '_menu_item_object_id', '2'),
(27, 8, '_menu_item_object', 'page'),
(28, 8, '_menu_item_target', ''),
(29, 8, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(30, 8, '_menu_item_xfn', ''),
(31, 8, '_menu_item_url', ''),
(32, 9, '_menu_item_type', 'post_type'),
(33, 9, '_menu_item_menu_item_parent', '0'),
(34, 9, '_menu_item_object_id', '2'),
(35, 9, '_menu_item_object', 'page'),
(36, 9, '_menu_item_target', ''),
(37, 9, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(38, 9, '_menu_item_xfn', ''),
(39, 9, '_menu_item_url', ''),
(40, 10, '_menu_item_type', 'post_type'),
(41, 10, '_menu_item_menu_item_parent', '0'),
(42, 10, '_menu_item_object_id', '2'),
(43, 10, '_menu_item_object', 'page'),
(44, 10, '_menu_item_target', ''),
(45, 10, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(46, 10, '_menu_item_xfn', ''),
(47, 10, '_menu_item_url', ''),
(48, 11, '_wp_attached_file', '2015/12/music2-e1448982998451.gif'),
(49, 11, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:365;s:6:"height";i:350;s:4:"file";s:33:"2015/12/music2-e1448982998451.gif";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:33:"music2-e1448982998451-150x150.gif";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/gif";}s:6:"medium";a:4:{s:4:"file";s:33:"music2-e1448982998451-300x288.gif";s:5:"width";i:300;s:6:"height";i:288;s:9:"mime-type";s:9:"image/gif";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(50, 11, '_edit_lock', '1448983343:1'),
(51, 11, '_edit_last', '1'),
(52, 11, '_wp_attachment_backup_sizes', 'a:4:{s:14:"thumbnail-orig";a:4:{s:4:"file";s:18:"music2-150x150.gif";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/gif";}s:9:"full-orig";a:3:{s:5:"width";i:400;s:6:"height";i:392;s:4:"file";s:10:"music2.gif";}s:23:"thumbnail-1448982998451";a:4:{s:4:"file";s:33:"music2-e1448982885240-150x146.gif";s:5:"width";i:150;s:6:"height";i:146;s:9:"mime-type";s:9:"image/gif";}s:11:"medium-orig";a:4:{s:4:"file";s:18:"music2-300x294.gif";s:5:"width";i:300;s:6:"height";i:294;s:9:"mime-type";s:9:"image/gif";}}'),
(53, 2, '_edit_lock', '1449046424:1'),
(54, 2, '_oembed_f53a715b807054f2b808cfc64b5afeb8', '<iframe width="620" height="349" src="https://www.youtube.com/embed/BbHkcw4IMaM?feature=oembed" frameborder="0" allowfullscreen></iframe>'),
(55, 2, '_oembed_time_f53a715b807054f2b808cfc64b5afeb8', '1448983392'),
(56, 2, '_edit_last', '1'),
(57, 2, '_oembed_9a7f18684293b25bc9fbc3608ecbca71', '<iframe width="960" height="540" src="https://www.youtube.com/embed/BbHkcw4IMaM?feature=oembed" frameborder="0" allowfullscreen></iframe>'),
(58, 2, '_oembed_time_9a7f18684293b25bc9fbc3608ecbca71', '1448983416'),
(59, 14, '_wp_attached_file', '2015/12/cropped-music2-e1448982998451.gif'),
(60, 14, '_wp_attachment_context', 'site-icon'),
(61, 14, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:512;s:6:"height";i:512;s:4:"file";s:41:"2015/12/cropped-music2-e1448982998451.gif";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:41:"cropped-music2-e1448982998451-150x150.gif";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/gif";}s:6:"medium";a:4:{s:4:"file";s:41:"cropped-music2-e1448982998451-300x300.gif";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/gif";}s:13:"site_icon-270";a:4:{s:4:"file";s:41:"cropped-music2-e1448982998451-270x270.gif";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/gif";}s:13:"site_icon-192";a:4:{s:4:"file";s:41:"cropped-music2-e1448982998451-192x192.gif";s:5:"width";i:192;s:6:"height";i:192;s:9:"mime-type";s:9:"image/gif";}s:13:"site_icon-180";a:4:{s:4:"file";s:41:"cropped-music2-e1448982998451-180x180.gif";s:5:"width";i:180;s:6:"height";i:180;s:9:"mime-type";s:9:"image/gif";}s:12:"site_icon-32";a:4:{s:4:"file";s:39:"cropped-music2-e1448982998451-32x32.gif";s:5:"width";i:32;s:6:"height";i:32;s:9:"mime-type";s:9:"image/gif";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(62, 15, '_wp_attached_file', '2015/12/logotmjs.jpg'),
(63, 15, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:960;s:6:"height";i:960;s:4:"file";s:20:"2015/12/logotmjs.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"logotmjs-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"logotmjs-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(64, 15, '_edit_lock', '1448984379:1'),
(65, 15, '_edit_last', '1'),
(66, 16, '_wp_attached_file', '2015/12/cropped-logotmjs.jpg'),
(67, 16, '_wp_attachment_context', 'site-icon'),
(68, 16, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:512;s:6:"height";i:512;s:4:"file";s:28:"2015/12/cropped-logotmjs.jpg";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:28:"cropped-logotmjs-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:28:"cropped-logotmjs-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:13:"site_icon-270";a:4:{s:4:"file";s:28:"cropped-logotmjs-270x270.jpg";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}s:13:"site_icon-192";a:4:{s:4:"file";s:28:"cropped-logotmjs-192x192.jpg";s:5:"width";i:192;s:6:"height";i:192;s:9:"mime-type";s:10:"image/jpeg";}s:13:"site_icon-180";a:4:{s:4:"file";s:28:"cropped-logotmjs-180x180.jpg";s:5:"width";i:180;s:6:"height";i:180;s:9:"mime-type";s:10:"image/jpeg";}s:12:"site_icon-32";a:4:{s:4:"file";s:26:"cropped-logotmjs-32x32.jpg";s:5:"width";i:32;s:6:"height";i:32;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(69, 17, '_edit_last', '1'),
(70, 17, '_edit_lock', '1449047026:1'),
(71, 17, '_wp_page_template', 'template-builder.php'),
(72, 17, '_ttfmake:1449046447023:columns', '3'),
(73, 17, '_ttfmake:1449046447023:caption-color', 'light'),
(74, 17, '_ttfmake:1449046447023:captions', 'reveal'),
(75, 17, '_ttfmake:1449046447023:aspect', 'square'),
(76, 17, '_ttfmake:1449046447023:background-image', '0'),
(77, 17, '_ttfmake:1449046447023:label', ''),
(78, 17, '_ttfmake:1449046447023:title', ''),
(79, 17, '_ttfmake:1449046447023:darken', '0'),
(80, 17, '_ttfmake:1449046447023:background-color', ''),
(81, 17, '_ttfmake:1449046447023:background-style', 'tile'),
(82, 17, '_ttfmake:1449046447023:gallery-item-order:0', '1449046447033'),
(83, 17, '_ttfmake:1449046447023:gallery-item-order:1', '1449046447042'),
(84, 17, '_ttfmake:1449046447023:gallery-item-order:2', '1449046447046'),
(85, 17, '_ttfmake:1449046447023:gallery-items:1449046447033:title', ''),
(86, 17, '_ttfmake:1449046447023:gallery-items:1449046447033:link', ''),
(87, 17, '_ttfmake:1449046447023:gallery-items:1449046447033:description', ''),
(88, 17, '_ttfmake:1449046447023:gallery-items:1449046447033:image-id', '24'),
(89, 17, '_ttfmake:1449046447023:gallery-items:1449046447042:title', ''),
(90, 17, '_ttfmake:1449046447023:gallery-items:1449046447042:link', ''),
(91, 17, '_ttfmake:1449046447023:gallery-items:1449046447042:description', ''),
(92, 17, '_ttfmake:1449046447023:gallery-items:1449046447042:image-id', '23'),
(93, 17, '_ttfmake:1449046447023:gallery-items:1449046447046:title', ''),
(94, 17, '_ttfmake:1449046447023:gallery-items:1449046447046:link', ''),
(95, 17, '_ttfmake:1449046447023:gallery-items:1449046447046:description', ''),
(96, 17, '_ttfmake:1449046447023:gallery-items:1449046447046:image-id', '22'),
(97, 17, '_ttfmake:1449046447023:state', 'open'),
(98, 17, '_ttfmake:1449046447023:section-type', 'gallery'),
(99, 17, '_ttfmake:1449046447023:id', '1449046447023'),
(100, 17, '_ttfmake-section-ids', 'a:1:{i:0;s:13:"1449046447023";}'),
(101, 19, '_wp_attached_file', '2015/12/1.jpg'),
(102, 19, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:479;s:6:"height";i:720;s:4:"file";s:13:"2015/12/1.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:13:"1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:13:"1-200x300.jpg";s:5:"width";i:200;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(103, 20, '_wp_attached_file', '2015/12/2.jpg'),
(104, 20, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:479;s:6:"height";i:720;s:4:"file";s:13:"2015/12/2.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:13:"2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:13:"2-200x300.jpg";s:5:"width";i:200;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(105, 21, '_wp_attached_file', '2015/12/3.jpg'),
(106, 21, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:547;s:6:"height";i:720;s:4:"file";s:13:"2015/12/3.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:13:"3-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:13:"3-228x300.jpg";s:5:"width";i:228;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(107, 22, '_wp_attached_file', '2015/12/4.jpg'),
(108, 22, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:479;s:6:"height";i:720;s:4:"file";s:13:"2015/12/4.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:13:"4-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:13:"4-200x300.jpg";s:5:"width";i:200;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(109, 23, '_wp_attached_file', '2015/12/5.jpg'),
(110, 23, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:464;s:6:"height";i:640;s:4:"file";s:13:"2015/12/5.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:13:"5-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:13:"5-218x300.jpg";s:5:"width";i:218;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(111, 24, '_wp_attached_file', '2015/12/6.jpg'),
(112, 24, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:879;s:6:"height";i:1309;s:4:"file";s:13:"2015/12/6.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:13:"6-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:13:"6-201x300.jpg";s:5:"width";i:201;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:14:"6-688x1024.jpg";s:5:"width";i:688;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(113, 17, '_ttfmake:1449046447023:gallery-item-order:3', '1449046774997'),
(114, 17, '_ttfmake:1449046447023:gallery-item-order:4', '1449046776912'),
(115, 17, '_ttfmake:1449046447023:gallery-item-order:5', '1449046777440'),
(116, 17, '_ttfmake:1449046447023:gallery-items:1449046774997:title', ''),
(117, 17, '_ttfmake:1449046447023:gallery-items:1449046774997:link', ''),
(118, 17, '_ttfmake:1449046447023:gallery-items:1449046774997:description', ''),
(119, 17, '_ttfmake:1449046447023:gallery-items:1449046774997:image-id', '21'),
(120, 17, '_ttfmake:1449046447023:gallery-items:1449046776912:title', ''),
(121, 17, '_ttfmake:1449046447023:gallery-items:1449046776912:link', ''),
(122, 17, '_ttfmake:1449046447023:gallery-items:1449046776912:description', ''),
(123, 17, '_ttfmake:1449046447023:gallery-items:1449046776912:image-id', '20'),
(124, 17, '_ttfmake:1449046447023:gallery-items:1449046777440:title', ''),
(125, 17, '_ttfmake:1449046447023:gallery-items:1449046777440:link', ''),
(126, 17, '_ttfmake:1449046447023:gallery-items:1449046777440:description', ''),
(127, 17, '_ttfmake:1449046447023:gallery-items:1449046777440:image-id', '19'),
(128, 26, '_menu_item_type', 'post_type'),
(129, 26, '_menu_item_menu_item_parent', '0'),
(130, 26, '_menu_item_object_id', '17'),
(131, 26, '_menu_item_object', 'page'),
(132, 26, '_menu_item_target', ''),
(133, 26, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(134, 26, '_menu_item_xfn', ''),
(135, 26, '_menu_item_url', ''),
(137, 27, 'title', 'Vignettes de Base NextGEN'),
(138, 27, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_gallery\\static\\thumb_preview.jpg'),
(139, 27, 'default_source', 'galleries'),
(140, 27, 'view_order', '10000'),
(141, 27, 'name', 'photocrati-nextgen_basic_thumbnails'),
(142, 27, 'installed_at_version', '2.1.15'),
(143, 27, 'hidden_from_ui', ''),
(144, 27, '__defaults_set', '1'),
(145, 27, 'filter', 'raw'),
(146, 27, 'entity_types', 'WyJpbWFnZSJd'),
(147, 27, 'id_field', 'ID'),
(148, 27, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJpbWFnZXNfcGVyX3BhZ2UiOiIyMCIsIm51bWJlcl9vZl9jb2x1bW5zIjowLCJ0aHVtYm5haWxfd2lkdGgiOjI0MCwidGh1bWJuYWlsX2hlaWdodCI6MTYwLCJzaG93X2FsbF9pbl9saWdodGJveCI6MCwiYWpheF9wYWdpbmF0aW9uIjowLCJ1c2VfaW1hZ2Vicm93c2VyX2VmZmVjdCI6MCwidGVtcGxhdGUiOiIiLCJkaXNwbGF5X25vX2ltYWdlc19lcnJvciI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJzaG93X3NsaWRlc2hvd19saW5rIjoxLCJzbGlkZXNob3dfbGlua190ZXh0IjoiW01vbnRyZXIgc291cyBmb3JtZSBkZSBkaWFwb3JhbWFdIiwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjowLCJ0aHVtYm5haWxfcXVhbGl0eSI6IjEwMCIsInRodW1ibmFpbF9jcm9wIjoxLCJ0aHVtYm5haWxfd2F0ZXJtYXJrIjowLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0='),
(149, 28, 'title', 'Diaporama de base NextGEN'),
(150, 28, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_gallery\\static\\slideshow_preview.jpg'),
(151, 28, 'default_source', 'galleries'),
(152, 28, 'view_order', '10010'),
(153, 28, 'name', 'photocrati-nextgen_basic_slideshow'),
(154, 28, 'installed_at_version', '2.1.15'),
(155, 28, 'hidden_from_ui', ''),
(156, 28, '__defaults_set', '1'),
(157, 28, 'filter', 'raw'),
(158, 28, 'entity_types', 'WyJpbWFnZSJd'),
(159, 28, 'id_field', 'ID'),
(160, 28, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJ5X3dpZHRoIjo2MDAsImdhbGxlcnlfaGVpZ2h0Ijo0MDAsInRodW1ibmFpbF93aWR0aCI6MjQwLCJ0aHVtYm5haWxfaGVpZ2h0IjoxNjAsImN5Y2xlX2ludGVydmFsIjoxMCwiY3ljbGVfZWZmZWN0IjpudWxsLCJlZmZlY3RfY29kZSI6ImNsYXNzPVwibmdnLWZhbmN5Ym94XCIgcmVsPVwiJUdBTExFUllfTkFNRSVcIiIsInNob3dfdGh1bWJuYWlsX2xpbmsiOjEsInRodW1ibmFpbF9saW5rX3RleHQiOiJbTW9udHJlciBzb3VzIGZvcm1lIGRlIHZpZ25ldHRlc10iLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifQ=='),
(161, 29, 'title', 'Affichage dans l''outil de visualisation d''images de base NextGEN'),
(162, 29, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_imagebrowser\\static\\preview.jpg'),
(163, 29, 'default_source', 'galleries'),
(164, 29, 'view_order', '10020'),
(165, 29, 'name', 'photocrati-nextgen_basic_imagebrowser'),
(166, 29, 'installed_at_version', '2.1.15'),
(167, 29, 'hidden_from_ui', ''),
(168, 29, '__defaults_set', '1'),
(169, 29, 'filter', 'raw'),
(170, 29, 'entity_types', 'WyJpbWFnZSJd'),
(171, 29, 'id_field', 'ID'),
(172, 29, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifQ=='),
(173, 30, 'title', 'NextGEN Basic SinglePic'),
(174, 30, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_singlepic\\static\\preview.gif'),
(175, 30, 'default_source', 'galleries'),
(176, 30, 'view_order', '10060'),
(177, 30, 'hidden_from_ui', '1'),
(178, 30, 'name', 'photocrati-nextgen_basic_singlepic'),
(179, 30, 'installed_at_version', '2.1.15'),
(180, 30, '__defaults_set', '1'),
(181, 30, 'filter', 'raw'),
(182, 30, 'entity_types', 'WyJpbWFnZSJd'),
(183, 30, 'id_field', 'ID'),
(184, 30, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ3aWR0aCI6IiIsImhlaWdodCI6IiIsIm1vZGUiOiIiLCJkaXNwbGF5X3dhdGVybWFyayI6MCwiZGlzcGxheV9yZWZsZWN0aW9uIjowLCJmbG9hdCI6IiIsImxpbmsiOiIiLCJsaW5rX3RhcmdldCI6Il9ibGFuayIsInF1YWxpdHkiOjEwMCwiY3JvcCI6MCwidGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0='),
(185, 31, 'title', 'NextGEN Basic TagCloud'),
(186, 31, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_tagcloud\\static\\preview.gif'),
(187, 31, 'default_source', 'tags'),
(188, 31, 'view_order', '10100'),
(189, 31, 'name', 'photocrati-nextgen_basic_tagcloud'),
(190, 31, 'installed_at_version', '2.1.15'),
(191, 31, 'hidden_from_ui', ''),
(192, 31, '__defaults_set', '1'),
(193, 31, 'filter', 'raw'),
(194, 31, 'entity_types', 'WyJpbWFnZSJd'),
(195, 31, 'id_field', 'ID'),
(196, 31, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJkaXNwbGF5X3R5cGUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsIm51bWJlciI6NDUsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifQ=='),
(197, 32, 'title', 'Album Compact de base NextGEN'),
(198, 32, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_album\\static\\compact_preview.jpg'),
(199, 32, 'default_source', 'albums'),
(200, 32, 'view_order', '10200'),
(201, 32, 'name', 'photocrati-nextgen_basic_compact_album'),
(202, 32, 'installed_at_version', '2.1.15'),
(203, 32, 'hidden_from_ui', ''),
(204, 32, '__defaults_set', '1'),
(205, 32, 'filter', 'raw'),
(206, 32, 'entity_types', 'WyJhbGJ1bSIsImdhbGxlcnkiXQ=='),
(207, 32, 'id_field', 'ID'),
(208, 32, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOjAsImVuYWJsZV9icmVhZGNydW1icyI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJ0ZW1wbGF0ZSI6IiIsImdhbGxlcnlfZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJnYWxsZXJ5X2Rpc3BsYXlfdGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0='),
(209, 33, 'title', 'Album étendu de base NextGEN'),
(210, 33, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_album\\static\\extended_preview.jpg'),
(211, 33, 'default_source', 'albums'),
(212, 33, 'view_order', '10210'),
(213, 33, 'name', 'photocrati-nextgen_basic_extended_album'),
(214, 33, 'installed_at_version', '2.1.15'),
(215, 33, 'hidden_from_ui', ''),
(216, 33, '__defaults_set', '1'),
(217, 33, 'filter', 'raw'),
(218, 33, 'entity_types', 'WyJhbGJ1bSIsImdhbGxlcnkiXQ=='),
(219, 33, 'id_field', 'ID'),
(220, 33, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOjAsImVuYWJsZV9icmVhZGNydW1icyI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJ0ZW1wbGF0ZSI6IiIsIm92ZXJyaWRlX3RodW1ibmFpbF9zZXR0aW5ncyI6MCwidGh1bWJuYWlsX3dpZHRoIjoyNDAsInRodW1ibmFpbF9oZWlnaHQiOjE2MCwidGh1bWJuYWlsX3F1YWxpdHkiOjEwMCwidGh1bWJuYWlsX2Nyb3AiOnRydWUsInRodW1ibmFpbF93YXRlcm1hcmsiOjAsImdhbGxlcnlfZGlzcGxheV90eXBlIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3RodW1ibmFpbHMiLCJnYWxsZXJ5X2Rpc3BsYXlfdGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIn0=');

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjposts`
--

CREATE TABLE IF NOT EXISTS `wp_mjposts` (
  `ID` bigint(20) unsigned NOT NULL,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `wp_mjposts`
--

INSERT INTO `wp_mjposts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-12-01 15:29:57', '2015-12-01 14:29:57', 'Bienvenue dans WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis lancez-vous&nbsp;!', 'Bonjour tout le monde&nbsp;!', '', 'publish', 'open', 'open', '', 'bonjour-tout-le-monde', '', '', '2015-12-01 15:29:57', '2015-12-01 14:29:57', '', 0, 'http://localhost/wpmj/?p=1', 0, 'post', '', 1),
(2, 1, '2015-12-01 15:29:57', '2015-12-01 14:29:57', 'https://www.youtube.com/watch?v=BbHkcw4IMaM', 'accueil', '', 'publish', 'closed', 'open', '', 'page-d-exemple', '', '', '2015-12-01 17:10:22', '2015-12-01 16:10:22', '', 0, 'http://localhost/wpmj/?page_id=2', 0, 'page', '', 0),
(3, 1, '2015-12-01 15:30:49', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-12-01 15:30:49', '0000-00-00 00:00:00', '', 0, 'http://localhost/wpmj/?p=3', 0, 'post', '', 0),
(4, 1, '2015-12-01 15:44:56', '2015-12-01 14:44:56', '', 'curtain', '', 'inherit', 'open', 'closed', '', 'rideau-theatre-marseille1', '', '', '2015-12-01 15:45:24', '2015-12-01 14:45:24', '', 0, 'http://localhost/wpmj/wp-content/uploads/2015/12/rideau-theatre-marseille1.jpg', 0, 'attachment', 'image/jpeg', 0),
(5, 1, '2015-12-01 15:48:07', '2015-12-01 14:48:07', '', 'wrap', '', 'inherit', 'open', 'closed', '', 'wrap', '', '', '2015-12-01 15:48:07', '2015-12-01 14:48:07', '', 0, 'http://localhost/wpmj/wp-content/uploads/2015/12/wrap.jpg', 0, 'attachment', 'image/jpeg', 0),
(6, 1, '2015-12-01 15:58:53', '2015-12-01 14:58:53', '', 'Mon univers', '', 'publish', 'closed', 'closed', '', 'mon-univers', '', '', '2015-12-02 10:02:57', '2015-12-02 09:02:57', '', 0, 'http://localhost/wpmj/2015/12/01/mon-univers/', 1, 'nav_menu_item', '', 0),
(8, 1, '2015-12-01 15:58:53', '2015-12-01 14:58:53', '', 'Vidéos', '', 'publish', 'closed', 'closed', '', 'videos', '', '', '2015-12-02 10:02:57', '2015-12-02 09:02:57', '', 0, 'http://localhost/wpmj/2015/12/01/videos/', 3, 'nav_menu_item', '', 0),
(9, 1, '2015-12-01 15:58:54', '2015-12-01 14:58:54', '', 'Espace Pro', '', 'publish', 'closed', 'closed', '', 'espace-pro', '', '', '2015-12-02 10:02:57', '2015-12-02 09:02:57', '', 0, 'http://localhost/wpmj/2015/12/01/espace-pro/', 4, 'nav_menu_item', '', 0),
(10, 1, '2015-12-01 15:58:55', '2015-12-01 14:58:55', '', 'Contact', '', 'publish', 'closed', 'closed', '', 'contact', '', '', '2015-12-02 10:02:57', '2015-12-02 09:02:57', '', 0, 'http://localhost/wpmj/2015/12/01/contact/', 5, 'nav_menu_item', '', 0),
(11, 1, '2015-12-01 16:12:21', '2015-12-01 15:12:21', '', 'music2', '', 'inherit', 'open', 'closed', '', 'music2', '', '', '2015-12-01 16:24:45', '2015-12-01 15:24:45', '', 0, 'http://localhost/wpmj/wp-content/uploads/2015/12/music2.gif', 0, 'attachment', 'image/gif', 0),
(12, 1, '2015-12-01 16:23:20', '2015-12-01 15:23:20', 'https://www.youtube.com/watch?v=BbHkcw4IMaM', 'Page d&rsquo;exemple', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2015-12-01 16:23:20', '2015-12-01 15:23:20', '', 2, 'http://localhost/wpmj/2015/12/01/2-revision-v1/', 0, 'revision', '', 0),
(13, 1, '2015-12-01 16:23:32', '2015-12-01 15:23:32', 'https://www.youtube.com/watch?v=BbHkcw4IMaM', 'accueil', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2015-12-01 16:23:32', '2015-12-01 15:23:32', '', 2, 'http://localhost/wpmj/2015/12/01/2-revision-v1/', 0, 'revision', '', 0),
(14, 1, '2015-12-01 16:36:08', '2015-12-01 15:36:08', 'http://localhost/wpmj/wp-content/uploads/2015/12/cropped-music2-e1448982998451.gif', 'cropped-music2-e1448982998451.gif', '', 'inherit', 'open', 'closed', '', 'cropped-music2-e1448982998451-gif', '', '', '2015-12-01 16:36:08', '2015-12-01 15:36:08', '', 0, 'http://localhost/wpmj/wp-content/uploads/2015/12/cropped-music2-e1448982998451.gif', 0, 'attachment', 'image/gif', 0),
(15, 1, '2015-12-01 16:41:42', '2015-12-01 15:41:42', '', 'logotmjs', '', 'inherit', 'open', 'closed', '', 'logotmjs', '', '', '2015-12-01 16:42:01', '2015-12-01 15:42:01', '', 0, 'http://localhost/wpmj/wp-content/uploads/2015/12/logotmjs.jpg', 0, 'attachment', 'image/jpeg', 0),
(16, 1, '2015-12-01 16:47:47', '2015-12-01 15:47:47', 'http://localhost/wpmj/wp-content/uploads/2015/12/cropped-logotmjs.jpg', 'cropped-logotmjs.jpg', '', 'inherit', 'open', 'closed', '', 'cropped-logotmjs-jpg', '', '', '2015-12-01 16:47:47', '2015-12-01 15:47:47', '', 0, 'http://localhost/wpmj/wp-content/uploads/2015/12/cropped-logotmjs.jpg', 0, 'attachment', 'image/jpeg', 0),
(17, 1, '2015-12-02 09:55:15', '2015-12-02 08:55:15', '\n<section id="builder-section-1449046447023" class="builder-section builder-section-first builder-section-gallery builder-section-last builder-gallery-columns-3 builder-gallery-captions-reveal builder-gallery-captions-light builder-gallery-aspect-square" style="">\n		<div class="builder-section-content">\n				<div class="builder-gallery-item" onclick="return false;">\n										<figure class="builder-gallery-image" style="background-image: url(&#039;http://localhost/wpmj/wp-content/uploads/2015/12/6-688x1024.jpg&#039;);"></figure>								</div>\n				<div class="builder-gallery-item last-2" onclick="return false;">\n										<figure class="builder-gallery-image" style="background-image: url(&#039;http://localhost/wpmj/wp-content/uploads/2015/12/5.jpg&#039;);"></figure>								</div>\n				<div class="builder-gallery-item last-3" onclick="return false;">\n										<figure class="builder-gallery-image" style="background-image: url(&#039;http://localhost/wpmj/wp-content/uploads/2015/12/4.jpg&#039;);"></figure>								</div>\n				<div class="builder-gallery-item last-2" onclick="return false;">\n										<figure class="builder-gallery-image" style="background-image: url(&#039;http://localhost/wpmj/wp-content/uploads/2015/12/3.jpg&#039;);"></figure>								</div>\n				<div class="builder-gallery-item" onclick="return false;">\n										<figure class="builder-gallery-image" style="background-image: url(&#039;http://localhost/wpmj/wp-content/uploads/2015/12/2.jpg&#039;);"></figure>								</div>\n				<div class="builder-gallery-item last-3 last-2" onclick="return false;">\n										<figure class="builder-gallery-image" style="background-image: url(&#039;http://localhost/wpmj/wp-content/uploads/2015/12/1.jpg&#039;);"></figure>								</div>\n			</div>\n	</section>\n', 'Photos', '', 'publish', 'closed', 'closed', '', 'photos', '', '', '2015-12-02 10:00:05', '2015-12-02 09:00:05', '', 0, 'http://localhost/wpmj/?page_id=17', 0, 'page', '', 0),
(18, 1, '2015-12-02 09:55:15', '2015-12-02 08:55:15', '\n<section id="builder-section-1449046447023" class="builder-section builder-section-first builder-section-gallery builder-section-last builder-gallery-columns-3 builder-gallery-captions-reveal builder-gallery-captions-light builder-gallery-aspect-square" style="">\n		<div class="builder-section-content">\n				<div class="builder-gallery-item" onclick="return false;">\n											</div>\n				<div class="builder-gallery-item last-2" onclick="return false;">\n											</div>\n				<div class="builder-gallery-item last-3" onclick="return false;">\n											</div>\n			</div>\n	</section>\n', 'Photos', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2015-12-02 09:55:15', '2015-12-02 08:55:15', '', 17, 'http://localhost/wpmj/2015/12/02/17-revision-v1/', 0, 'revision', '', 0),
(19, 1, '2015-12-02 09:59:15', '2015-12-02 08:59:15', '', '1', '', 'inherit', 'open', 'closed', '', '1', '', '', '2015-12-02 09:59:15', '2015-12-02 08:59:15', '', 17, 'http://localhost/wpmj/wp-content/uploads/2015/12/1.jpg', 0, 'attachment', 'image/jpeg', 0),
(20, 1, '2015-12-02 09:59:16', '2015-12-02 08:59:16', '', '2', '', 'inherit', 'open', 'closed', '', '2', '', '', '2015-12-02 09:59:16', '2015-12-02 08:59:16', '', 17, 'http://localhost/wpmj/wp-content/uploads/2015/12/2.jpg', 0, 'attachment', 'image/jpeg', 0),
(21, 1, '2015-12-02 09:59:17', '2015-12-02 08:59:17', '', '3', '', 'inherit', 'open', 'closed', '', '3', '', '', '2015-12-02 09:59:17', '2015-12-02 08:59:17', '', 17, 'http://localhost/wpmj/wp-content/uploads/2015/12/3.jpg', 0, 'attachment', 'image/jpeg', 0),
(22, 1, '2015-12-02 09:59:17', '2015-12-02 08:59:17', '', '4', '', 'inherit', 'open', 'closed', '', '4', '', '', '2015-12-02 09:59:17', '2015-12-02 08:59:17', '', 17, 'http://localhost/wpmj/wp-content/uploads/2015/12/4.jpg', 0, 'attachment', 'image/jpeg', 0),
(23, 1, '2015-12-02 09:59:18', '2015-12-02 08:59:18', '', '5', '', 'inherit', 'open', 'closed', '', '5', '', '', '2015-12-02 09:59:18', '2015-12-02 08:59:18', '', 17, 'http://localhost/wpmj/wp-content/uploads/2015/12/5.jpg', 0, 'attachment', 'image/jpeg', 0),
(24, 1, '2015-12-02 09:59:19', '2015-12-02 08:59:19', '', '6', '', 'inherit', 'open', 'closed', '', '6', '', '', '2015-12-02 09:59:19', '2015-12-02 08:59:19', '', 17, 'http://localhost/wpmj/wp-content/uploads/2015/12/6.jpg', 0, 'attachment', 'image/jpeg', 0),
(25, 1, '2015-12-02 10:00:05', '2015-12-02 09:00:05', '\n<section id="builder-section-1449046447023" class="builder-section builder-section-first builder-section-gallery builder-section-last builder-gallery-columns-3 builder-gallery-captions-reveal builder-gallery-captions-light builder-gallery-aspect-square" style="">\n		<div class="builder-section-content">\n				<div class="builder-gallery-item" onclick="return false;">\n										<figure class="builder-gallery-image" style="background-image: url(&#039;http://localhost/wpmj/wp-content/uploads/2015/12/6-688x1024.jpg&#039;);"></figure>								</div>\n				<div class="builder-gallery-item last-2" onclick="return false;">\n										<figure class="builder-gallery-image" style="background-image: url(&#039;http://localhost/wpmj/wp-content/uploads/2015/12/5.jpg&#039;);"></figure>								</div>\n				<div class="builder-gallery-item last-3" onclick="return false;">\n										<figure class="builder-gallery-image" style="background-image: url(&#039;http://localhost/wpmj/wp-content/uploads/2015/12/4.jpg&#039;);"></figure>								</div>\n				<div class="builder-gallery-item last-2" onclick="return false;">\n										<figure class="builder-gallery-image" style="background-image: url(&#039;http://localhost/wpmj/wp-content/uploads/2015/12/3.jpg&#039;);"></figure>								</div>\n				<div class="builder-gallery-item" onclick="return false;">\n										<figure class="builder-gallery-image" style="background-image: url(&#039;http://localhost/wpmj/wp-content/uploads/2015/12/2.jpg&#039;);"></figure>								</div>\n				<div class="builder-gallery-item last-3 last-2" onclick="return false;">\n										<figure class="builder-gallery-image" style="background-image: url(&#039;http://localhost/wpmj/wp-content/uploads/2015/12/1.jpg&#039;);"></figure>								</div>\n			</div>\n	</section>\n', 'Photos', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2015-12-02 10:00:05', '2015-12-02 09:00:05', '', 17, 'http://localhost/wpmj/2015/12/02/17-revision-v1/', 0, 'revision', '', 0),
(26, 1, '2015-12-02 10:02:57', '2015-12-02 09:02:57', ' ', '', '', 'publish', 'closed', 'closed', '', '26', '', '', '2015-12-02 10:02:57', '2015-12-02 09:02:57', '', 0, 'http://localhost/wpmj/?p=26', 2, 'nav_menu_item', '', 0),
(27, 1, '2015-12-02 10:18:59', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6IlZpZ25ldHRlcyBkZSBCYXNlIE5leHRHRU4iLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXFxuZXh0Z2VuLWdhbGxlcnlcXHByb2R1Y3RzXFxwaG90b2NyYXRpX25leHRnZW5cXG1vZHVsZXNcXG5leHRnZW5fYmFzaWNfZ2FsbGVyeVxcc3RhdGljXFx0aHVtYl9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwMDAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjE1IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImltYWdlc19wZXJfcGFnZSI6IjIwIiwibnVtYmVyX29mX2NvbHVtbnMiOjAsInRodW1ibmFpbF93aWR0aCI6MjQwLCJ0aHVtYm5haWxfaGVpZ2h0IjoxNjAsInNob3dfYWxsX2luX2xpZ2h0Ym94IjowLCJhamF4X3BhZ2luYXRpb24iOjAsInVzZV9pbWFnZWJyb3dzZXJfZWZmZWN0IjowLCJ0ZW1wbGF0ZSI6IiIsImRpc3BsYXlfbm9faW1hZ2VzX2Vycm9yIjoxLCJkaXNhYmxlX3BhZ2luYXRpb24iOjAsInNob3dfc2xpZGVzaG93X2xpbmsiOjEsInNsaWRlc2hvd19saW5rX3RleHQiOiJbTW9udHJlciBzb3VzIGZvcm1lIGRlIGRpYXBvcmFtYV0iLCJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOjAsInRodW1ibmFpbF9xdWFsaXR5IjoiMTAwIiwidGh1bWJuYWlsX2Nyb3AiOjEsInRodW1ibmFpbF93YXRlcm1hcmsiOjAsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 'Vignettes de Base NextGEN', '', 'draft', 'closed', 'closed', '', '', '', '', '2015-12-02 10:18:59', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6IlZpZ25ldHRlcyBkZSBCYXNlIE5leHRHRU4iLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXFxuZXh0Z2VuLWdhbGxlcnlcXHByb2R1Y3RzXFxwaG90b2NyYXRpX25leHRnZW5cXG1vZHVsZXNcXG5leHRnZW5fYmFzaWNfZ2FsbGVyeVxcc3RhdGljXFx0aHVtYl9wcmV2aWV3LmpwZyIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwMDAsIm5hbWUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjE1IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImltYWdlc19wZXJfcGFnZSI6IjIwIiwibnVtYmVyX29mX2NvbHVtbnMiOjAsInRodW1ibmFpbF93aWR0aCI6MjQwLCJ0aHVtYm5haWxfaGVpZ2h0IjoxNjAsInNob3dfYWxsX2luX2xpZ2h0Ym94IjowLCJhamF4X3BhZ2luYXRpb24iOjAsInVzZV9pbWFnZWJyb3dzZXJfZWZmZWN0IjowLCJ0ZW1wbGF0ZSI6IiIsImRpc3BsYXlfbm9faW1hZ2VzX2Vycm9yIjoxLCJkaXNhYmxlX3BhZ2luYXRpb24iOjAsInNob3dfc2xpZGVzaG93X2xpbmsiOjEsInNsaWRlc2hvd19saW5rX3RleHQiOiJbTW9udHJlciBzb3VzIGZvcm1lIGRlIGRpYXBvcmFtYV0iLCJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOjAsInRodW1ibmFpbF9xdWFsaXR5IjoiMTAwIiwidGh1bWJuYWlsX2Nyb3AiOjEsInRodW1ibmFpbF93YXRlcm1hcmsiOjAsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 0, 'http://localhost/wpmj/?post_type=display_type&p=27', 0, 'display_type', '', 0),
(28, 1, '2015-12-02 10:18:59', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6IkRpYXBvcmFtYSBkZSBiYXNlIE5leHRHRU4iLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXFxuZXh0Z2VuLWdhbGxlcnlcXHByb2R1Y3RzXFxwaG90b2NyYXRpX25leHRnZW5cXG1vZHVsZXNcXG5leHRnZW5fYmFzaWNfZ2FsbGVyeVxcc3RhdGljXFxzbGlkZXNob3dfcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImdhbGxlcmllcyIsInZpZXdfb3JkZXIiOjEwMDEwLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3NsaWRlc2hvdyIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjE1IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImdhbGxlcnlfd2lkdGgiOjYwMCwiZ2FsbGVyeV9oZWlnaHQiOjQwMCwidGh1bWJuYWlsX3dpZHRoIjoyNDAsInRodW1ibmFpbF9oZWlnaHQiOjE2MCwiY3ljbGVfaW50ZXJ2YWwiOjEwLCJjeWNsZV9lZmZlY3QiOm51bGwsImVmZmVjdF9jb2RlIjoiY2xhc3M9XCJuZ2ctZmFuY3lib3hcIiByZWw9XCIlR0FMTEVSWV9OQU1FJVwiIiwic2hvd190aHVtYm5haWxfbGluayI6MSwidGh1bWJuYWlsX2xpbmtfdGV4dCI6IltNb250cmVyIHNvdXMgZm9ybWUgZGUgdmlnbmV0dGVzXSIsInRlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'Diaporama de base NextGEN', '', 'draft', 'closed', 'closed', '', '', '', '', '2015-12-02 10:18:59', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6IkRpYXBvcmFtYSBkZSBiYXNlIE5leHRHRU4iLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXFxuZXh0Z2VuLWdhbGxlcnlcXHByb2R1Y3RzXFxwaG90b2NyYXRpX25leHRnZW5cXG1vZHVsZXNcXG5leHRnZW5fYmFzaWNfZ2FsbGVyeVxcc3RhdGljXFxzbGlkZXNob3dfcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImdhbGxlcmllcyIsInZpZXdfb3JkZXIiOjEwMDEwLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3NsaWRlc2hvdyIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjE1IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImdhbGxlcnlfd2lkdGgiOjYwMCwiZ2FsbGVyeV9oZWlnaHQiOjQwMCwidGh1bWJuYWlsX3dpZHRoIjoyNDAsInRodW1ibmFpbF9oZWlnaHQiOjE2MCwiY3ljbGVfaW50ZXJ2YWwiOjEwLCJjeWNsZV9lZmZlY3QiOm51bGwsImVmZmVjdF9jb2RlIjoiY2xhc3M9XCJuZ2ctZmFuY3lib3hcIiByZWw9XCIlR0FMTEVSWV9OQU1FJVwiIiwic2hvd190aHVtYm5haWxfbGluayI6MSwidGh1bWJuYWlsX2xpbmtfdGV4dCI6IltNb250cmVyIHNvdXMgZm9ybWUgZGUgdmlnbmV0dGVzXSIsInRlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://localhost/wpmj/?post_type=display_type&p=28', 0, 'display_type', '', 0),
(29, 1, '2015-12-02 10:18:59', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6IkFmZmljaGFnZSBkYW5zIGwnb3V0aWwgZGUgdmlzdWFsaXNhdGlvbiBkJ2ltYWdlcyBkZSBiYXNlIE5leHRHRU4iLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXFxuZXh0Z2VuLWdhbGxlcnlcXHByb2R1Y3RzXFxwaG90b2NyYXRpX25leHRnZW5cXG1vZHVsZXNcXG5leHRnZW5fYmFzaWNfaW1hZ2Vicm93c2VyXFxzdGF0aWNcXHByZXZpZXcuanBnIiwiZGVmYXVsdF9zb3VyY2UiOiJnYWxsZXJpZXMiLCJ2aWV3X29yZGVyIjoxMDAyMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19pbWFnZWJyb3dzZXIiLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjIuMS4xNSIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 'Affichage dans l''outil de visualisation d''images de base NextGEN', '', 'draft', 'closed', 'closed', '', '', '', '', '2015-12-02 10:18:59', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6IkFmZmljaGFnZSBkYW5zIGwnb3V0aWwgZGUgdmlzdWFsaXNhdGlvbiBkJ2ltYWdlcyBkZSBiYXNlIE5leHRHRU4iLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXFxuZXh0Z2VuLWdhbGxlcnlcXHByb2R1Y3RzXFxwaG90b2NyYXRpX25leHRnZW5cXG1vZHVsZXNcXG5leHRnZW5fYmFzaWNfaW1hZ2Vicm93c2VyXFxzdGF0aWNcXHByZXZpZXcuanBnIiwiZGVmYXVsdF9zb3VyY2UiOiJnYWxsZXJpZXMiLCJ2aWV3X29yZGVyIjoxMDAyMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19pbWFnZWJyb3dzZXIiLCJpbnN0YWxsZWRfYXRfdmVyc2lvbiI6IjIuMS4xNSIsImlkX2ZpZWxkIjoiSUQiLCJzZXR0aW5ncyI6eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiaGlkZGVuX2Zyb21fdWkiOmZhbHNlLCJfX2RlZmF1bHRzX3NldCI6dHJ1ZX0=', 0, 'http://localhost/wpmj/?post_type=display_type&p=29', 0, 'display_type', '', 0),
(30, 1, '2015-12-02 10:19:00', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgU2luZ2xlUGljIiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlxcbmV4dGdlbi1nYWxsZXJ5XFxwcm9kdWN0c1xccGhvdG9jcmF0aV9uZXh0Z2VuXFxtb2R1bGVzXFxuZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpY1xcc3RhdGljXFxwcmV2aWV3LmdpZiIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwNjAsImhpZGRlbl9mcm9tX3VpIjp0cnVlLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpYyIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjE1IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsIndpZHRoIjoiIiwiaGVpZ2h0IjoiIiwibW9kZSI6IiIsImRpc3BsYXlfd2F0ZXJtYXJrIjowLCJkaXNwbGF5X3JlZmxlY3Rpb24iOjAsImZsb2F0IjoiIiwibGluayI6IiIsImxpbmtfdGFyZ2V0IjoiX2JsYW5rIiwicXVhbGl0eSI6MTAwLCJjcm9wIjowLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'NextGEN Basic SinglePic', '', 'draft', 'closed', 'closed', '', '', '', '', '2015-12-02 10:19:00', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgU2luZ2xlUGljIiwiZW50aXR5X3R5cGVzIjpbImltYWdlIl0sInByZXZpZXdfaW1hZ2VfcmVscGF0aCI6IlxcbmV4dGdlbi1nYWxsZXJ5XFxwcm9kdWN0c1xccGhvdG9jcmF0aV9uZXh0Z2VuXFxtb2R1bGVzXFxuZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpY1xcc3RhdGljXFxwcmV2aWV3LmdpZiIsImRlZmF1bHRfc291cmNlIjoiZ2FsbGVyaWVzIiwidmlld19vcmRlciI6MTAwNjAsImhpZGRlbl9mcm9tX3VpIjp0cnVlLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpYyIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjE1IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsIndpZHRoIjoiIiwiaGVpZ2h0IjoiIiwibW9kZSI6IiIsImRpc3BsYXlfd2F0ZXJtYXJrIjowLCJkaXNwbGF5X3JlZmxlY3Rpb24iOjAsImZsb2F0IjoiIiwibGluayI6IiIsImxpbmtfdGFyZ2V0IjoiX2JsYW5rIiwicXVhbGl0eSI6MTAwLCJjcm9wIjowLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIifSwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wpmj/?post_type=display_type&p=30', 0, 'display_type', '', 0),
(31, 1, '2015-12-02 10:19:00', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgVGFnQ2xvdWQiLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXFxuZXh0Z2VuLWdhbGxlcnlcXHByb2R1Y3RzXFxwaG90b2NyYXRpX25leHRnZW5cXG1vZHVsZXNcXG5leHRnZW5fYmFzaWNfdGFnY2xvdWRcXHN0YXRpY1xccHJldmlldy5naWYiLCJkZWZhdWx0X3NvdXJjZSI6InRhZ3MiLCJ2aWV3X29yZGVyIjoxMDEwMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190YWdjbG91ZCIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjE1IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImRpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwibnVtYmVyIjo0NSwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'NextGEN Basic TagCloud', '', 'draft', 'closed', 'closed', '', '', '', '', '2015-12-02 10:19:00', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6Ik5leHRHRU4gQmFzaWMgVGFnQ2xvdWQiLCJlbnRpdHlfdHlwZXMiOlsiaW1hZ2UiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXFxuZXh0Z2VuLWdhbGxlcnlcXHByb2R1Y3RzXFxwaG90b2NyYXRpX25leHRnZW5cXG1vZHVsZXNcXG5leHRnZW5fYmFzaWNfdGFnY2xvdWRcXHN0YXRpY1xccHJldmlldy5naWYiLCJkZWZhdWx0X3NvdXJjZSI6InRhZ3MiLCJ2aWV3X29yZGVyIjoxMDEwMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190YWdjbG91ZCIsImluc3RhbGxlZF9hdF92ZXJzaW9uIjoiMi4xLjE1IiwiaWRfZmllbGQiOiJJRCIsInNldHRpbmdzIjp7InVzZV9saWdodGJveF9lZmZlY3QiOnRydWUsImRpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwibnVtYmVyIjo0NSwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://localhost/wpmj/?post_type=display_type&p=31', 0, 'display_type', '', 0),
(32, 1, '2015-12-02 10:19:00', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6IkFsYnVtIENvbXBhY3QgZGUgYmFzZSBOZXh0R0VOIiwiZW50aXR5X3R5cGVzIjpbImFsYnVtIiwiZ2FsbGVyeSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcXG5leHRnZW4tZ2FsbGVyeVxccHJvZHVjdHNcXHBob3RvY3JhdGlfbmV4dGdlblxcbW9kdWxlc1xcbmV4dGdlbl9iYXNpY19hbGJ1bVxcc3RhdGljXFxjb21wYWN0X3ByZXZpZXcuanBnIiwiZGVmYXVsdF9zb3VyY2UiOiJhbGJ1bXMiLCJ2aWV3X29yZGVyIjoxMDIwMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19jb21wYWN0X2FsYnVtIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuMTUiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwiZ2FsbGVyaWVzX3Blcl9wYWdlIjowLCJlbmFibGVfYnJlYWRjcnVtYnMiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwidGVtcGxhdGUiOiIiLCJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiZ2FsbGVyeV9kaXNwbGF5X3RlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'Album Compact de base NextGEN', '', 'draft', 'closed', 'closed', '', '', '', '', '2015-12-02 10:19:00', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6IkFsYnVtIENvbXBhY3QgZGUgYmFzZSBOZXh0R0VOIiwiZW50aXR5X3R5cGVzIjpbImFsYnVtIiwiZ2FsbGVyeSJdLCJwcmV2aWV3X2ltYWdlX3JlbHBhdGgiOiJcXG5leHRnZW4tZ2FsbGVyeVxccHJvZHVjdHNcXHBob3RvY3JhdGlfbmV4dGdlblxcbW9kdWxlc1xcbmV4dGdlbl9iYXNpY19hbGJ1bVxcc3RhdGljXFxjb21wYWN0X3ByZXZpZXcuanBnIiwiZGVmYXVsdF9zb3VyY2UiOiJhbGJ1bXMiLCJ2aWV3X29yZGVyIjoxMDIwMCwibmFtZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY19jb21wYWN0X2FsYnVtIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuMTUiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwiZ2FsbGVyaWVzX3Blcl9wYWdlIjowLCJlbmFibGVfYnJlYWRjcnVtYnMiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwidGVtcGxhdGUiOiIiLCJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiZ2FsbGVyeV9kaXNwbGF5X3RlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://localhost/wpmj/?post_type=display_type&p=32', 0, 'display_type', '', 0),
(33, 1, '2015-12-02 10:19:01', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6IkFsYnVtIFx1MDBlOXRlbmR1IGRlIGJhc2UgTmV4dEdFTiIsImVudGl0eV90eXBlcyI6WyJhbGJ1bSIsImdhbGxlcnkiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXFxuZXh0Z2VuLWdhbGxlcnlcXHByb2R1Y3RzXFxwaG90b2NyYXRpX25leHRnZW5cXG1vZHVsZXNcXG5leHRnZW5fYmFzaWNfYWxidW1cXHN0YXRpY1xcZXh0ZW5kZWRfcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImFsYnVtcyIsInZpZXdfb3JkZXIiOjEwMjEwLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2V4dGVuZGVkX2FsYnVtIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuMTUiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwiZ2FsbGVyaWVzX3Blcl9wYWdlIjowLCJlbmFibGVfYnJlYWRjcnVtYnMiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwidGVtcGxhdGUiOiIiLCJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOjAsInRodW1ibmFpbF93aWR0aCI6MjQwLCJ0aHVtYm5haWxfaGVpZ2h0IjoxNjAsInRodW1ibmFpbF9xdWFsaXR5IjoxMDAsInRodW1ibmFpbF9jcm9wIjp0cnVlLCJ0aHVtYm5haWxfd2F0ZXJtYXJrIjowLCJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiZ2FsbGVyeV9kaXNwbGF5X3RlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 'Album étendu de base NextGEN', '', 'draft', 'closed', 'closed', '', '', '', '', '2015-12-02 10:19:01', '0000-00-00 00:00:00', 'eyJ0aXRsZSI6IkFsYnVtIFx1MDBlOXRlbmR1IGRlIGJhc2UgTmV4dEdFTiIsImVudGl0eV90eXBlcyI6WyJhbGJ1bSIsImdhbGxlcnkiXSwicHJldmlld19pbWFnZV9yZWxwYXRoIjoiXFxuZXh0Z2VuLWdhbGxlcnlcXHByb2R1Y3RzXFxwaG90b2NyYXRpX25leHRnZW5cXG1vZHVsZXNcXG5leHRnZW5fYmFzaWNfYWxidW1cXHN0YXRpY1xcZXh0ZW5kZWRfcHJldmlldy5qcGciLCJkZWZhdWx0X3NvdXJjZSI6ImFsYnVtcyIsInZpZXdfb3JkZXIiOjEwMjEwLCJuYW1lIjoicGhvdG9jcmF0aS1uZXh0Z2VuX2Jhc2ljX2V4dGVuZGVkX2FsYnVtIiwiaW5zdGFsbGVkX2F0X3ZlcnNpb24iOiIyLjEuMTUiLCJpZF9maWVsZCI6IklEIiwic2V0dGluZ3MiOnsidXNlX2xpZ2h0Ym94X2VmZmVjdCI6dHJ1ZSwiZ2FsbGVyaWVzX3Blcl9wYWdlIjowLCJlbmFibGVfYnJlYWRjcnVtYnMiOjEsImRpc2FibGVfcGFnaW5hdGlvbiI6MCwidGVtcGxhdGUiOiIiLCJvdmVycmlkZV90aHVtYm5haWxfc2V0dGluZ3MiOjAsInRodW1ibmFpbF93aWR0aCI6MjQwLCJ0aHVtYm5haWxfaGVpZ2h0IjoxNjAsInRodW1ibmFpbF9xdWFsaXR5IjoxMDAsInRodW1ibmFpbF9jcm9wIjp0cnVlLCJ0aHVtYm5haWxfd2F0ZXJtYXJrIjowLCJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwiZ2FsbGVyeV9kaXNwbGF5X3RlbXBsYXRlIjoiIiwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciJ9LCJoaWRkZW5fZnJvbV91aSI6ZmFsc2UsIl9fZGVmYXVsdHNfc2V0Ijp0cnVlfQ==', 0, 'http://localhost/wpmj/?post_type=display_type&p=33', 0, 'display_type', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjterms`
--

CREATE TABLE IF NOT EXISTS `wp_mjterms` (
  `term_id` bigint(20) unsigned NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `wp_mjterms`
--

INSERT INTO `wp_mjterms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Non classé', 'non-classe', 0),
(2, 'Menu Principal', 'menu-principal', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjterm_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_mjterm_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `wp_mjterm_relationships`
--

INSERT INTO `wp_mjterm_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(6, 2, 0),
(8, 2, 0),
(9, 2, 0),
(10, 2, 0),
(26, 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjterm_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_mjterm_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `wp_mjterm_taxonomy`
--

INSERT INTO `wp_mjterm_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 5);

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjusermeta`
--

CREATE TABLE IF NOT EXISTS `wp_mjusermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `wp_mjusermeta`
--

INSERT INTO `wp_mjusermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin_mj'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_mjcapabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_mjuser_level', '10'),
(12, 1, 'dismissed_wp_pointers', ''),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'session_tokens', 'a:2:{s:64:"b7bfeaf1e4669bba197ff93347568db3a9393fe35476eb5699cc3597d97e3181";a:4:{s:10:"expiration";i:1449153047;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36";s:5:"login";i:1448980247;}s:64:"9461c98a8e32b3008430385f6cb72aaec0294b7080bf195c3c10a9e5d4ea1e33";a:4:{s:10:"expiration";i:1449219084;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36";s:5:"login";i:1449046284;}}'),
(15, 1, 'wp_mjdashboard_quick_press_last_post_id', '3'),
(16, 1, 'wp_mjuser-settings', 'libraryContent=browse'),
(17, 1, 'wp_mjuser-settings-time', '1448981120'),
(18, 1, 'nav_menu_recently_edited', '2'),
(19, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(20, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:"add-post_tag";}'),
(21, 2, 'nickname', 'kira'),
(22, 2, 'first_name', ''),
(23, 2, 'last_name', ''),
(24, 2, 'description', ''),
(25, 2, 'rich_editing', 'true'),
(26, 2, 'comment_shortcuts', 'false'),
(27, 2, 'admin_color', 'fresh'),
(28, 2, 'use_ssl', '0'),
(29, 2, 'show_admin_bar_front', 'true'),
(30, 2, 'wp_mjcapabilities', 'a:1:{s:13:"administrator";b:1;}'),
(31, 2, 'wp_mjuser_level', '10'),
(32, 2, 'dismissed_wp_pointers', '');

-- --------------------------------------------------------

--
-- Structure de la table `wp_mjusers`
--

CREATE TABLE IF NOT EXISTS `wp_mjusers` (
  `ID` bigint(20) unsigned NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `wp_mjusers`
--

INSERT INTO `wp_mjusers` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin_mj', '$P$BiEYDbFFmUnJtEyPREHDnUxM.u4zQH0', 'admin_mj', 'johnson.meddy@gmail.com', '', '2015-12-01 14:29:57', '', 0, 'admin_mj'),
(2, 'kira', '$P$BGs0YwO/KuYtYzpR.8F/8ihUt218S21', 'kira', 'misslandeau@gmail.com', '', '2015-12-02 09:21:19', '1449048083:$P$Bv3S4Nt5eEXtplCfa49xw.4jrjVm031', 0, 'kira');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `wp_mjcommentmeta`
--
ALTER TABLE `wp_mjcommentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Index pour la table `wp_mjcomments`
--
ALTER TABLE `wp_mjcomments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Index pour la table `wp_mjgallery_albums`
--
ALTER TABLE `wp_mjgallery_albums`
  ADD PRIMARY KEY (`album_id`);

--
-- Index pour la table `wp_mjgallery_pics`
--
ALTER TABLE `wp_mjgallery_pics`
  ADD PRIMARY KEY (`pic_id`);

--
-- Index pour la table `wp_mjgallery_settings`
--
ALTER TABLE `wp_mjgallery_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Index pour la table `wp_mjlinks`
--
ALTER TABLE `wp_mjlinks`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Index pour la table `wp_mjngg_album`
--
ALTER TABLE `wp_mjngg_album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extras_post_id_key` (`extras_post_id`);

--
-- Index pour la table `wp_mjngg_gallery`
--
ALTER TABLE `wp_mjngg_gallery`
  ADD PRIMARY KEY (`gid`),
  ADD KEY `extras_post_id_key` (`extras_post_id`);

--
-- Index pour la table `wp_mjngg_pictures`
--
ALTER TABLE `wp_mjngg_pictures`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `extras_post_id_key` (`extras_post_id`);

--
-- Index pour la table `wp_mjoptions`
--
ALTER TABLE `wp_mjoptions`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Index pour la table `wp_mjpostmeta`
--
ALTER TABLE `wp_mjpostmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Index pour la table `wp_mjposts`
--
ALTER TABLE `wp_mjposts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Index pour la table `wp_mjterms`
--
ALTER TABLE `wp_mjterms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Index pour la table `wp_mjterm_relationships`
--
ALTER TABLE `wp_mjterm_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Index pour la table `wp_mjterm_taxonomy`
--
ALTER TABLE `wp_mjterm_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Index pour la table `wp_mjusermeta`
--
ALTER TABLE `wp_mjusermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Index pour la table `wp_mjusers`
--
ALTER TABLE `wp_mjusers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `wp_mjcommentmeta`
--
ALTER TABLE `wp_mjcommentmeta`
  MODIFY `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `wp_mjcomments`
--
ALTER TABLE `wp_mjcomments`
  MODIFY `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `wp_mjgallery_albums`
--
ALTER TABLE `wp_mjgallery_albums`
  MODIFY `album_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `wp_mjgallery_pics`
--
ALTER TABLE `wp_mjgallery_pics`
  MODIFY `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `wp_mjgallery_settings`
--
ALTER TABLE `wp_mjgallery_settings`
  MODIFY `setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT pour la table `wp_mjlinks`
--
ALTER TABLE `wp_mjlinks`
  MODIFY `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `wp_mjngg_album`
--
ALTER TABLE `wp_mjngg_album`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `wp_mjngg_gallery`
--
ALTER TABLE `wp_mjngg_gallery`
  MODIFY `gid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `wp_mjngg_pictures`
--
ALTER TABLE `wp_mjngg_pictures`
  MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `wp_mjoptions`
--
ALTER TABLE `wp_mjoptions`
  MODIFY `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=335;
--
-- AUTO_INCREMENT pour la table `wp_mjpostmeta`
--
ALTER TABLE `wp_mjpostmeta`
  MODIFY `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=221;
--
-- AUTO_INCREMENT pour la table `wp_mjposts`
--
ALTER TABLE `wp_mjposts`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT pour la table `wp_mjterms`
--
ALTER TABLE `wp_mjterms`
  MODIFY `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `wp_mjterm_taxonomy`
--
ALTER TABLE `wp_mjterm_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `wp_mjusermeta`
--
ALTER TABLE `wp_mjusermeta`
  MODIFY `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT pour la table `wp_mjusers`
--
ALTER TABLE `wp_mjusers`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
