#!/usr/bin/env bash

echo "Install Oh My Zsh"
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "if [ -f ~/.bash_aliases ]; then\n  . ~/.bash_aliases\nfi" | tee -a "$HOME/.zshrc"
