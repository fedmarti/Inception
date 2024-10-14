FROM debian:12.6

RUN apt update && apt upgrade -y && apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init.sql /etc/mysql/init.sql

# creates dependency
RUN mkdir /run/mysqld

CMD [ "mysqld" ]
