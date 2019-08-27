#!/bin/bash
update-alternatives --set php /usr/bin/php5.6
service apache2 restart
tail -f /tmp/dev.log