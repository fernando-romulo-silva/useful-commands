# --------------------------------------------------------------------------------------------------------
# -------- Stop container
# docker stop <container_id|container_name>
$ docker stop murachs-mysql 

# -------- Start a container
# docker start <container_id|container_name>
$ docker start murachs-mysql

# -------- Kill a container
# docker kill <container_id|container_name>
$ docker kill murachs-mysql

# -------- Remove a container
# docker rm <container_id|container_name>
$ docker rm hopeful_wright

# -------- Create a container
# docker container create [OPTIONS] IMAGE [COMMAND] [ARG...]
$ docker run --detach --name ubuntuDNS --dns="1.0.0.1" ubuntu

$ docker run --detach --publish 80:80 apache









# Create if don't exists and Run
docker run --detach -p 80:80 --name container_name prefix/image_name

# exclude after exit
docker run --interactive --rm -p 80:80 --rm --name container_name prefix/image_name

# add the host to access
docker run --detach -p 80:80 --name container_name prefix/image_name --add-host host.docker.internal:host-gateway

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

docker network create --detach macvlan --subnet=10.0.0.0/24 --ip-range=10.0.0.0/25 --gateway=10.0.0.1 -o parent=eth0.100 macvlan100