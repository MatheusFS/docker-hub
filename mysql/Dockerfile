FROM mysql:lts

RUN touch /etc/mysql/conf.d/my.cnf

ADD schema.sql /docker-entrypoint-initdb.d
CMD ["entrypoint.sh"]

EXPOSE 3306