
#!/bin/bash


# Configure MariaDB to accept connections from any host
sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
service mysql start

mysql_install_db 
mysqld_safe &

sleep 5

 
# Create the database

mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOF
    CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
    CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
    FLUSH PRIVILEGES;
    ALTER user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';
EOF


mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

mysqld_safe





