#!/bin/bash


echo "Waiting for MariaDB to be ready..."
echo "hostname :$MYSQL_HOSTNAME"
echo "user :$MYSQL_USER"
echo "rootpw :$MYSQL_ROOT_PASSWORD"


echo "MariaDB is up and running."


exec php-fpm83 -F