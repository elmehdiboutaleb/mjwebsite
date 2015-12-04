<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Le script de création wp-config.php utilise ce fichier lors de l'installation.
 * Vous n'avez pas à utiliser l'interface web, vous pouvez directement
 * renommer ce fichier en "wp-config.php" et remplir les variables à la main.
 *
 * Ce fichier contient les configurations suivantes :
 *
 * * réglages MySQL ;
 * * clefs secrètes ;
 * * préfixe de tables de la base de données ;
 * * ABSPATH.
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */

/*
define('DB_NAME', 'elmehdibrhcntct');
define('DB_USER', 'elmehdibrhcntct');
define('DB_PASSWORD', 'mJ_2015#');
define('DB_HOST', 'db4free.net');
define('DB_CHARSET', 'utf8mb4');
*/

if ($_SERVER['HTTP_HOST'] == 'localhost') {
	define('DB_NAME', 'wpmj');
	define('DB_USER', 'root');
	define('DB_PASSWORD', '');
	define('DB_HOST', 'localhost');
	define('DB_CHARSET', 'utf8mb4');
} else {
	define('DB_NAME', 'elmehdibrhcntct');
	define('DB_USER', 'elmehdibrhcntct');
	define('DB_PASSWORD', 'BddOvhEmb88');
	define('DB_HOST', 'localhost');
	define('DB_CHARSET', 'utf8mb4');
}

/** Type de collation de la base de données.
  * N'y touchez que si vous savez ce que vous faites.
  */
define('DB_COLLATE', '');

/**#@+
 * Clefs uniques d'authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clefs secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n'importe quel moment, afin d'invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '.X/+v9SMM@.BN0PIu|)z9kB1v3[r4w_9yX8[kyJ_+P|4oB`kSTRc*S9YJmi<f:nE');
define('SECURE_AUTH_KEY',  '7fyM3Oa5**ec}T9VyDO7o@.|m0jA>wCS-i|9vyrayd{gN=DsrBh2-df-eyp<*3+^');
define('LOGGED_IN_KEY',    '*9k_&px3h{?@uh;-eOgQYBqQn3fcXo*UF B}eX6(TT8g]DQkj|QkYy}:r79/v:ak');
define('NONCE_KEY',        '+I#ZYY,BS(p/AesEjq?zr:#5=*#9wDyE~NA+kP/3s1tp#5P9=E-&`Bl@UOzPz+T=');
define('AUTH_SALT',        '1qf)o?VR_2|t]I-z 32-0^c<fOWN(z9m$lw,hFL~A9nIGmF,]3*=D3@xz/iZL4Kw');
define('SECURE_AUTH_SALT', '/M24lpd:B0>F#A1,hM-1n,`|Ou9G/1mrRG.|#9k</-wm[eyR,g{ye8RiB_[hU@qA');
define('LOGGED_IN_SALT',   'wnJyZY|sX&k~i,o.f)]wGTwg^7Chc%?i8IV`sEHM^W&D-G*5k7v`7-SeAOFT#_KM');
define('NONCE_SALT',       'UO:Nx+ox1Ieb$Y(q=ZA$ujhgD~NQ0!{,-`0Fb|R3 oOyet@#f`|}M3RNWO3YQGF1');
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N'utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés!
 */
$table_prefix  = 'wp_mj';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l'affichage des
 * notifications d'erreurs pendant votre essais.
 * Il est fortemment recommandé que les développeurs d'extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour obtenir plus d'information sur les constantes
 * qui peuvent être utilisée pour le déboguage, consultez le Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', true);

/* C'est tout, ne touchez pas à ce qui suit ! Bon blogging ! */

/** Chemin absolu vers le dossier de WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once(ABSPATH . 'wp-settings.php');