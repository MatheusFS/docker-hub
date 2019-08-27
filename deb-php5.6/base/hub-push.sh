docker build -t matheusfs/deb-php5.6:base .
docker login
docker push matheusfs/deb-php5.6:base
