#!/bin/bash

echo "Waiting for MariaDB to be ready..."
sleep 10

echo "hostname: $MYSQL_HOSTNAME"
echo "user: $MYSQL_USER"
echo "rootpw: $MYSQL_ROOT_PASSWORD"

echo "Setting up WordPress..."

# Check if WordPress core is already downloaded
if [ ! -d "/var/www/html/wp-includes" ]; then
    echo "Downloading WordPress core..."
    if ! wp core download --path="/var/www/html"; then
        echo "Failed to download WordPress"
        ls -l /var/www/html
        exit 1
    fi
else
    echo "WordPress core already downloaded."
fi

# Check if wp-config.php already exists
if [ ! -f "/var/www/html/wp-config.php" ]; then
    echo "Creating wp-config.php..."
    if ! wp config create --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="$(cat /run/secrets/db_password)" \
        --dbhost="${MYSQL_HOSTNAME}" \
        --path="/var/www/html"; then
        echo "Failed to create wp-config.php"
        exit 1
    fi
else
    echo "wp-config.php already exists."
fi

# Check if WordPress is already installed
if ! wp core is-installed --path="/var/www/html"; then
    echo "Installing WordPress..."
    if ! wp core install --url="${WORDPRESS_HOST}" \
        --title="WordPress Site" \
        --admin_user="${WORDPRESS_ADMIN_USER}" \
        --admin_password="${MYSQL_ROOT_PASSWORD}" \
        --admin_email="${WORDPRESS_ADMIN_EMAIL}" \
        --path="/var/www/html"; then
        echo "Failed to install WordPress"
        exit 1
    fi
else
    echo "WordPress is already installed."
fi

echo "WordPress setup complete."

# Uncomment this line if needed for PHP-FPM configuration
# sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' /etc/php83/php-fpm.d/www.conf

# Start PHP-FPM
exec php-fpm83 -F