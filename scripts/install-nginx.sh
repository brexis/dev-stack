USER=$(whoami)

[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

sudo apt install -y nginx
sudo rm /etc/nginx/sites-enabled/default
sudo rm /etc/nginx/sites-available/default

sudo sed -i "s/user www-data;/user $USER;/" /etc/nginx/nginx.conf

# Configure PHP 7.2.13 fpm
if [ -e $HOME/.phpbrew/php/php-7.2.13/etc/php-fpm.d/www.conf ]
then
  sed -i "s/user = nobody/user = $USER/" $HOME/.phpbrew/php/php-7.2.13/etc/php-fpm.d/www.conf
  sed -i "s/group = nobody/group = $USER/" $HOME/.phpbrew/php/php-7.2.13/etc/php-fpm.d/www.conf

  sed -i "s/;listen\.owner.*/listen.owner = $USER/" $HOME/.phpbrew/php/php-7.2.13/etc/php-fpm.d/www.conf
  sed -i "s/;listen\.group.*/listen.group = $USER/" $HOME/.phpbrew/php/php-7.2.13/etc/php-fpm.d/www.conf
  sed -i "s/;listen\.mode.*/listen.mode = 0666/" $HOME/.phpbrew/php/php-7.2.13/etc/php-fpm.d/www.conf

  phpbrew use 7.2.13
  phpbrew fpm stop
  phpbrew fpm start
fi

# Configure PHP 7.1.25 fpm
if [ -e $HOME/.phpbrew/php/php-7.1.25/etc/php-fpm.d/www.conf ]
then
  sed -i "s/user = nobody/user = $USER/" $HOME/.phpbrew/php/php-7.1.25/etc/php-fpm.d/www.conf
  sed -i "s/group = nobody/group = $USER/" $HOME/.phpbrew/php/php-7.1.25/etc/php-fpm.d/www.conf

  sed -i "s/;listen\.owner.*/listen.owner = $USER/" $HOME/.phpbrew/php/php-7.1.25/etc/php-fpm.d/www.conf
  sed -i "s/;listen\.group.*/listen.group = $USER/" $HOME/.phpbrew/php/php-7.1.25/etc/php-fpm.d/www.conf
  sed -i "s/;listen\.mode.*/listen.mode = 0666/" $HOME/.phpbrew/php/php-7.1.25/etc/php-fpm.d/www.conf

  phpbrew use 7.1.25
  phpbrew fpm stop
  phpbrew fpm start
fi

# Configure PHP 5.6.39 fpm
if [ -e $HOME/.phpbrew/php/php-5.6.39/etc/php-fpm.d/www.conf ]
then
  sed -i "s/user = nobody/user = $USER/" $HOME/.phpbrew/php/php-5.6.39/etc/php-fpm.d/www.conf
  sed -i "s/group = nobody/group = $USER/" $HOME/.phpbrew/php/php-5.6.39/etc/php-fpm.d/www.conf

  sed -i "s/;listen\.owner.*/listen.owner = $USER/" $HOME/.phpbrew/php/php-5.6.39/etc/php-fpm.d/www.conf
  sed -i "s/;listen\.group.*/listen.group = $USER/" $HOME/.phpbrew/php/php-5.6.39/etc/php-fpm.d/www.conf
  sed -i "s/;listen\.mode.*/listen.mode = 0666/" $HOME/.phpbrew/php/php-5.6.39/etc/php-fpm.d/www.conf

  phpbrew use 5.6.39
  phpbrew fpm stop
  phpbrew fpm start
fi

sudo service nginx restart

# Add User To WWW-Data
sudo usermod -a -G www-data $USER
id $USER
groups $USER
