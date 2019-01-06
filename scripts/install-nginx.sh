USER=$(whoami)

sudo apt install -y nginx
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default

sed -i "s/user www-data;/user $USER;/" /etc/nginx/nginx.conf

# Configure PHP 7.2.13 fpm
if [ -e $HOME/.phpbrew/php/php-7.2.13/etc/php-fpm.d/www.conf ]
then
  sed -i "s/user = nobody/user = $USER/" $HOME/.phpbrew/php/php-7.2.13/etc/php-fpm.d/www.conf
  sed -i "s/group = nobody/group = $USER/" $HOME/.phpbrew/php/php-7.2.13/etc/php-fpm.d/www.conf

  sed -i "s/;listen\.owner.*/listen.owner = $USER/" $HOME/.phpbrew/php/php-7.2.13/etc/php-fpm.d/www.conf
  sed -i "s/;listen\.group.*/listen.group = $USER/" $HOME/.phpbrew/php/php-7.2.13/etc/php-fpm.d/www.conf
  sed -i "s/;listen\.mode.*/listen.mode = 0666/" $HOME/.phpbrew/php/php-7.2.13/etc/php-fpm.d/www.conf

  /bin/zsh -i -c "phpbrew use 7.2.13"
  /bin/zsh -i -c "phpbrew fpm stop"
  /bin/zsh -i -c "phpbrew fpm start"
fi

# Configure PHP 7.1.25 fpm
if [ -e $HOME/.phpbrew/php/php-7.1.25/etc/php-fpm.d/www.conf ]
then
  sed -i "s/user = nobody/user = $USER/" $HOME/.phpbrew/php/php-7.1.25/etc/php-fpm.d/www.conf
  sed -i "s/group = nobody/group = $USER/" $HOME/.phpbrew/php/php-7.1.25/etc/php-fpm.d/www.conf

  sed -i "s/;listen\.owner.*/listen.owner = $USER/" $HOME/.phpbrew/php/php-7.1.25/etc/php-fpm.d/www.conf
  sed -i "s/;listen\.group.*/listen.group = $USER/" $HOME/.phpbrew/php/php-7.1.25/etc/php-fpm.d/www.conf
  sed -i "s/;listen\.mode.*/listen.mode = 0666/" $HOME/.phpbrew/php/php-7.1.25/etc/php-fpm.d/www.conf

  /bin/zsh -i -c "phpbrew use 7.1.25"
  /bin/zsh -i -c "phpbrew fpm stop"
  /bin/zsh -i -c "phpbrew fpm start"
fi

# Configure PHP 5.6.39 fpm
if [ -e $HOME/.phpbrew/php/php-5.6.39/etc/php-fpm.d/www.conf ]
then
  sed -i "s/user = nobody/user = $USER/" $HOME/.phpbrew/php/php-5.6.39/etc/php-fpm.d/www.conf
  sed -i "s/group = nobody/group = $USER/" $HOME/.phpbrew/php/php-5.6.39/etc/php-fpm.d/www.conf

  sed -i "s/;listen\.owner.*/listen.owner = $USER/" $HOME/.phpbrew/php/php-5.6.39/etc/php-fpm.d/www.conf
  sed -i "s/;listen\.group.*/listen.group = $USER/" $HOME/.phpbrew/php/php-5.6.39/etc/php-fpm.d/www.conf
  sed -i "s/;listen\.mode.*/listen.mode = 0666/" $HOME/.phpbrew/php/php-5.6.39/etc/php-fpm.d/www.conf

  /bin/zsh -i -c "phpbrew use 5.6.39"
  /bin/zsh -i -c "phpbrew fpm stop"
  /bin/zsh -i -c "phpbrew fpm start"
fi

service nginx restart

# Add User To WWW-Data
usermod -a -G www-data $USER
id $USER
groups $USER
