#!/bin/bash

# Update package list and install prerequisites
sudo apt update -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key and repository
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

# List running containers
echo "\nRunning Docker containers:"
sudo docker ps

# List available Docker images
echo "\nAvailable Docker images:"
sudo docker images

# Navigate to project root and build backend
cd project-root/
cd backend
sudo docker build -t backend-image .
sudo docker run -d -p 3000:3000 --name backend-container backend-image

docker ps

# Navigate to frontend and build frontend
cd ../frontend
sudo docker build -t frontend-image .
sudo docker run -d -p 3001:3001 --name frontend-container frontend-image

docker ps

# Set executable permission for this script
chmod +x "$0"
