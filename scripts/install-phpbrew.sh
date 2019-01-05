#!/usr/bin/env bash

echo "Install phpbrew"
curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod +x phpbrew

sudo mv phpbrew /usr/local/bin/phpbrew

if [ -e "$HOME/.zshrc" ]; then
  SOURCE_FILE="$HOME/.zshrc"
else
  SOURCE_FILE="$HOME/.bashrc"
fi

echo "[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc" | tee -a $SOURCE_FILE

echo "Install Php 7.2 7.1 7.0 5.6"
