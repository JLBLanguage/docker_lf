#!/bin/bash

echo "---------------------------------------------------"
echo "run init script"
echo "---------------------------------------------------"

if [ -n "$MYSQL_PASSWORD" ] ; then
	echo "---------------------------------------------------"
 	echo "setup root password and grand privileges"
	echo "---------------------------------------------------"
	TEMP_FILE='/tmp/mysql-first-time.sql'
	cat > "$TEMP_FILE" <<-EOSQL
		DELETE FROM mysql.user WHERE user = 'root' AND host = '%';
		CREATE USER 'root'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;
		GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION ;
		FLUSH PRIVILEGES ;
		CREATE DATABASE liferay CHARACTER SET utf8 COLLATE utf8_unicode_ci;
	EOSQL

	echo "setup root password and grand privileges FINISH"
	# set this as an init-file to execute on startup
	set -- "$@" --init-file="$TEMP_FILE" 
else
	 echo "---------------------------------------------------"
	 echo "unable to setup root password"
	 echo "---------------------------------------------------"
fi

# execute the command supplied

exec "$@"



