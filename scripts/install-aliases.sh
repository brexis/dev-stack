#!/usr/bin/env bash

STACK_HOME="$HOME/.stack"

awk '{ sub("\r$", ""); print }' $STACK_HOME/config/aliases > $HOME/.bash_aliases
