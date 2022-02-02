# -------------------------------------------------------------------------------------------------------
# -------- Create network
$ docker network create -d bridge localnet

$ docker network create --detach macvlan --subnet=10.0.0.0/24 --ip-range=10.0.0.0/25 --gateway=10.0.0.1 -o parent=eth0.100 macvlan100

# -------- Attach container this net work
$ docker container run --detach --name c1 --network localnet alpine sleep 1d

# -------- Inspect it
$ docker network inspect localnet

# -------- List all local networks
$ docker network ls

# -------- List all container on network
$ docker network inspect -f '{{json .Containers}}' c6b0cccfd892 | jq '.[] | .Name + ":" + .IPv4Address'

# ------- Check container's port
# docker port <CONTAINER_ID|CONTAINER_NAME>
$ docker port murachs-mysql

# or 

$ docker inspect --format='{{.NetworkSettings.Ports}}' murachs-mysql
