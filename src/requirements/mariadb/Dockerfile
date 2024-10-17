FROM debian:12.6

ARG MYSQL_ROOT_PASSWORD MYSQL_USER MYSQL_USER_PASSWORD MYSQL_VOL DB_NAME

RUN apt update && apt upgrade -y && apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY tools/init.sql /etc/mysql/init.sql
# CURSED VERSION
COPY tools/init.sh /bin/
COPY tools/init_sql.sh /bin/

RUN chmod 777 /bin/init.sh
RUN chmod 777 /bin/init_sql.sh
RUN mkdir /run/mysqld

RUN mkdir /etc/mysql -p
RUN init.sh 

# creates dependency

CMD [ "mysqld" ]

