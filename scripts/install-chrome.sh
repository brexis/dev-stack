#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y libappindicator1 fonts-liberation
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -f install
sudo dpkg --configure -a
rm google-chrome-stable_current_amd64.deb

wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg -i chrome-remote-desktop_current_amd64.deb
sudo apt-get -f install
sudo dpkg --configure -a
rm chrome-remote-desktop_current_amd64.deb
