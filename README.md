# Docker repositories ([Docker Hub](https://hub.docker.com/u/matheusfs))
Development images for community use.
Debian + PHP in different versions combinations.
Also supports choices between Apache2 and Nginx.

## deb-php ([Docker Hub](https://hub.docker.com/r/matheusfs/deb-php))
### Directory Structure
```bash
/$DEBIAN_VERSION-$PHP_VERSION/$WEB_SERVER
```
### Getting image for use
```bash
docker pull matheusfs/deb-php:tagname
```
or
```docker
FROM matheusfs/deb-php:tagname
```

### Configuration
**apache2** root folder is `/var/www/html`
**nginx** root folder is `/var/www/app`


### Available tags
#### stretch-5.6
- stretch-5.6-base
- stretch-5.6-apache2
- stretch-5.6-nginx
#### stretch-7.4
- stretch-7.4-base
- stretch-7.4-apache2
- stretch-7.4-nginx
