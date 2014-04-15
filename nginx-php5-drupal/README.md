Minimal-ish Drupal
==================

Inside this project, you can find a Dockerfile and related configs to build a Debian Wheezy install with nginx and php5-fpm configured to host a Drupal site, along with sshd, managed by supervisord.

The nginx and php configuration is from [perusio's repo](https://github.com/perusio/drupal-with-nginx).

## Requirements

Docker 0.8.x

## Build

```
docker build -t bnchdrff/nginx-php5-drupal .
```

## Run

Create a MariaDB container, and then create and link a drupal-docker container to it. Also, expose some ports:

```
docker run -d --name=mariadb bnchdrff/mariadb
docker run -d -p 80:80 -p 2222:22 --link mariadb:db --name=www bnchdrff/nginx-php5-drupal
```

## Why?

I like using omega8's configuration for drupal development and production, but I don't really like aegir and related bloat.

## Roadmap

I will continue to minimize the configuration, but I'd like to have little modules for certain systems (redis cache, xdebug, module-specific nginx stuff, uploadprogress, etc).

I'd like to remove my ssh key and include it via ssh-import-id, and make the import origin configurable. Still learning this docker biz...

## Credits

* @perusio - nginx config
* @bnchdrff
