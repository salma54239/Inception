#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp 

sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = 9000|g" /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php
mkdir -p /var/www/html 
cd /var/www/html
 if [ ! -f wp-config.php ]; then
    wp core download --allow-root 
    sleep 100
    wp core config --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root 

    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$MYSQL_ROOT_USER --admin_password=$MYSQL_ROOT_PASSWORD --admin_email=$DB_EMAIL --allow-root 

    wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root 
    
fi

/usr/sbin/php-fpm7.3 -F
