#!/usr/bin/env bash

DB=$1;
USERNAME=$2

sudo -u postgres psql -c "CREATE DATABASE $DB;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $DB TO $USERNAME;"
