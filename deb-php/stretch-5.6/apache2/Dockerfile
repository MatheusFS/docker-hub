FROM matheusfs/deb-php:stretch-5.6-base

RUN apt-get update
RUN apt-get install -y apache2 libapache2-mod-php5.6
RUN update-alternatives --set php /usr/bin/php5.6
RUN a2enmod php5.6
RUN a2enmod rewrite

COPY apache.conf /etc/apache2/sites-available/000-default.conf
RUN ln -sf /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-enabled/000-default.conf

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
WORKDIR /var/www/html
