#!/usr/bin/env bash

DB=$1;
USERNAME=$2
PASSWORD=$3

mysql --user="$USERNAME" --password="$PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`$DB\` DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci";
