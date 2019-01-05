#!/usr/bin/env bash

# Check if Elasticsearch has been installed

if [ -f "$HOME/.elasticsearch" ]
then
  echo "Elasticsearch already installed."
  exit 0
fi

touch "$HOME/.elasticsearch"

# Determine version from config

version=$1

# Install Java 8

sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get -y install oracle-java8-installer

# Install Elasticsearch

wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-"$version".deb
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-"$version".deb.sha512
shasum -a 512 -c elasticsearch-"$version".deb.sha512
sudo dpkg -i elasticsearch-"$version".deb

# Start Elasticsearch on boot

sudo update-rc.d elasticsearch defaults 95 10

# Update configuration to use 'homestead' as the cluster

sudo sed -i "s/#cluster.name: my-application/cluster.name: homestead/" /etc/elasticsearch/elasticsearch.yml

# Enable Start Elasticsearch

sudo systemctl enable elasticsearch.service
sudo service elasticsearch start
