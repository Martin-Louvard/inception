#!/bin/bash

if [ -f ./wp-config.php ] 
then
	echo "wordpress already downloaded"
else
	sleep 10
	wp config create --allow-root \
			--dbname=$SQL_DATABASE \
			--dbuser=$SQL_USER \
			--dbpass=$SQL_PASSWOrD \
			--dbhost=mariadb:3306 --path='/var/www/wordpress'

fi
