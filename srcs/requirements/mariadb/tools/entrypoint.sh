#! /bin/bash

service mariadb start
sleep 5

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;" -uroot -p${MARIADB_ROOT_PWD}
mariadb -e "CREATE USER IF NOT EXISTS \`${MARIADB_ROOT_USER}\`@'%' IDENTIFIED BY '${MARIADB_ROOT_PWD}';" -uroot -p${MARIADB_ROOT_PWD}
mariadb -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_ROOT_USER}\`@'%';" -uroot -p${MARIADB_ROOT_PWD}
mariadb -e "FLUSH PRIVILEGES;" -uroot -p${MARIADB_ROOT_PWD}

mysqladmin shutdown -uroot -p${MARIADB_ROOT_PWD}
exec "$@"
