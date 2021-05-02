# Compose has this levels
# * version
# * services
# * networks
# * volumes
# * secrets
# * configs


# Starts all containers defined in a Docker Compose file
docker-compose -f docker-compose.yaml up -d

# Down Stops all containers defined in a Docker Compose file
docker-compose -f docker-compose.yaml 