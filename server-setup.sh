#!/bin/bash
# This script runs on EC2 startup to install Nginx and display the Server ID
apt-get update -y
apt-get install -y nginx
systemctl start nginx
systemctl enable nginx
echo "<h1>High Performance App - Server ID: $(hostname -f)</h1>" > /var/www/html/index.html
