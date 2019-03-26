#!/usr/bin/env bash

awk '{ sub("\r$", ""); print }' $STACK_HOME/config/aliases > $HOME/.bash_aliases
