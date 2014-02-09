#!/bin/sh

env | grep _PORT >> /etc/environment

/usr/bin/supervisord -n
