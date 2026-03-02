#!/bin/bash
set -e

chown -R fpm:www-data /var/www/html /home/fpm
chmod -R 775 /var/www/html /home/fpm
echo "Set permissions to /var/www/html and /home/fpm"

# Wait for database to accept connections before PHP-FPM starts
DB_HOST="${DB_HOST:-database}"
DB_PORT="${DB_PORT:-3306}"
MAX_RETRIES=30
RETRY=0

echo "Waiting for database at ${DB_HOST}:${DB_PORT}..."
while ! nc -z "$DB_HOST" "$DB_PORT" 2>/dev/null; do
    RETRY=$((RETRY + 1))
    if [ "$RETRY" -ge "$MAX_RETRIES" ]; then
        echo "WARNING: Database not reachable after ${MAX_RETRIES} attempts, starting anyway"
        break
    fi
    sleep 2
done

if [ "$RETRY" -lt "$MAX_RETRIES" ]; then
    echo "Database is up"
fi

# Executa o comando passado ao container
# exec "$@"