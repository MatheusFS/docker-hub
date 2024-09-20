FROM php:8.3-fpm

# RUN mkdir -p /usr/local/var/log
RUN touch /usr/local/var/log/www.error.log
RUN touch /usr/local/var/log/www.slow.log
RUN touch /usr/local/var/log/www.access.log

RUN docker-php-ext-install -j$(nproc) mysqli pdo_mysql

RUN pecl install --force redis \
&& rm -rf /tmp/pear \
&& docker-php-ext-enable redis

RUN apt update && apt install -y

RUN apt install git telnet -y