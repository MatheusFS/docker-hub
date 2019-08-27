#!/bin/bash
service php5.6-fpm restart
service nginx restart
echo ========= nginx: error.logs =========
tail -f /var/log/nginx/error.log