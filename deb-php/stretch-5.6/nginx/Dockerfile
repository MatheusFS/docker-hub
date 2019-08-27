FROM flaviosilveira/php-nginx-2:latest
# matheusfs/deb-php:base

RUN echo "deb http://ftp.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list.d/jessie.list
RUN echo "deb-src http://ftp.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list.d/jessie.list
RUN echo "deb http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list.d/jessie.list
RUN echo "deb-src http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list.d/jessie.list
RUN apt-get update
RUN apt-get install -y php5-mysql \ 
    php5-curl

COPY nginx.conf /etc/nginx/sites-available/default
RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
WORKDIR /var/www/app
