#!/usr/bin/env bash

echo "Install phpbrew"
curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod +x phpbrew

sudo mv phpbrew /usr/local/bin/phpbrew

# Init phpbrew
phpbrew init
[[ -e "$HOME/.phpbrew/bashrc" ]] && source "$HOME/.phpbrew/bashrc"
echo "[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc" | tee -a "$HOME/.bashrc"

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
