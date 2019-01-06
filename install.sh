#!/usr/bin/env bash
STACK_HOME="$HOME/.stack"
git clone https://github.com/brexis/dev-stack.git $STACK_HOME

/bin/bash "$STACK_HOME/scripts/install-dependencies.sh"
/bin/bash "$STACK_HOME/scripts/install-ruby.sh"

echo "Add this to .bashrc"
echo "export STACK_HOME=$HOME/.stack"
echo "export PATH=$STACK_HOME/bin:$PATH"
