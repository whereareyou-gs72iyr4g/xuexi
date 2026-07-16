#!/bin/bash

echo "Initializing MySQL..."

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';" || true

mysql -uroot -proot <<SQL

CREATE DATABASE IF NOT EXISTS dev;

CREATE USER IF NOT EXISTS 'dev'@'%' IDENTIFIED BY 'dev';

GRANT ALL PRIVILEGES ON dev.* TO 'dev'@'%';

FLUSH PRIVILEGES;

SQL

echo "MySQL initialized."

