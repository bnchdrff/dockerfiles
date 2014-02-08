Minimal-ish Drupal
==================

Inside this project, you can find a Dockerfile and related configs to build a Debian Wheezy install with nginx and php5-fpm configured to host a Drupal site, along with sshd, managed by supervisord.

The script `www-and-db.sh` runs this container (after you build it with `docker build -t thermitic/drupal-docker .`) and then creates and links a MariaDB container. An example of how to use this linked database server in a Drupal deployment is `gnl.sh`.

The nginx and php configuration is yanked from [Omega8's Drupal Aegir hosting systems](https://github.com/omega8cc/nginx-for-drupal), but with the aegir bits and some other stuff left out.

## Why?

I like using omega8's configuration for drupal development and production, but I don't really like aegir and related bloat.

## Roadmap

I will continue to minimize the configuration, but I'd like to have little modules for certain systems (redis cache, xdebug, module-specific nginx stuff, uploadprogress, etc).

I'd like to remove my ssh key and include it via ssh-import-id, and make the import origin configurable. Still learning this docker biz...

## Credits

* @omega8cc - php5-fpm and nginx config patterns
* @bnchdrff
