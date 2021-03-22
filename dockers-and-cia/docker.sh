
# login on docker repository
docker login --username=fernandoromulosilva --password=fernandoDocker# --docker-email=fernando.romulo.silva@gmail.com

# pull a image
docker pull ubuntu:16.04

# Remove all unused volumes
docker volume prune

# Create a image (from Dockerfile)
docker build -t image_name .

# Create a image (from Dockerfile)
docker image build -f src/main/docker/Dockerfile.something -t prefix/image_name .

# List prefix's images
docker image ls | grep prefix/

# List images
docker images

# Remove an image
docker rmi 59ada6b2b508


# Run the image
docker run -d -p 80:80 --name container_name image_name


docker run -i -p 80:80 --rm --name container_name image_name