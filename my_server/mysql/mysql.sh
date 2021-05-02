#!/bin/sh

mysql_install_db --user=mysql --datadir=/var/lib/mysql
mysqld & sleep 5

mysql < /wordpress.sql
supervisord