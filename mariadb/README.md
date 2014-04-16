MariaDB with data container storage on debian:wheezy
====================================================

This Dockerfile builds a wheezy container that runs MariaDB.

You can create a data volume (`docker run -v /var/lib/mysql --name=db-data busybox true`) and then use that volume in this container (`docker run -d --volumes-from=db-data -name db bnchdrff/mariadb`).

If /var/lib/mysql is empty, it will populate it and add a password-less root user.

