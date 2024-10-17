FROM debian:12.6

ARG MYSQL_ROOT_PASSWORD MYSQL_USER MYSQL_USER_PASSWORD MYSQL_VOL DB_NAME WP_URL WP_TITLE WP_ADMIN WP_ADMIN_PASSWORD WP_ADMIN_EMAIL WP_USER WP_USER_EMAIL WP_USER_PASSWORD
RUN apt update && apt upgrade -y && apt install -y php8.2-mysqli php8.2-fpm mariadb-client wget unzip

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY tools/conf.sh /bin/
COPY tools/init.sh /bin/

RUN chmod 777 /bin/init.sh
RUN chmod 777 /bin/conf.sh

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.zip -P./

RUN	unzip latest.zip
	
RUN ls wordpress

RUN cp -rf wordpress/* . && rm -rf wordpress latest.zip

# RUN init.sh
RUN chmod -R 0777 wp-content/
CMD [ "init.sh" ]

# CMD [ "php-fpm8.2", "-F" ]
