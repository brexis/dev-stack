#!/usr/bin/env bash
HOST=$1
USERNAME=$2
PASSWORD=$3
INSTALL_DIR="$HOME/ide"
WORKSPACE_DIR="$HOME/code"

if [ ! -d "$WORKSPACE_DIR" ]
then
  mkdir $WORKSPACE_DIR
fi

if [ -d "$INSTALL_DIR" ]
then
  echo "Cloud9 folder already exists."
  exit 0
fi

git clone https://github.com/c9/core.git $INSTALL_DIR
cd $INSTALL_DIR
/bin/bash scripts/install-sdk.sh

# Add hode to /etc/hosts
grep -q -x -F "127.0.0.1 $HOST" /etc/hosts || echo "127.0.0.1 $HOST" | sudo tee -a /etc/hosts

# Add supervisor task
NODE_VERSION=$(/bin/zsh -i -c "nvm version default")

block="
[program:cloud9]
command=$HOME/.nvm/versions/node/$NODE_VERSION/bin/node $INSTALL_DIR/server.js --listen $HOST --port 80 -w $WORKSPACE_DIR -a $USERNAME:$PASSWORD
user=root
autostart=true
autorestart=true
stdout_logfile=/var/log/supervisor/cloud9.log
stderr_logfile=/var/log/supervisor/cloud9_errors.log
environment=NODE_ENV=\"production\",HOME="$WORKSPACE_DIR"
"
echo "$block" | sudo tee /etc/supervisor/conf.d/cloud9.conf

sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start cloud9:*
