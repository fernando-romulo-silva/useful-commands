#--------------------------------------------------------------------------------------------------------
# login on docker repository
docker login --username=fernandoromulosilva --password=123changeit

#--------------------------------------------------------------------------------------------------------
# -------- Images

# pull a image
# docker image pull <repository>:<tag>
docker pull ubuntu:16.04


# docker image pull <url-register>/<repository>:<tag>
docker image pull gcr.io/google-containers/git-sync:v3.1.5


# tag an image
docker image tag <current-tag>:<new-tag> <repository>:<new-tag>

docker image tag web:latest nigelpoulton/web:latest


# list images
docker image ls

# or
docker images


# Create a image (from Dockerfile)
docker build --tag image_name .


# Create a image (from Dockerfile)
docker image build --file src/main/docker/Dockerfile.something --tag prefix/image_name .


# List prefix's images
docker image ls | grep prefix/


# Remove an image
docker rmi 59ada6b2b508


# create a image from container
docker container commit 59ada6b2b508 name-image


# search images on the registers
docker search openjdk


# show the image's layer
docker image inspect


# show the image's layer
docker image history web:latest


# get image digest
docker image ls --digests alpine


#--------------------------------------------------------------------------------------------------------
# -------- Cleaning

# Remove all unused volumes
docker volume prune


# Remove all unused images
docker images -qf dangling=true | xargs docker rmi

# or
docker prune


# Remove dangling volumes
docker volume ls -qf dangling=true | xargs -r docker volume rm

# Delete exited containers
docker rm `docker ps -aq`


# kill all running containers 
docker kill `docker ps -aq`


# Remove all unused thing
docker system prune

#--------------------------------------------------------------------------------------------------------
# -------- Containers

# Run the image
docker run -d -p 80:80 --name container_name prefix/image_name

# exclude after exit
docker run -i --rm -p 80:80 --rm --name container_name prefix/image_name

# add the host to access
docker run -d -p 80:80 --name container_name prefix/image_name --add-host host.docker.internal:host-gateway

# retarts policies
docker container run --name neversaydie -it --restart always alpine sh # always | unless-stopped | on-failure

# -i flag connects the container to the terminal
# --rm removes the container's file system after tthe container exits
# -p 8082:8080 exposes the port 8082 externally, thus mapping to port 8080 on the host machine


# Lists containers
docker container ls

# List images only latest
docker image ls --filter=reference="*:latest"

# attach it
docker container exec -it container_name bash

# one and only process running inside of the container!!!
ps -elf

# killing the main process in the container will kill the container


# Use apt-get install no-install-recommends makes sure that apt only installs main dependencies


# -------------------------------------------------------------------------------------------------------

# docker container stop sends a SIGTERM signal to the main application process inside the container (PID 1)

docker container stop percy

docker container run --detach --name webserver -p 80:8080 nigelpoulton/pluralsight-docker-ci

docker network create -d macvlan --subnet=10.0.0.0/24 --ip-range=10.0.0.0/25 --gateway=10.0.0.1 -o parent=eth0.100 macvlan100


# -------------------------------------------------------------------------------------------------------
# -------- NetWork

# create network
docker network create -d bridge localnet

# attach container this net work
docker container run -d --name c1 --network localnet alpine sleep 1d

# inspect it
docker network inspect localnet

# list all local networks
docker network ls


# -------------------------------------------------------------------------------------------------------
# -------- Show the logs

# logs
docker logs books-database

# --follow command will continue streaming the new output
docker logs --follow books-database

