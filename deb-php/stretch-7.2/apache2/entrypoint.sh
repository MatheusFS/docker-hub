#!/bin/bash
service apache2 restart
echo ========= apache2: ErrorLog =========
tail -f /tmp/dev.log
