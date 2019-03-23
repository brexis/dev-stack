#!/usr/bin/env bash

sudo docker pull drone/drone:1.0.0-rc.1
sudo docker pull drone/agent:1.0.0-rc.1
sudo mkdir /etc/drone
sudo touch /etc/drone/server.env
sudo touch /etc/drone/agent.env

docker="
version: '3'

services:
  drone-server:
    image: drone/drone:0.7
    ports:
      - 127.0.0.1:80:9000
    volumes:
      - /var/lib/drone:/var/lib/drone
    restart: always
    env_file:
      - /etc/drone/server.env

  drone-agent:
    image: drone/drone:0.7
    command: agent
    depends_on:
      - drone-server
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    restart: always
    env_file:
      - /etc/drone/agent.env
"

echo "$docker" | sudo tee /etc/drone/docker-compose.yml

service="
[Unit]
Description=Drone server
After=docker.service nginx.service

[Service]
Restart=always
ExecStart=/usr/local/bin/docker-compose -f /etc/drone/docker-compose.yml up
ExecStop=/usr/local/bin/docker-compose -f /etc/drone/docker-compose.yml stop

[Install]
WantedBy=multi-user.target
"

echo "$service" | sudo tee /etc/systemd/system/drone.service

sudo systemctl stop drone
sudo systemctl start drone
