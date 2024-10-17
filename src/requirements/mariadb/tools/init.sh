#!/bin/bash

if [ ! -d "/var/lib/mysql/wordpress" ]; then
	chown -R mysql:mysql /var/lib/mysql;
	
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql;

	touch f;
	if [ $? -ne 0 ]; then
		return 1;
	fi
fi



init_sql.sh > /etc/mysql/init.sql;
mysqld --user=mysql --bootstrap < /etc/mysql/init.sql;
