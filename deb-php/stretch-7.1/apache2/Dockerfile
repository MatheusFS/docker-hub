FROM matheusfs/deb-php:stretch-7.1-base

RUN apt-get install -y apache2 libapache2-mod-php7.1
RUN update-alternatives --set php /usr/bin/php7.1
RUN a2enmod php7.1
RUN a2enmod rewrite

COPY apache.conf /etc/apache2/sites-available/000-default.conf
RUN ln -sf /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-enabled/000-default.conf

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
WORKDIR /var/www/html
