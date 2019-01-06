#!/usr/bin/env bash

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

NVM_SOURCE="export NVM_DIR=\"\$HOME/.nvm\"\n [ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"\n [ -s \"\$NVM_DIR/bash_completion\" ] && \. \"\$NVM_DIR/bash_completion\""
echo -e "$NVM_SOURCE" | tee -a "$HOME/.bashrc"
eval $NVM_SOURCE

nvm install 8 && nvm use 8
