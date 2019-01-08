#!/usr/bin/env bash
USERNAME=$1
PASSWORD=$2
INSTALL_DIR="$HOME/ide"
WORKSPACE_DIR="$HOME/code"

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

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
cd $HOME
curl -L https://raw.githubusercontent.com/c9/install/master/install.sh | bash

# Add supervisor task
NODE_VERSION=$(nvm version default)

block="
[program:cloud9]
command=$HOME/.nvm/versions/node/$NODE_VERSION/bin/node $INSTALL_DIR/server.js --listen 0.0.0.0 --port 8080 -w $WORKSPACE_DIR -a $USERNAME:$PASSWORD
user=root
autostart=true
autorestart=true
stdout_logfile=/var/log/supervisor/cloud9.log
stderr_logfile=/var/log/supervisor/cloud9_errors.log
environment=NODE_ENV=\"production\",HOME=\"$HOME\"
"
echo "$block" | sudo tee /etc/supervisor/conf.d/cloud9.conf

# Install ide language.codeintel
sudo pip install -U virtualenv
virtualenv --python=python2 $HOME/.c9/python2
source $HOME/.c9/python2/bin/activate

mkdir /tmp/codeintel
pip download -d /tmp/codeintel codeintel==0.9.3

cd /tmp/codeintel
tar xf CodeIntel-0.9.3.tar.gz
mv CodeIntel-0.9.3/SilverCity CodeIntel-0.9.3/silvercity
tar czf CodeIntel-0.9.3.tar.gz CodeIntel-0.9.3
pip install -U --no-index --find-links=/tmp/codeintel codeintel

# Restart process
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start cloud9:*
