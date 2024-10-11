#!/bin/bash

echo "Initializing database..."

echo "Starting MariaDB temporarily..."
mysqld_safe --datadir=/var/lib/mysql --socket=/run/mysqld/mysqld.sock &
MYSQL_PID=$!

while ! mysqladmin ping --silent; do
    echo "Waiting for MariaDB to start..."
    sleep 2
done

echo "Setting up database and user..."

mysql -uroot -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -uroot -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';"
mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -uroot -e "FLUSH PRIVILEGES;"

wait $MYSQL_PID

echo "Starting MariaDB in foreground mode..."
exec mysqld_safe --user=mysql --datadir=/var/lib/mysql --socket=/run/mysqld/mysqld.sock
