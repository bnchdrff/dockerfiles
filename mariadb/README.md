MariaDB with data container storage on debian:wheezy
====================================================

This Dockerfile builds a wheezy container that runs MariaDB.

You can supply a mysql data dir and use it thusly:

```
docker run -v /var/lib/mysql --name db-data busybox true
docker run -d --volumes-from=bb-db-data -name db bnchdrff/mariadb
```

If /var/lib/mysql is empty, it will populate it and add a password-less root user.

