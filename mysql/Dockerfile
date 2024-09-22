FROM mysql:lts

RUN touch /etc/mysql/conf.d/my.cnf

ADD schema.sql /docker-entrypoint-initdb.d
ADD entrypoint.sh /docker-entrypoint.d