#!/usr/bin/env bash

ACCESS_KEY=$1
SECRET_KEY=$2

if [ -f "$HOME/.minio" ]
then
  echo "Minio already installed."
  exit 0
fi

touch "$HOME/.minio"

curl -sO https://dl.minio.io/server/minio/release/linux-amd64/minio

sudo chmod +x minio
sudo mv minio /usr/local/bin
sudo useradd -r minio-user -s /sbin/nologin
sudo mkdir /usr/local/share/minio
sudo mkdir /etc/minio

block="
# Local export path.
MINIO_VOLUMES=\"/usr/local/share/minio/\"
# Use if you want to run Minio on a custom port.
MINIO_OPTS=\"--config-dir /etc/minio --address :9600\"
MINIO_ACCESS_KEY=$ACCESS_KEY
MINIO_SECRET_KEY=$SECRET_KEY
"
echo "$block" | sudo tee /etc/default/minio

sudo chown minio-user:minio-user /usr/local/share/minio
sudo chown minio-user:minio-user /etc/minio

curl -sO https://raw.githubusercontent.com/minio/minio-service/master/linux-systemd/minio.service
sudo mv minio.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable minio
sudo systemctl start minio

sudo ufw allow 9600

# Installing Minio Client
curl -sO https://dl.minio.io/client/mc/release/linux-amd64/mc
chmod +x mc
sudo mv mc /usr/local/bin
mc config host add minio http://127.0.1.1:9600 $ACCESS_KEY $SECRET_KEY
