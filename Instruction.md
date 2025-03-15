- The expected outcomes are
    - Check the status of backend using Postman
    - Check the status of frontend using URL
    - Check the postgress db status using pgadmin4
    - Using portainer check all the running container

### Pre-requsites
- Ubuntu server -Lunch t2.medium and login using putty.

### Install required dependencies
- Install docker, docker-compose 
```sh
bash install-docker.sh
exit
su - ubuntu
docker images
docker images
bash install-docker-compose.sh
docker --version
docker-compose --version
```
### Launch Portainer
- Run the Portainer container
```sh
docker-compose -f docker-compose.portainer.yml up -d
docker ps
```
- Once the image is pulled copy the ubuntu IPv4:9000 in edge browser you will find the portainer UI if you find cache just stop the container and start it again.

### Launch Frontend and Backend
- Run the be-fe container
```sh
docker-compose -f docker-compose.befe.yml up -d
docker ps
```
- 
## Launch postgres and pgadmin
- Run the database container
```sh
docker-compose -f docker-compose.db.yml up -d
docker ps
```