FROM alpine:3.20

RUN apk update && \
    apk upgrade && \
    apk add --no-cache mariadb mariadb-client bash

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./entry.sh /
RUN chmod +x /entry.sh

ENTRYPOINT ["/entry.sh"]