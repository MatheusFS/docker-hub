FROM debian:stretch-slim
LABEL Author="Matheus Ferreira <matheusfs97@gmail.com>"
# ========== SET UP APT-GET & ENVIRONMENT ==========
RUN echo "deb http://ftp.br.debian.org/debian buster main " >> /etc/apt/sources.list
RUN echo "deb http://ftp.br.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
RUN echo "deb http://security.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nano \
    software-properties-common \
    apt-transport-https \
    apt-utils \
    lsb-release \
    ca-certificates \
    wget locales \
    locales-all
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt-get update && apt-get upgrade -y
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV PATH /usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
# INSTALL CERTBOT
RUN apt-get install -y python-certbot-apache python-certbot-nginx -t stretch-backports
# =============== INSTALL PHP & LIBRARIES ===============
# PHP-GD DEPENDENCIES
RUN wget http://ftp.de.debian.org/debian/pool/main/libw/libwebp/libwebp5_0.4.1-1.2+b2_amd64.deb
RUN apt-get install ./libwebp5_0.4.1-1.2+b2_amd64.deb
RUN rm ./libwebp5_0.4.1-1.2+b2_amd64.deb
# PHP-IMAGICK DEPENDENCIES
RUN wget http://security.debian.org/debian-security/pool/updates/main/i/imagemagick/imagemagick-common_6.8.9.9-5+deb8u19_all.deb
RUN apt-get install ./imagemagick-common_6.8.9.9-5+deb8u19_all.deb
RUN rm ./imagemagick-common_6.8.9.9-5+deb8u19_all.deb
RUN apt-get install -y libmagickcore-6.q16-2
# LARAVEL 6 PHP Extensions
# Curl*, MySQL*, BCMath, Ctype, JSON, Mbstring, OpenSSL, PDO, Tokenizer, XML.
RUN apt-get update -y
RUN apt-get -y install php7.3 \ 
    php7.3-fpm \ 
    php7.3-intl \ 
    php7.3-zip \ 
    php7.3-curl \ 
    php7.3-mysql \ 
    php7.3-bcmath \
    php7.3-ctype \
    php7.3-json \
    php7.3-mbstring \
    php7.3-pdo \ 
    php7.3-tokenizer \ 
    php7.3-xml \  
    php7.3-gd \  
    openssl
RUN apt-get -y install php7.3-dev php-pear
RUN apt-get -y install php7.3-igbinary \ 
    php7.3-redis \ 
    php7.3-xdebug
