FROM matheusfs/ubuntu-php:jammy-8.3

WORKDIR /var/www/html

RUN rm -rf *

RUN apt-get install -y nginx

RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8000