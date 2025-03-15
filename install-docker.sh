#!/bin/bash

# Update package list and install prerequisites
sudo apt update -y
sudo apt install -y wget net-tools curl jq unzip apt-transport-https ca-certificates software-properties-common

# Create a 'docker' directory and navigate into it
mkdir -p ~/docker
cd ~/docker

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

# Add current user and 'ubuntu' user to the Docker group
sudo groupadd docker 2>/dev/null || echo "Docker group already exists"
sudo usermod -aG docker $USER
sudo usermod -aG docker ubuntu

# Apply the group change without requiring a full logout
newgrp docker <<EOF
echo -e "\nChecking Docker images as the new group:"
docker images
echo -e "\nChecking running Docker containers as the new group:"
docker ps
EOF

# Prompt the user to log out and log back in
echo -e "\n✅ Docker installation completed! Please log out and log back in (or reboot) for the group changes to take effect."

# Set executable permission for this script
chmod +x "$0"
