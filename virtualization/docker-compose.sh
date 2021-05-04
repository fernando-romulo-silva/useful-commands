# Compose has this levels
# * version
# * services
# * networks
# * volumes
# * secrets
# * configs


# Starts all containers defined in a Docker Compose file -d is background
docker-compose up -d

# or
$ docker-compose -f prod-equus-bass.yml up -d


# Down Stops all containers defined in a Docker Compose file
docker-compose down

# or
docker-compose -f docker-compose.yaml down