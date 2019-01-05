#!/usr/bin/env bash

USERNAME=$1
PASSWORD=$2

sudo apt update
sudo apt install -y postgresql postgresql-contrib

sudo -u postgres psql -c "CREATE USER $USERNAME WITH ENCRYPTED PASSWORD '$PASSWORD';"
