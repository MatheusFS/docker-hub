#!/bin/bash

build_and_push() {
    local name=$1
    local path=$2

    echo "Building and pushing $name..."
    docker build -t matheusfs/$name $path && docker push matheusfs/$name
}

if [[ -z "$1" || "$1" == "all" ]]; then
    build_and_push "fpm" "fpm/"
    build_and_push "mysql" "mysql/"
    build_and_push "prometheus" "prometheus/"
    build_and_push "scraper-mysql" "scraper-mysql/"
else
    case "$1" in
        fpm|mysql|prometheus|scraper-mysql)
            build_and_push "$1" "$1/"
            ;;
        *)
            echo "Uso: $0 [all|fpm|mysql|prometheus|scraper-mysql]"
            exit 1
            ;;
    esac
fi