FROM public.ecr.aws/docker/library/php:8.4-fpm-bookworm

WORKDIR /var/www/html

# Atualização base
RUN apt-get update && apt-get upgrade -y

# Dependências do sistema + build + FFmpeg (para conversão de áudio)
RUN apt-get install -y \
    curl \
    unzip \
    git \
    bash \
    netcat-openbsd \
    libicu-dev \
    libzip-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libonig-dev \
    libssl-dev \
    build-essential \
    autoconf \
    pkg-config \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# PHP extensions
RUN docker-php-ext-install -j$(nproc) \
    mysqli \
    pdo_mysql \
    opcache \
    intl \
    zip

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Redis (PECL)
RUN pecl channel-update pecl.php.net \
    && pecl install redis \
    && docker-php-ext-enable redis

# ---------- AWS CLI v2 ----------
RUN curl -fsSL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zip
# --------------------------------

# Logs PHP-FPM
RUN mkdir -p /usr/local/var/log \
    && touch \
        /usr/local/var/log/php-fpm.log \
        /usr/local/var/log/www.error.log \
        /usr/local/var/log/www.slow.log \
        /usr/local/var/log/www.access.log

# Composer auth
COPY auth.json /root/.composer/auth.json
COPY composer.json .

# Entrypoint
COPY entrypoint.sh /docker-entrypoint.d/
RUN chmod +x /docker-entrypoint.d/entrypoint.sh

# Usuários
RUN useradd -m -G root,www-data -s /bin/bash fpm \
    && usermod -G fpm,www-data www-data \
    && chown -R fpm:www-data /var/www/html /home/fpm \
    && chmod -R g+w /var/www/html /home/fpm /usr/local/bin /usr/local/var/log

# Composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm composer-setup.php

USER fpm