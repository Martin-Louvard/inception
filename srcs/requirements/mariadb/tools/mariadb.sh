#!/bin/bash

/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of Mariadb service startup..."
    sleep 2
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

echo "=> Creating Mariadb database named ${SQL_DATABASE}"

mysql -uroot -e "CREATE DATABASE ${SQL_DATABASE};"
mysql -uroot -e "CREATE USER '${SQL_ADMIN}'@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${SQL_ADMIN}'@'%' WITH GRANT OPTION"
mysql -uroot -e "FLUSH PRIVILEGES;"
mysql -uroot -e "CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' WITH GRANT OPTION"
mysql -uroot -e "FLUSH PRIVILEGES;"

echo "=> Done!"

echo "========================================================================"
echo "You can now connect to this Mariadb Server using:"
echo ""
echo "    mariadb -u'user' -p'password' -h<host> -P<port>"
echo ""
echo "========================================================================"

mysqladmin -uroot shutdown

touch ${DB_PATH}/.initialized_db

exec "$@"
