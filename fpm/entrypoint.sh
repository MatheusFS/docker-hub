#!/bin/bash
chown -R fpm:www-data /var/www/html /home/fpm
chmod -R 775 /var/www/html /home/fpm
echo "Set permissions to /var/www/html and /home/fpm"