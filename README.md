# Docker repositories ([Docker Hub](https://hub.docker.com/u/matheusfs))
Development images for community use.
<img src="https://raw.githubusercontent.com/MatheusFS/brands-library/master/png/debian.png" title="Debian" width="18"> + 
<img src="https://raw.githubusercontent.com/MatheusFS/brands-library/master/png/php.png" title="PHP" width="25"> in different versions combinations.

Also supports choices between <img src="https://raw.githubusercontent.com/MatheusFS/brands-library/master/png/apache.png" title="Apache 2" width="20"> and <img src="https://raw.githubusercontent.com/MatheusFS/brands-library/master/png/nginx.png" title="Nginx" width="15">.

* Suports Laravel 6.x

## deb-php ([Docker Hub](https://hub.docker.com/r/matheusfs/deb-php))
### Directory Structure
```sh
/$DEBIAN_VERSION-$PHP_VERSION/$WEB_SERVER
```
### Getting image for use
```sh
docker pull matheusfs/deb-php:tagname
```
or
```docker
FROM matheusfs/deb-php:tagname
```

### Configuration
**apache2** & **nginx** root folder is `/var/www/html`


### Available tags
#### stretch-5.6
- stretch-5.6-base
- stretch-5.6-apache2
- stretch-5.6-nginx
#### stretch-7.1
- stretch-7.1-base
- stretch-7.1-apache2
- stretch-7.1-nginx
#### stretch-7.2
- stretch-7.2-base
- stretch-7.2-apache2
- stretch-7.2-nginx
#### stretch-7.3
- stretch-7.3-base
- stretch-7.3-apache2
- stretch-7.3-nginx
#### stretch-7.4
- stretch-7.4-base
- stretch-7.4-apache2
- stretch-7.4-nginx
