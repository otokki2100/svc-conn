#!/bin/bash

curl -fsSL https://get.docker.com/ | sudo sh

sudo systemctl enable --now docker

sudo docker version

sudo curl -SL https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-linux-x86_64 -o /usr/bin/docker-compose

sudo chmod +x /usr/bin/docker-compose

docker-compose version

sudo mkdir /tmp/data/

cat << EOF | sudo tee /tmp/docker-compose.yml
version: '3.8'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
      - '2222:2222'
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
EOF

cd /tmp/

sudo docker-compose up -d
