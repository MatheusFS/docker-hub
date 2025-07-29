FROM mysql:8.0-debian

COPY my.cnf /etc/mysql/conf.d/my.cnf
COPY schema.sql /etc/mysql/schema-init.sql
COPY entrypoint.sh /docker-entrypoint.d/

RUN chown -R mysql:mysql /etc/mysql /var/lib/mysql
RUN chmod +x /docker-entrypoint.d/entrypoint.sh \
    && chmod 770 /etc/mysql/conf.d/my.cnf