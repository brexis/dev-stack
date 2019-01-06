
#!/usr/bin/env bash

# Init phpbrew
phpbrew init
[[ -e "$HOME/.phpbrew/bashrc" ]] && source "$HOME/.phpbrew/bashrc"

if [ -d "$HOME/.phpbrew/php/php-$1" ]
then
  echo "Php $1 already install"
  exit 0
fi

echo "Installing Php $1"
phpbrew install $1 +default +dbs +fpm +gd
phpbrew use $1

echo "Configure PHP $1 fpm"
sed -i "s/user = nobody/user = $USER/" $HOME/.phpbrew/php/php-$1/etc/php-fpm.d/www.conf
sed -i "s/group = nobody/group = $USER/" $HOME/.phpbrew/php/php-$1/etc/php-fpm.d/www.conf

sed -i "s/;listen\.owner.*/listen.owner = $USER/" $HOME/.phpbrew/php/php-$1/etc/php-fpm.d/www.conf
sed -i "s/;listen\.group.*/listen.group = $USER/" $HOME/.phpbrew/php/php-$1/etc/php-fpm.d/www.conf
sed -i "s/;listen\.mode.*/listen.mode = 0666/" $HOME/.phpbrew/php/php-$1/etc/php-fpm.d/www.conf

phpbrew fpm stop
phpbrew fpm start
