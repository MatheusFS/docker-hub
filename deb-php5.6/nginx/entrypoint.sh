#!/bin/bash

service php5-fpm start
service nginx start

echo ========= nginx: error.logs =========
tail -f /var/log/nginx/error.log