#!/bin/bash
service php7.2-fpm start
service nginx restart
echo ========= nginx: error.logs =========
tail -f /var/log/nginx/error.log