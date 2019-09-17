FROM debian:stretch-slim
LABEL Author="Matheus Ferreira <matheusfs97@gmail.com>"
# ========== SET UP APT-GET & ENVIRONMENT ==========
RUN echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y
RUN apt install -y python-certbot-apache -t stretch-backports
RUN apt-get install -y software-properties-common apt-transport-https lsb-release ca-certificates wget locales locales-all nano
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV PATH /usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
# =============== INSTALL PHP & LIBRARIES ===============
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
RUN echo "deb https://packages.sury.org/php/ jessie main" > /etc/apt/sources.list.d/php2.list
RUN apt-get update 
RUN apt-get -y install php5.6 \ 
    php5.6-fpm \ 
    php5.6-soap \ 
    php5.6-mbstring \ 
    php5.6-xml \ 
    php5.6-curl \ 
    php5.6-mysql \ 
    php5.6-imagick \ 
    php5.6-zip \ 
    libxrender1 \ 
    libfontconfig1 \ 
    libxtst6
# =================== INSTALL COMPOSER ===================
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"
