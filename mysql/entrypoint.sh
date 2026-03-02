#!/bin/bash
set -e

# Apply schema once the final mysqld is ready on TCP port 3306.
# Using -h 127.0.0.1 ensures we never accidentally connect to the
# temporary Unix-socket-only server that the official entrypoint uses
# during first-init (which has an empty root password).
apply_schema() {
    for i in {1..60}; do
        if mysqladmin ping -h 127.0.0.1 --silent -uroot -p"${MYSQL_ROOT_PASSWORD:-root}" 2>/dev/null; then
            echo "[custom-entrypoint] Applying schema..."
            mysql -h 127.0.0.1 -uroot -p"${MYSQL_ROOT_PASSWORD:-root}" < /docker-entrypoint-initdb.d/schema.sql 2>/dev/null \
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
