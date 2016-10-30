FROM alpine:3.4

RUN apk add --no-cache mysql && \
    mkdir -p /var/lib/mysql && \
    mkdir -p /etc/mysql/conf.d
ADD my.cnf /etc/mysql/my.cnf
RUN mysql_install_db --user=root --ldata=/var/lib/mysql

EXPOSE 3306
VOLUME ["/var/lib/mysql", "/etc/mysql/conf.d"]

ENTRYPOINT ["mysqld"]