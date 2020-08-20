#!/usr/bin/env bash

USER=$(whoami)

phpbrew init
[[ -e "$HOME/.phpbrew/bashrc" ]] && source "$HOME/.phpbrew/bashrc"

sudo apt-get install -y nginx
sudo rm /etc/nginx/sites-enabled/default
sudo rm /etc/nginx/sites-available/default

sudo sed -i "s/user www-data;/user $USER;/" /etc/nginx/nginx.conf

sudo service nginx restart

# Add User To WWW-Data
sudo usermod -a -G www-data $USER
id $USER
groups $USER
