#! /bin/bash

service mariadb start
sleep 5

#echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;" | mysql -uroot -p$MARIADB_ROOT_PWD # login as root then run query to create
#
#echo "CREATE USER IF NOT EXISTS '$MARIADB_ROOT_USER'@'%' IDENTIFIED BY '$MARIADB_ROOT_PWD';" | mysql -uroot -p$MARIADB_ROOT_PWD
## @ is delimiter, % is database address
#
#echo "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_ROOT_USER'@'%';" | mysql -uroot -p$MARIADB_ROOT_PWD
## GRANT ROOT USER ALL PRIVILEGES ON ALL TABLES IN DB
#
#echo "FLUSH PRIVILEGES;" | mysql -uroot -p$MARIADB_ROOT_PWD
## FLUSH means update


mariadb -e "CREATE USER IF NOT EXISTS '${MARIADB_ROOT_USER}'@'%' IDENTIFIED BY '${MARIADB_ROOT_PWD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_ROOT_USER}'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

exec "$@" # RUN CMD
