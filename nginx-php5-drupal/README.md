Minimal-ish Drupal
==================

Inside this project, you can find a Dockerfile and related configs to build a Debian Wheezy install with nginx and php5-fpm configured to host a Drupal site, along with sshd, managed by supervisord.

The container can use volumes from a data-only container to hold nginx config and Drupal site code.

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
docker run -v /var/lib/mysql --name=db-data busybox true
docker run -d --volumes-from=db-data --name=db bnchdrff/mariadb
docker run -v /srv/www -v /etc/nginx/sites-enabled --name www-data busybox true
docker run -d -p 80:80 -p 2222:22 --link=db:db --volumes-from=www-data --name=www bnchdrff/nginx-php5-drupal
```

## Use

The linked database address is available as environment variable `DB_PORT_3306_TCP_ADDR`.

Put code in /srv/www/drupal and an nginx config file in /etc/nginx/sites-enabled - these will be stored in a data-only container if you followed the above instructions.

A sample nginx config is available in /etc/nginx/sites-available/site.conf

## Why?

I like using omega8's configuration for drupal development and production, but I don't really like aegir and related bloat.

## Roadmap

I will continue to minimize the configuration, but I'd like to have little modules for certain systems (redis cache, xdebug, module-specific nginx stuff, uploadprogress, etc).

I'd like to remove my ssh key and include it via ssh-import-id, and make the import origin configurable. Still learning this docker biz...

## Credits

* @perusio - nginx config
* @bnchdrff
