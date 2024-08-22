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

EXPOSE 9000

ENTRYPOINT []