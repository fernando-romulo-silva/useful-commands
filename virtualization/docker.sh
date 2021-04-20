
# login on docker repository
docker login --username=fernandoromulosilva --password=fernandoDocker# --docker-email=fernando.romulo.silva@gmail.com

# pull a image
# docker image pull <repository>:<tag>
docker pull ubuntu:16.04

# docker image pull <url-register>/<repository>:<tag>
docker image pull gcr.io/google-containers/git-sync:v3.1.5

# list images
docker image ls

# or
docker images


# Remove all unused volumes
docker volume prune

# Create a image (from Dockerfile)
docker build -t image_name .

# Create a image (from Dockerfile)
docker image build -f src/main/docker/Dockerfile.something -t prefix/image_name .

# List prefix's images
docker image ls | grep prefix/

# Remove an image
docker rmi 59ada6b2b508

# Run the image
docker run -d -p 80:80 --name container_name image_name


docker run -i --rm -p 80:80 --rm --name container_name image_name

# -i flag connects the container to the terminal
# --rm removes the container's file system after tthe container exits
# -p 8082:8080 exposes the port 8082 externally, thus mapping to port 8080 on the host machine


# Lists containers
docker container ls

# List images only latest
docker image ls --filter=reference="*:latest"

# attach it
docker container exec -it container_name bash

# search images on the registers
docker search openjdk

# show the image's layer
docker image inspect

docker image ls --digests alpine

