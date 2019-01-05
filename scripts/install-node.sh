#!/usr/bin/env bash

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

if [ -e "$HOME/.zshrc" ]; then
  SOURCE_FILE="$HOME/.zshrc"
else
  SOURCE_FILE="$HOME/.bashrc"
fi

NVM_EXPORT="export NVM_DIR=\"\$HOME/.nvm\"\n [ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"\n [ -s \"\$NVM_DIR/bash_completion\" ] && \. \"\$NVM_DIR/bash_completion\""
echo -e "$NVM_EXPORT" | tee -a "$SOURCE_FILE"
eval $NVM_EXPORT

#nvm install 8
