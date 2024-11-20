#!/bin/bash

## The first argument of this script is the User and the second is its password

apt-get update -qq >/dev/null
apt-get install -qq -y postgresql >/dev/null
apt-get install postgresql-client -qq -y >/dev/null
sudo -u postgres bash -c "psql -c \"CREATE USER $1 WITH PASSWORD $2;\""
## Use this line to enable other machines to connect to PostgreSQL server
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/*/main/postgresql.conf
service postgresql restart