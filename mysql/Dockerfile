FROM mysql:lts

COPY my.cnf /etc/mysql/conf.d/my.cnf
RUN chown -R mysql:mysql /etc/mysql /var/lib/mysql
RUN chmod 770 /etc/mysql/conf.d/my.cnf

# ADD schema.sql /docker-entrypoint-initdb.d
COPY entrypoint.sh /docker-entrypoint.d