#!/usr/bin/env bash

USERNAME=$1
PASSWORD=$2

sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib

sudo -u postgres psql -c "CREATE USER $USERNAME WITH ENCRYPTED PASSWORD '$PASSWORD';"
