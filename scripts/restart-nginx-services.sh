#!/usr/bin/env bash

# Restart services
sudo service nginx restart

# Init phpbrew
phpbrew init
[[ -e "$HOME/.phpbrew/bashrc" ]] && source "$HOME/.phpbrew/bashrc"

for phpver in "$@"
do
    phpbrew use $phpver && phpbrew fpm restart
done
