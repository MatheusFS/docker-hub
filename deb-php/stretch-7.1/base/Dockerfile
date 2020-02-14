FROM debian:stretch-slim
LABEL Author="Matheus Ferreira <matheusfs97@gmail.com>"
# ========== SET UP APT-GET & ENVIRONMENT ==========
RUN echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nano software-properties-common apt-transport-https lsb-release ca-certificates wget locales locales-all libpng12-0
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV PATH /usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
# INSTALL CERTBOT
RUN apt install -y python-certbot-apache python-certbot-nginx -t stretch-backports
# =============== INSTALL PHP & LIBRARIES ===============
# PHP-GD DEPENDENCIES
RUN echo "deb http://security.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list.d/php.list
RUN apt-get update && apt-get upgrade -y
RUN wget http://ftp.de.debian.org/debian/pool/main/libw/libwebp/libwebp5_0.4.1-1.2+b2_amd64.deb
RUN apt-get install ./libwebp5_0.4.1-1.2+b2_amd64.deb
RUN rm ./libwebp5_0.4.1-1.2+b2_amd64.deb
# PHP-IMAGICK DEPENDENCIES
RUN wget http://security.debian.org/debian-security/pool/updates/main/i/imagemagick/imagemagick-common_6.8.9.9-5+deb8u19_all.deb
RUN apt-get install ./imagemagick-common_6.8.9.9-5+deb8u19_all.deb
RUN rm ./imagemagick-common_6.8.9.9-5+deb8u19_all.deb
RUN apt install -y libmagickcore-6.q16-2
# LARAVEL 6 PHP Extensions
# BCMath, Ctype, JSON, Mbstring, OpenSSL, PDO, Tokenizer, XML.
RUN add-apt-repository ppa:ondrej/php
RUN apt update
RUN apt-get -y install php7.1 \ 
    php7.1-fpm \ 
    php7.1-zip \ 
    php7.1-bcmath \
    php7.1-ctype \
    php7.1-json \
    php7.1-mbstring \
    php7.1-pdo \ 
    php7.1-tokenizer \ 
    php7.1-xml \ 
    openssl
