
# login on docker repository
docker login --username=fernandoromulosilva --password=fernandoDocker# --docker-email=fernando.romulo.silva@gmail.com

# pull a image
docker pull ubuntu:16.04

# Remove all unused volumes
docker volume prune

# Create a image (from Dockerfile)
docker build -t image_name .

# Run the image
docker run -d -p 80:80 --name container_name image_name