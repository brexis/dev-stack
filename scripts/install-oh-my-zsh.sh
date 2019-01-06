#!/usr/bin/env bash

echo "Install Oh My Zsh"
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Add nvm to .zshrc
echo -e "export NVM_DIR=\"\$HOME/.nvm\"\n [ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"\n [ -s \"\$NVM_DIR/bash_completion\" ] && \. \"\$NVM_DIR/bash_completion\"" | tee -a "$HOME/.zshrc"
# Add phpbrew to .zshrc
echo "[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc" | tee -a "$HOME/.zshrc"
# Add rvm to .zshrc
