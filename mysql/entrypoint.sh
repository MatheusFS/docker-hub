#!/bin/bash
set -e

# Delegate to the official MySQL entrypoint
# The official entrypoint will run /docker-entrypoint-initdb.d/schema.sql automatically
# during initialization if the database is empty
exec docker-entrypoint.sh "$@"
