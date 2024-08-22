FROM alpine:3.20

RUN apk update && \
    apk upgrade && \
    apk add --no-cache mariadb mariadb-client

EXPOSE 3306

RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

RUN mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

ENTRYPOINT ["mysqld_safe"]