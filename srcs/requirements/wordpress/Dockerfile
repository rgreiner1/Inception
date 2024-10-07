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
        php-opcache \
        php-session \
        curl \
        tar \
        supervisor

RUN mkdir -p /var/www/html/example.com && \
    cd /var/www/html/example.com && \
    curl -L -O https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    rm latest.tar.gz

COPY supervisord.conf /etc/supervisord.conf

EXPOSE 9000

ENTRYPOINT ["supervisord", "-c", "/etc/supervisord.conf"]

