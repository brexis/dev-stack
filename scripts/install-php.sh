#!/usr/bin/env bash

echo "Install phpbrew"
curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod +x phpbrew

sudo mv phpbrew /usr/local/bin/phpbrew

phpbrew init

echo "[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc" | tee -a "$HOME/.bashrc"
source $HOME/.bashrc

echo "Install Php 7.2 7.1 7.0 5.6"
phpbrew install 7.2.13 +default +dbs +fpm +gd
phpbrew install 7.1.25 +default +dbs +fpm +gd
phpbrew install 5.6.39 +default +dbs +fpm +gd
phpbrew app get composer
phpbrew app get phpunit
phpbrew switch 7.2.13
