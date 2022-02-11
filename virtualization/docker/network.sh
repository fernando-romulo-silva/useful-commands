# -------------------------------------------------------------------------------------------------------
# -------- Create network
$ docker network create --driver bridge localnet

# bridge : The default network driver. 
# If you don't specify a driver, this is the type of network you are creating. 
# Bridge networks are usually used when your applications run in standalone containers that need to communicate.

$ docker network create --driver macvlan --subnet=10.0.0.0/24 --ip-range=10.0.0.0/25 --gateway=10.0.0.1 -o parent=eth0.100 macvlan100

# -------------------------------------------------------------------------------------------------------
# -------- Create a container with a network already exists
$ docker container run --detach --name c1 --network localnet alpine sleep 1d

# -------------------------------------------------------------------------------------------------------
# -------- Inspect it
$ docker network inspect localnet

# -------------------------------------------------------------------------------------------------------
# -------- List all local networks
$ docker network ls

# -------- List all container on network
$ docker network inspect -f '{{json .Containers}}' c6b0cccfd892 | jq '.[] | .Name + ":" + .IPv4Address'

# -------------------------------------------------------------------------------------------------------
# ------- Check container's port
# docker port <CONTAINER_ID|CONTAINER_NAME>
$ docker port murachs-mysql
3306/tcp -> 0.0.0.0:3306
3306/tcp -> :::3306

# or 

$ docker inspect --format='{{.NetworkSettings.Ports}}' murachs-mysql

# or

$ docker ps

# -------------------------------------------------------------------------------------------------------
# To connect a running container to an existing user-defined bridge
$ docker network connect my-net my-nginx