#!/usr/bin/env bash

sudo docker pull drone/drone:1
sudo docker pull drone/drone-runner-docker:1
sudo mkdir -p /etc/drone
sudo touch /etc/drone/server.env
sudo touch /etc/drone/runner.env

docker="
version: '3'

services:
  drone-server:
    image: drone/drone:1
    ports:
      - 9000:80
      - 443:443
    volumes:
      - /var/lib/drone:/data
    restart: always
    env_file:
      - /etc/drone/server.env

  drone-runner:
    image: drone/drone-runner-docker:1
    ports:
      - 3000:3000
    restart: always
    depends_on:
      - drone-server
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    restart: always
    env_file:
      - /etc/drone/runner.env
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
