#!/bin/bash

echo "<?php";

echo "define( 'DB_NAME', '$DB_NAME' );";

echo "define( 'DB_USER', '$MYSQL_USER' );";

echo "define( 'DB_PASSWORD', '$MYSQL_USER_PASSWORD' );";

echo "define( 'DB_HOST', 'mariadb' );";

echo "define( 'DB_CHARSET', 'utf8' );";

echo "define( 'DB_COLLATE', '' );";

echo \$table_prefix = "'wp_';";

echo "define( 'WP_DEBUG', true );";
echo "define( 'WP_DEBUG_LOG', true );";


echo "define( 'WP_SITEURL', 'https://fedmarti.42.fr');";

echo "if ( ! defined( 'ABSPATH' ) ) {";

echo "	define( 'ABSPATH', __DIR__ . '/' );";

echo "}";

echo "require_once ABSPATH . 'wp-settings.php';";