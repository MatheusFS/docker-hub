FROM debian
LABEL Author="Matheus Ferreira <matheusfs97@gmail.com>"
# ========== SET UP APT-GET & ENVIRONMENT ==========
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y software-properties-common \ 
    curl
RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV PATH ${PATH}:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
# =============== INSTALL PHP & LIBRARIES ===============
RUN apt -y install apt-transport-https lsb-release ca-certificates wget
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
RUN apt update 
RUN apt -y install php5.6 \ 
    php5.6-fpm \ 
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
