#!bin/bash

echo USE mysql\;;
echo FLUSH PRIVILEGES\;;
echo DELETE FROM mysql.user WHERE User=\'\'\;;
echo "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');";
echo -n "ALTER USER 'root'@'localhost' IDENTIFIED BY '";
echo -n ${MYSQL_ROOT_PASSWORD};
echo "';";
echo CREATE DATABASE ${DB_NAME}\;;
echo -n "CREATE USER '";
echo -n ${MYSQL_USER};
echo -n "'@'%' IDENTIFIED BY '";
echo -n ${MYSQL_USER_PASSWORD};
echo "';";
echo -n "GRANT ALL PRIVILEGES ON *.* TO '";
echo -n ${MYSQL_USER};
echo "'@'%' WITH GRANT OPTION;";
echo "FLUSH PRIVILEGES;";

