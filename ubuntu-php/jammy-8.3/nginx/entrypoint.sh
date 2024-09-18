#!/bin/bash

service php8.3-fpm start
service nginx restart

chown -R root:www-data /var/www/html
chmod -R 770 /var/www/html

php artisan migrate --seed

echo ========= nginx: error.logs =========
tail -f /var/log/nginx/error.log