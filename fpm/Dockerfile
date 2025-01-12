FROM php:8.3-fpm

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y

RUN docker-php-ext-install -j$(nproc) mysqli pdo_mysql opcache

RUN apt-get install -y libicu-dev && docker-php-ext-install intl

RUN apt-get install -y libzip-dev && docker-php-ext-install zip

RUN pecl install --force redis && rm -rf /tmp/pear && docker-php-ext-enable redis

RUN apt-get install -y \
    libfreetype-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN apt-get install git telnet unzip systemctl -y

RUN mkdir -p /usr/local/var/log
RUN touch /usr/local/var/log/php-fpm.log
RUN touch /usr/local/var/log/www.error.log
RUN touch /usr/local/var/log/www.slow.log
RUN touch /usr/local/var/log/www.access.log

COPY auth.json /root/.composer/auth.json
COPY composer.json .
COPY entrypoint.sh /docker-entrypoint.d/
RUN chmod +x /docker-entrypoint.d/entrypoint.sh

RUN useradd -m -G root,www-data -s /bin/bash fpm
RUN usermod -G fpm,www-data www-data
RUN chown -R fpm:www-data /var/www/html /home/fpm
RUN chmod -R g+w /var/www/html /home/fpm /usr/local/bin /usr/local/var/log

USER fpm

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# RUN composer update --no-scripts
# RUN composer dump --no-scripts