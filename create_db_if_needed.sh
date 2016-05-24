#!/bin/bash

until mysql -hlv-db -P3306 -uroot -pbanana &> /dev/null
do
  echo "Waiting for mysql..."
  sleep 5
done
echo "\nConnected to mysql"


if [ ! -f /var/lib/mysql/lecture_viewer ]; then
    mysql -uroot -p$MYSQL_ROOT_PASSWORD < /usr/local/db-create.sql
    mysql -uroot -p$MYSQL_ROOT_PASSWORD lecture_viewer < /usr/local/db-structure.sql
fi
