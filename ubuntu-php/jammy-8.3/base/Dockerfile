FROM ubuntu:jammy
LABEL Author="Matheus Ferreira <matheusfs97@gmail.com>"
# ========== SET UP APT-GET & ENVIRONMENT ==========
RUN apt-get update -y && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y awscli \
    acl \
    git \
    supervisor \
    jq \
    ca-certificates \
    software-properties-common \
    apt-transport-https \
    apt-utils \
    lsb-release \
    ruby-full \
    dpkg-dev
# ENV LC_ALL=en_US.UTF-8
# ENV LANG=en_US.UTF-8
# ENV LANGUAGE=en_US.UTF-8
ENV PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin

# =============== INSTALL PHP & EXTENSIONS ===============
RUN add-apt-repository ppa:ondrej/php
RUN echo "deb https://ppa.launchpadcontent.net/ondrej/php/ubuntu jammy main" >> /etc/apt/sources.list
RUN echo "deb-src https://ppa.launchpadcontent.net/ondrej/php/ubuntu jammy main" >> /etc/apt/sources.list
RUN apt-get update -y && apt-get upgrade -y

RUN apt-get -y install php8.3 php8.3-dev

RUN mkdir -p /home/php
RUN cd /home/php && apt-get source php8.3
RUN cd /home/php/php8.3-8.3.9/ext/pcntl && phpize && ./configure && make
RUN cp /home/php/php8.3-8.3.9/ext/pcntl/modules/pcntl.so $(php -i | grep extension_dir  | cut -d " " -f 5)
RUN mkdir -p /etc/php8.3/conf.d
RUN echo "extension=pcntl.so" > /etc/php8.3/conf.d/pcntl.ini

RUN apt-get -y install \
    php8.3-cli \
    php8.3-curl \
    php8.3-ctype \
    php8.3-common \
    php8.3-fpm \
    php8.3-fileinfo \
    php8.3-gd \
    php8.3-intl \
    php8.3-mbstring \
    php8.3-mysql \
    php8.3-pdo \
    php8.3-redis \
    php8.3-tokenizer \
    php8.3-xml \
    openssl