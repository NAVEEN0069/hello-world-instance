#!/bin/bash
sudo apt update -y
sudo apt install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "Hello, World!" | sudo tee /var/www/html/index.html > /dev/null
sudo systemctl restart apache2
