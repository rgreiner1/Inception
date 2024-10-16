FROM alpine:3.20

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        php \
        php-fpm \
        php-mysqli \
        php-json \
        php-xml \
        php-mbstring \
        php-curl \
        php-phar \
        php-opcache \
        php-session \
        curl \
        tar \
        supervisor \
        bash

RUN mkdir -p /var/www/html/example.com && \
    cd /var/www/html/example.com && \
    curl -L -O https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    rm latest.tar.gz

RUN adduser -S www-data -G www-data


COPY ./www.conf /etc/php83/php-fpm.d/www.conf

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html


RUN chown -R www-data:www-data /var/www/html/example.com/wordpress
RUN chmod -R 755 /var/www/html/example.com/wordpress

RUN chown -R nobody:nogroup /var/www/html/example.com
RUN chmod -R 755 /var/www/html/example.com

EXPOSE 9000

COPY supervisord.conf /etc/supervisord.conf


COPY entry.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entry.sh
ENTRYPOINT ["/usr/local/bin/entry.sh"]