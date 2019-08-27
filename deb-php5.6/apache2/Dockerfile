FROM matheusfs/deb-php:base

RUN apt-get install -y apache2
RUN apt-get install libapache2-mod-php5.6
RUN a2enmod php5.6
RUN a2enmod rewrite

COPY apache.conf /etc/apache2/sites-available/000-default.conf
RUN ln -sf /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-enabled/000-default.conf

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
WORKDIR /var/www/html
