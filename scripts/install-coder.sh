#!/usr/bin/env bash
USERNAME=$1
PASSWORD=$2
WORKSPACE_DIR="$HOME/code"
VERSION="1.939-vsc1.33.1"

if [ ! -d "$WORKSPACE_DIR" ]
then
  mkdir $WORKSPACE_DIR
fi

cd $HOME

wget https://github.com/codercom/code-server/releases/download/$VERSION/code-server$VERSION-linux-x64.tar.gz
tar -xvzf code-server$VERSION-linux-x64.tar.gz
cd code-server$VERSION-linux-x64
sudo chmod +x code-server
sudo mv code-server /usr/local/bin/
cd $HOME
rm code-server$VERSION-linux-x64.tar.gz
rm -R code-server$VERSION-linux-x64

block="
[program:coder]
command=/usr/local/bin/code-server $HOME/code --port 8081 --password $PASSWORD
user=root
autostart=true
autorestart=true
stdout_logfile=/var/log/supervisor/coder.log
stderr_logfile=/var/log/supervisor/coder_errors.log
"
echo "$block" | sudo tee /etc/supervisor/conf.d/coder.conf

# Restart process
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start coder:*
