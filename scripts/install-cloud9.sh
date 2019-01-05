#!/usr/bin/env bash
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
