#!/bin/bash

if [ -f ./wp-config.php ] 
then
	echo "wordpress already downloaded"
else


	sleep 10
	#Download wordpress and all config file
	#wget http://wordpress.org/latest.tar.gz
	#tar xfz latest.tar.gz
	#mv wordpress/* .
	#rm -rf latest.tar.gz
	#rm -rf wordpress
	#chmod -R 755 /var/www/html

	#Inport env variables in the config file
	#sed -i "s/username_here/$SQL_USER/g" wp-config-sample.php
	#sed -i "s/password_here/$SQL_PASSWORD/g" wp-config-sample.php
	#sed -i "s/localhost/$SQL_HOSTNAME/g" wp-config-sample.php
	#sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php
	#cp wp-config-sample.php wp-config.php

	#wp 5 min config
	#wp core download --allow-root --path="${WP_PATH}"
	#wp config create --allow-root --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} --dbhost=${DB_HOST} --dbprefix=wp_ --config-file="${WP_PATH}/wp-config.php" --path="${WP_PATH}"
	#wp core install --allow-root --url="${DOMAIN_NAME}" --title=${WP_TITLE} --admin_user=${SQL_ADMIN} --admin_password=${SQL_ROOT_PASSWORD} --admin_email="${ADMIN_MAIL}" --path="${WP_PATH}" --skip-email
	#wp user create --allow-root "${SQL_USER}" "${USER_EMAIL}" --user_pass="${SQL_PASSWORD}" --path="${WP_PATH}"


	wp core download --allow-root --path="${WP_PATH}"
	chmod -R 755 /var/www/html
	sed -i "s/username_here/$SQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$SQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$SQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
	#wp config create --allow-root --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} --dbhost=${DB_HOST} --dbprefix=wp_ --config-file="${WP_PATH}/wp-config.php" --path="${WP_PATH}"
	wp core install --allow-root --url="${DOMAIN_NAME}" --title=${WP_TITLE} --admin_user=${SQL_ADMIN} --admin_password=${SQL_ROOT_PASSWORD} --admin_email="${ADMIN_MAIL}" --path="${WP_PATH}" --skip-email
	wp user create --allow-root "${SQL_USER}" "${USER_EMAIL}" --user_pass="${SQL_PASSWORD}" --path="${WP_PATH}"
fi

exec "$@"