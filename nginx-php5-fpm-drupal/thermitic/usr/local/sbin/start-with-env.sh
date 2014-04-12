#!/bin/sh

env | grep _PORT >> /etc/environment

if [ ! -d "/srv/www/drupal" ]; then
  /usr/local/bin/build-gnl.sh
fi

/usr/bin/supervisord -n
