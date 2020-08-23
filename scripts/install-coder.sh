#!/usr/bin/env bash
WORKSPACE_DIR="$HOME/code"

if [ ! -d "$WORKSPACE_DIR" ]
then
  mkdir $WORKSPACE_DIR
fi

$FILE="/etc/supervisor/conf.d/coder.conf"

if [ ! -f "$FILE" ]
then
  touch "$FILE"
fi

if grep -q "user=$USER" "$FILE"
then
  return
fi

curl -fsSL https://code-server.dev/install.sh | sh

block="
[program:coder]
command=/usr/bin/code-server --config $HOME/.config/code-server/config.yaml $HOME/code
user=$USER
autostart=true
autorestart=true
stdout_logfile=/var/log/supervisor/coder_$USER.log
stderr_logfile=/var/log/supervisor/coder_errors_$USER.log
"
echo "$block" | sudo tee "$FILE"

# Restart process
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start coder:*
