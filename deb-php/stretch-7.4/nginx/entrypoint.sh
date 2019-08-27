#!/bin/bash
service php7.4-fpm restart
service nginx restart
echo ========= nginx: error.logs =========
tail -f /var/log/nginx/error.log