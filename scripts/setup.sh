#!/usr/bin/env bash

# Install required package
sudo apt update
sudo apt install -y php7.0  php7.0-curl php7.0-json php7.0-cgi php7.0-fpm autoconf \
  automake gnupg2 libxml2-dev libcurl4-openssl-dev libssl-dev openssl gettext \
  libicu-dev libmcrypt-dev libmcrypt4 libbz2-dev libreadline-dev \
  build-essential libmhash-dev libmhash2 libxslt1-dev libpng-dev libpq-dev \
  apt-transport-https python-software-properties python make g++ curl \
  apache2-utils git supervisor

gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

\curl -sSL https://get.rvm.io | bash -s stable --rails
echo "source $HOME/.rvm/scripts/rvm" >> $HOME/.bash_profile
