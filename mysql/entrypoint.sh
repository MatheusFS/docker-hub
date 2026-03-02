#!/bin/bash
set -e

# Apply schema on every startup (not just first init).
# Runs in background so it doesn't block mysqld from starting.
apply_schema() {
    for i in {1..30}; do
        if mysqladmin ping --silent -uroot -p"${MYSQL_ROOT_PASSWORD:-root}" 2>/dev/null; then
            echo "[custom-entrypoint] Applying schema..."
            mysql -uroot -p"${MYSQL_ROOT_PASSWORD:-root}" < /docker-entrypoint-initdb.d/schema.sql 2>/dev/null \
                && echo "[custom-entrypoint] Schema applied." \
                || echo "[custom-entrypoint] Schema already up to date."
            return
        fi
        sleep 1
    done
    echo "[custom-entrypoint] WARNING: MySQL did not become ready, schema not applied."
}

apply_schema &

# Delegate to the official MySQL entrypoint
exec docker-entrypoint.sh "$@"
