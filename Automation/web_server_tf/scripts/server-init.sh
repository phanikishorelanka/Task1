#!/bin/bash

sudo apt update
sudo apt install -y nginx

# update nginx port from 80 to 8080
sudo sed -i 's/listen 80 default_server/listen 8080 default_server/' /etc/nginx/sites-enabled/default
sudo sed -i 's/listen \[::\]:80 default_server/listen \[::\]:8080 default_server/' /etc/nginx/sites-enabled/default

# restart nginx server
sudo service nginx restart
