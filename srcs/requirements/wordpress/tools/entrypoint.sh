#!/bin/bash
#---------------------------------------------------mariadb ping---------------------------------------------------#

ping_mariadb_container() {
    nc -zv mariadb 3306 > /dev/null
    return $?
}
start_time=$(date +%s)
end_time=$((start_time + 20))
while [ $(date +%s) -lt $end_time ]; do
    ping_mariadb_container
    if [ $? -eq 0 ]; then
        echo "[========MARIADB IS UP AND RUNNING========]"
        break
    else
        echo "[========WAITING FOR MARIADB TO START...========]"
        sleep 1
    fi
done

if [ $(date +%s) -ge $end_time ]; then
    echo "[========MARIADB IS NOT RESPONDING========]"
fi

#---------------------------------------------------wp installation---------------------------------------------------#

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html
chmod -R 755 /var/www/html/
chown -R www-data:www-data /var/www/html

check_core_files() {
    wp core is-installed --allow-root > /dev/null
    return $?
}
if ! check_core_files; then
    echo "[========WP INSTALLATION STARTED========]"
    find /var/www/html/ -mindepth 1 -delete
    wp core download --allow-root
    wp core config --dbhost=mariadb:3306 --dbname="$MARIADB_DATABASE" --dbuser="$MARIADB_ROOT_USER" --dbpass="$MARIADB_ROOT_PWD" --allow-root
    wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --allow-root
    wp user create "$WP_USER" "$WP_USER_EMAIL" --user_pass="$WP_USER_PASSWORD" --role="$WP_USER_ROLE" --allow-root
else
    echo "[========WordPress files already exist. Skipping installation========]"
fi

#---------------------------------------------------php config---------------------------------------------------#

sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F
