#!/bin/bash

# Update package list and install prerequisites
sudo apt update -y
sudo apt install -y wget net-tools curl jq unzip apt-transport-https ca-certificates software-properties-common

# Create a 'docker' directory and navigate into it
mkdir -p ~/docker
cd ~/docker

# Add Docker's official GPG key and repository (overwrite if exists)
sudo rm -f /usr/share/keyrings/docker-archive-keyring.gpg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Check Docker status
if ! sudo systemctl is-active --quiet docker; then
    echo "Docker failed to start. Please check the service status."
    exit 1
fi

# Verify Docker installation
docker --version

