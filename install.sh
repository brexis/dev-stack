#!/usr/bin/env bash
STACK_HOME="$HOME/.stack"

if [ -d "$STACK_HOME" ]
then
  rm -rf "$STACK_HOME"
fi

git clone https://github.com/brexis/dev-stack.git $STACK_HOME

# Installing dependencies
echo "Installing dependencies"

sudo apt update
sudo apt install -y php php-curl php-json php-cgi php-bz2 php-fpm autoconf \
  automake gnupg2 libxml2-dev libcurl4-openssl-dev libssl-dev openssl gettext \
  libicu-dev libmcrypt-dev libmcrypt4 libbz2-dev libreadline-dev \
  build-essential libmhash-dev libmhash2 libxslt1-dev libpng-dev libpq-dev \
  libcairo2-dev libjpeg-dev libgif-dev libxpm-dev python python-pip python-dev \
  software-properties-common apt-transport-https make g++ curl \
  apache2-utils git supervisor redis-server unzip default-jre default-jdk libzip-dev \
  libonig-dev

# Install Rvm
bash "$STACK_HOME/scripts/install-ruby.sh"

cd $STACK_HOME
gem install bundler
bundle install

# Creating settings file
echo "Creating settings file"
cp $STACK_HOME/config/settings.yml.sample $STACK_HOME/config/settings.yml

echo "========================"
echo "=       DEV STACK      ="
echo "========================"
echo "      Enjoy!"
echo "=  Edit config file in $STACK_HOME/config/settings.yml"
echo "=  Add this to .bashrc"
echo "=  export STACK_HOME=\$HOME/.stack"
echo "=  export PATH=\$STACK_HOME/bin:\$PATH"
