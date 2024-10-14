FROM debian:12.6

RUN apt update && apt upgrade -y && apt install -y php-mysqli curl php-fpm

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

CMD [ "php-fpm8.2", "-F" ]