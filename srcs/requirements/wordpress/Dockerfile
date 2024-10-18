FROM alpine:3.20

RUN apk update && \
    apk upgrade
RUN apk add php83 \
    php83-fpm \
    curl \
    php83-mysqli \
    php83-phar \
    php83-common \
    php83-apache2 \
    php83-iconv \
    bash

RUN adduser -S www-data -G www-data

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./www.conf /etc/php83/php-fpm.d/www.conf

EXPOSE 9000

COPY entry.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entry.sh

CMD ["/usr/local/bin/entry.sh"]
