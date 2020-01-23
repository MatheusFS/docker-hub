FROM debian:stretch-slim
LABEL Author="Matheus Ferreira <matheusfs97@gmail.com>"
# ========== SET UP APT-GET & ENVIRONMENT ==========
RUN echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
RUN echo "deb http://ftp.de.debian.org/debian jessie main" > /etc/apt/sources.list.d/php.list
RUN apt-get update && apt-get upgrade -y
RUN apt install -y python-certbot-apache python-certbot-nginx -t stretch-backports
RUN apt-get install -y nano software-properties-common apt-transport-https lsb-release ca-certificates wget locales locales-all libpng12-0
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV PATH /usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
# ============= INSTALL LIBWEBP5 FOR PHP-GD =============
RUN echo "deb http://security.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list.d/php.list
RUN apt-get update && apt-get upgrade -y
RUN wget http://ftp.de.debian.org/debian/pool/main/libw/libwebp/libwebp5_0.4.1-1.2+b2_amd64.deb
RUN apt-get install ./libwebp5_0.4.1-1.2+b2_amd64.deb
RUN rm ./libwebp5_0.4.1-1.2+b2_amd64.deb
# =============== INSTALL PHP & LIBRARIES ===============
# IMAGICK DEPS
RUN wget http://security.debian.org/debian-security/pool/updates/main/i/imagemagick/imagemagick-common_6.8.9.9-5+deb8u19_all.deb
RUN apt-get install ./imagemagick-common_6.8.9.9-5+deb8u19_all.deb
RUN rm ./imagemagick-common_6.8.9.9-5+deb8u19_all.deb
RUN apt install -y libmagickcore-6.q16-2
# ---
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install php7.2 \ 
    php7.2-gd \
    php7.2-fpm \
    php7.2-intl \
    php7.2-iconv \
    php7.2-imagick \
    php7.2-bcmath \
    php7.2-soap \ 
    php7.2-mbstring \ 
    php7.2-xml \ 
    php7.2-curl \ 
    php7.2-mysql \ 
    php7.2-zip \ 
    libxrender1 \ 
    libfontconfig1 \ 
    libxtst6
# =================== INSTALL COMPOSER ===================
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"
# ====================== INSTALL NVM ======================
RUN wget -O - https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
