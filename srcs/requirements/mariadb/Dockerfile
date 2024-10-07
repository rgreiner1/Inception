FROM alpine:3.20

RUN apk update && \
    apk upgrade && \
    apk add --no-cache mariadb mariadb-client && \
    apk add bash

COPY ./50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306


RUN mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
COPY ./entry.sh /
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]