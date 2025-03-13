## Install docker and run the container
- Docker installation
```sh
mkdir docker
cd docker 
sudo apt update
sudo apt install -y wget net-tools curl net-tools jq unzip 
curl https://get.docker.com | bash
cd
docker images
docker ps
sudo su –
docker images
docker ps # you will get output
sudo groupadd docker # If the group already exists, you'll see an error message
sudo usermod -aG docker ubuntu
su - ubuntu
docker images
docker ps
docker version
```
- To run the project
```sh
cd project-root/
cd backend
sudo docker build -t backend-image .
sudo docker run -d -p 3000:3000 --name backend-container backend-image
docke ps
docker ps
cd ../frontend
sudo docker build -t frontend-image .
sudo docker run -d -p 3001:3001 --name frontend-container frontend-image
docker ps
```
- Stop the running container and remove the images
```sh
docker ps
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker ps
docker images
docker ps -a
docker rmi $(docker images -aq) --force 
docker images
```
- pgadmin4 path `C:\Users\Lucky Dell\AppData\Local\Programs\pgAdmin 4\v7`
- Install docker-compose
```sh
sudo apt update
sudo apt install docker-compose-plugin -y
sudo docker compose up --build -d
cd project-root/
git branch
git pull origin master
sudo docker compose up --build -d
```

