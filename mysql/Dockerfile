FROM mysql:lts

COPY my.cnf /etc/mysql/conf.d/my.cnf
COPY schema.sql /docker-entrypoint-initdb.d/schema.sql
COPY entrypoint.sh /usr/local/bin/custom-entrypoint.sh

RUN chown -R mysql:mysql /etc/mysql /var/lib/mysql \
    && chmod +x /usr/local/bin/custom-entrypoint.sh \
    && chmod 644 /etc/mysql/conf.d/my.cnf

ENTRYPOINT ["custom-entrypoint.sh"]
CMD ["mysqld"]