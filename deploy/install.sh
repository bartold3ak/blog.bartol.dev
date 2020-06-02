#!/usr/bin/env bash

# dependencies
sudo apt update
sudo apt upgrade -y
sudo apt install -y git gcc

# go
GOVERSION=1.14.2
curl -O "https://dl.google.com/go/go$GOVERSION.linux-amd64.tar.gz"
sudo tar -C /usr/local -xzf "go$GOVERSION.linux-amd64.tar.gz"
rm "go$GOVERSION.linux-amd64.tar.gz"
echo "export PATH=$PATH:/usr/local/go/bin" >> .profile
source .profile

# code
git clone https://github.com/bartol/bartol.dev
cd bartol.dev
go build -o www
cd ..

# ufw
sudo apt install -y ufw
sudo ufw allow OpenSSH
yes | sudo ufw enable

# nginx
sudo apt install -y nginx
sudo ufw allow 'Nginx Full'
sudo cp -sv ~/bartol.dev/deploy/nginx /etc/nginx/sites-available/bartol.dev
sudo ln -sv /etc/nginx/sites-available/bartol.dev /etc/nginx/sites-enabled/
sudo nginx -t
sudo nginx -s reload

# service
sudo ln -sv ~/bartol.dev/deploy/service /lib/systemd/system/www.service
sudo systemctl start www

# fossil
sudo apt install -y fossil
sudo ln -sv ~/bartol.dev/deploy/fossil /lib/systemd/system/fossil.service
sudo systemctl start fossil

# certbot
sudo apt install -y python3-acme python3-certbot python3-mock python3-openssl \
	python3-pkg-resources python3-pyparsing python3-zope.interface
sudo apt install -y python3-certbot-nginx
sudo certbot --nginx -n -m b@bartol.dev --agree-tos --no-redirect \
	-d bartol.dev -d www.bartol.dev -d fossil.bartol.dev
sudo certbot renew --dry-run

# goaccess
sudo apt install -y goaccess

# htop
sudo apt install -y htop

# alias
echo "alias up=~/bartol.dev/deploy/update.sh" >> .profile
