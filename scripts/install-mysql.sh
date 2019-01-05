#!/usr/bin/env bash

USERNAME=$2
PASSWORD=$3
HOME_DIR=$1
STACK_DIR="$1/.stack"
ROOT_PASSWORD_PATH="$STACK_DIR/MYSQL_ROOT_PASSWORD"
ROOT_PASSWORD=$(openssl rand -hex 8)

if [-z $STACK_DIR] then
  mkdir -p $STACK_DIR
fi

echo "Create default MySql user password"

touch $ROOT_PASSWORD_PATH
echo "$MYSQL_ROOT_PASSWORD" | tee "$ROOT_PASSWORD_PATH"

echo "Install MySql server"

sudo apt update
sudo apt install mysql-server mysql-client libmysqlclient-dev libmysqld-dev

# Set The Automated Root Password

debconf-set-selections <<< "mysql-server mysql-server/data-dir select ''"
debconf-set-selections <<< "mysql-server mysql-server/root_password password $ROOT_PASSWORD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $ROOT_PASSWORD"

service mysql restart

mysql --user="root" --password="$ROOT_PASSWORD" -e "CREATE USER '$USERNAME'@'localhost' IDENTIFIED BY '$PASSWORD';"
mysql --user="root" --password="$ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON *.* TO '$USERNAME'@'localhost' WITH GRANT OPTION;"
mysql --user="root" --password="$ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
service mysql restart
