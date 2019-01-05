#!/usr/bin/env bash

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

echo -e "export NVM_DIR=\"\$HOME/.nvm\"\n [ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"\n [ -s \"\$NVM_DIR/bash_completion\" ] && \. \"\$NVM_DIR/bash_completion\"" | tee -a "$HOME/.zshrc"
/bin/zsh -i -c  "nvm install 8 && nvm use 8"
