#!/bin/bash
docker build -t matheusfs/fpm fpm/ && \
    docker push matheusfs/fpm

docker build -t matheusfs/mysql mysql/ && \
    docker push matheusfs/mysql

docker build -t matheusfs/prometheus prometheus/ && \
    docker push matheusfs/prometheus

docker build -t matheusfs/scraper-mysql scraper-mysql/ && \
    docker push matheusfs/scraper-mysql
