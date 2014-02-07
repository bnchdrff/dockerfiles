#!/bin/bash
# bulid ours
#sudo docker build -t thermitic/drupal-docker .

# start em
sudo docker run -d -name mariadb tianon/mariadb
sudo docker run -d -p 80:80 -p 2222:22 -link mariadb:db -name www thermitic/drupal-docker
