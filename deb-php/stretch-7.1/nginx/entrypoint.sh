#!/bin/bash
service php7.1-fpm start
service nginx restart
echo ========= nginx: error.logs =========
tail -f /var/log/nginx/error.log