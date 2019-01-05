#!/usr/bin/env bash

# Install required package
sudo apt update
sudo apt install -y php7.0  php7.0-curl php7.0-json php7.0-cgi php7.0-fpm autoconf \
  automake gnupg2 libxml2-dev libcurl4-openssl-dev libssl-dev openssl gettext \
  libicu-dev libmcrypt-dev libmcrypt4 libbz2-dev libreadline-dev \
  build-essential libmhash-dev libmhash2 libxslt1-dev libpng-dev libpq-dev \
  nginx
