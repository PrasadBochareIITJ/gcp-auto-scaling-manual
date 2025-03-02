#!/bin/bash

# Update and install Apache
sudo apt update -y
sudo apt install apache2 -y

# Enable and start Apache service
sudo systemctl start apache2
sudo systemctl enable apache2

# Create a simple index page
echo "<h1>Welcome to Auto-Scaling Demo</h1>" | sudo tee /var/www/html/index.html

# Open required firewall ports
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
