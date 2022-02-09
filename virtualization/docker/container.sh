# --------------------------------------------------------------------------------------------------------
# -------- Stop container
# docker stop <container_id|container_name>
$ docker stop murachs-mysql 

# -------------------------------------------------------------------------------------------------------
# -------- Start a container
# docker start <container_id|container_name>
$ docker start murachs-mysql

# -------------------------------------------------------------------------------------------------------
# -------- Kill a container
# docker kill <container_id|container_name>
$ docker kill murachs-mysql

# kill all running containers 
docker kill `docker ps -aq`

# -------------------------------------------------------------------------------------------------------
# -------- Remove a container
# docker rm <container_id|container_name>
$ docker rm hopeful_wright

# -------------------------------------------------------------------------------------------------------
# -------- Create a stopped container
# docker container create [OPTIONS] IMAGE [COMMAND] [ARG...]
$ docker container create --name ubuntuDNS --dns="1.0.0.1" ubuntu


# -------- Create and run container
# If the image doesnt's exist, try to pull
$ docker run --detach --name ubuntuDNS --dns="1.0.0.1" ubuntu

$ docker run --detach --limit-memory 4GB --reserve-memory 2GB --publish 80:80 apache 

# iteractive bash (ash)
# -i and -t
$ docker run ---interactive --tty alpine /bin/ash

# -i flag connects the container to the terminal
# --rm removes the container's file system after tthe container exits
# -p 8082:8080 exposes the port 8082 externally, thus mapping to port 8080 on the host machine


# Create if don't exists and Run
$ docker run --detach --publish 80:80 --name container_name prefix/image_name

# exclude after exit
$ docker run --interactive --rm -p 80:80 --rm --name container_name prefix/image_name

# add the host to access
$ docker run --detach -p 80:80 --name container_name prefix/image_name --add-host host.docker.internal:host-gateway

# -------- Restarting Policy
# If you manually stop a container, its restart policy is ignored until the Docker daemon restarts or the container is manually restarted.
$ ​docker run --detach --restart unless-stopped redis

$ docker run httpd:latest --restart on-failure:5  # always | unless-stopped | on-failure

# The value of the --restart flag can be any of the following:
#
# * no : Do not automatically restart the container. (the default)
# 
# * on-failure : Restart the container if it exits due to an error, which manifests as a non-zero exit code.
# 
# * always : Always restart the container if it stops. If it is manually stopped, it is restarted only when Docker 
# daemon restarts or the container itself is manually restarted.
# 
# * unless-stopped : Similar to always, except that when the container is stopped (manually or otherwise), 
# it is not restarted even after Docker daemon restarts.


# -------------------------------------------------------------------------------------------------------
# Lists containers
$ docker container ls


# -------------------------------------------------------------------------------------------------------
# Create a new image from a container’s changes
$ docker commit c3f279d17e0a  svendowideit/testimage:version3


# -------------------------------------------------------------------------------------------------------

# docker container stop sends a SIGTERM signal to the main application process inside the container (PID 1)

docker container stop percy

docker container run --detach --name webserver -p 80:8080 nigelpoulton/pluralsight-docker-ci

docker network create --detach macvlan --subnet=10.0.0.0/24 --ip-range=10.0.0.0/25 --gateway=10.0.0.1 -o parent=eth0.100 macvlan100


