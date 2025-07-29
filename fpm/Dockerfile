FROM php:8.3-fpm-alpine

WORKDIR /var/www/html

# Ensure all packages are up-to-date to reduce vulnerabilities
RUN apk update && apk upgrade --no-cache

# Install PHP extensions and required Alpine packages
RUN apk add --no-cache \
    icu-dev \
    libzip-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    git \
    netcat-openbsd \
    unzip \
    bash \
    shadow \
    curl

RUN docker-php-ext-install -j$(nproc) mysqli pdo_mysql opcache

RUN docker-php-ext-install intl

RUN docker-php-ext-install zip

# Instala dependências de build temporárias para o redis
RUN apk add --no-cache --virtual .build-deps \
    autoconf \
    gcc \
    g++ \
    make \
    libc-dev \
    openssl-dev \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del .build-deps \
    && rm -rf /tmp/pear

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

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