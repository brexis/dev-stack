#!/usr/bin/env bash

# INstall Mate
sudo apt-get update && sudo apt-get dist-upgrade -y
sudo apt-get install --no-install-recommends ubuntu-mate-core ubuntu-mate-desktop -y
sudo apt-get install mate-core mate-desktop-environment mate-notification-daemon -y

echo mate-session> $HOME/.xsession
sudo cp $HOME/.xsession /etc/skel

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
