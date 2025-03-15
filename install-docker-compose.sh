#!/bin/bash

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verify Docker Compose installation
echo -e "\n\033[1;34m========================\033[0m"
echo -e "\033[1;32mDocker Compose Version:\033[0m"
echo -e "\033[1;34m========================\033[0m"
docker-compose --version
echo -e "\033[1;34m========================\033[0m\n"

