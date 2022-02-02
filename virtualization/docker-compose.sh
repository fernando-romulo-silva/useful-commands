# Compose has this levels
# * version
# * services
# * networks
# * volumes
# * secrets
# * configs


# Starts all containers defined in a Docker Compose file -d is background
$ docker-compose up -d

# or
$ docker-compose -f prod-equus-bass.yml up -d


# Down Stops all containers defined in a Docker Compose file
$ docker-compose down

# or
$ docker-compose -f docker-compose.yaml down


# show the current status
$ docker-compose ps

# list the processes running inside of each service
$ docker-compose top

# remove
$ docker-compose rm

# restart the application
$ docker-compose restart