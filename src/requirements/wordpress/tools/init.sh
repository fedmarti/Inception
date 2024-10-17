#!/bin/bash

# cd /var/www/html;
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
# chmod +x wp-cli.phar;
# ./wp-cli.phar core download --allow-root;
# ./wp-cli.phar config create --dbname=wordpress --dbuser=${MYSQL_USER} --dbpass=${MYSQL_USER_PASSWORD} --dbhost=mariadb --allow-root;
# ./wp-cli.phar core install --url=localhost --title=inception --admin_user=root --admin_password=${MYSQL_USER_PASSWORD} --admin_email=fedmarti@student.42firenze.it --allow-root;


# php-fpm8.2", "-F


# /bin/conf.sh > /var/www/html/wp-config.php;


if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Wordpress: setting up...";
	mkdir -p /var/www/html;
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	mv /var/www/wp-config.php /var/www/html/;
	echo "Wordpress: creating users...";
	wp config create --dbname=wordpress --dbuser=${MYSQL_USER} --dbpass=${MYSQL_USER_PASSWORD} --dbhost=mariadb --allow-root;
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL};
	wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
	echo "Wordpress: set up!";
fi


exec php-fpm8.2 -F;