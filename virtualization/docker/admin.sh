# --------------------------------------------------------------------------------------------------------
# -------- login on docker repository
docker login --username=fernandoromulosilva --password=123changeit

# -------------------------------------------------------------------------------------------------------
# -------- Show the logs
# docker logs [CONTAINER]

$ docker logs jmodular-java-tests-1

13:37:15.464 [main] INFO  modular.java.test.App - hello, the application has started
13:37:15.466 [main] ERROR modular.java.test.App - Hello World!
13:37:15.466 [main] INFO  modular.java.test.App - the application is now complete

# --follow command will continue streaming the new output
docker logs --follow books-database

# -------------------------------------------------------------------------------------------------------
# -------- Docker PS
# Show the running container
$ docker ps

CONTAINER ID   IMAGE       COMMAND                  CREATED        STATUS         PORTS                                                  NAMES
7a38e315e870   mysql:5.7   "docker-entrypoint.s…"   6 months ago   Up 3 seconds   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp   murachs-mysql

# filtering
$ docker ps --filter "label=a=1" --filter "label=b=2"


# -------------------------------------------------------------------------------------------------------
# -------- Debuging docker
# To configure the Docker daemon using a JSON file, create a file at /etc/docker/daemon.json on Linux systems 
#
# Here’s what the configuration file looks like:

{
  "debug": true,
  "tls": true,
  "tlscert": "/var/docker/server.pem",
  "tlskey": "/var/docker/serverkey.pem",
  "hosts": ["tcp://192.168.59.3:2376"]
}


# -------------------------------------------------------------------------------------------------------
# -------- Get low-level information Docker objects (container, image, networks, etc)
# docker inspect [OBJECT]
$ docker inspect murachs-mysql # container
[
  {
    "CreatedAt": "2020-04-19T11:00:21Z",
    "Driver": "local",
    "Labels": {},
    "Mountpoint": "/var/lib/docker/volumes/8140a838303144125b4f54653b47ede0486282c623c3551fbc7f390cdc3e9cf5/_data",
    "Name": "myvolume",
    "Options": {},
    "Scope": "local"
  }
  ...

$ docker volume inspect myvolume # volume
[
  {
    "CreatedAt": "2020-04-19T11:00:21Z",
    "Driver": "local",
    "Labels": {},
    "Mountpoint": "/var/lib/docker/volumes/8140a838303144125b4f54653b47ede0486282c623c3551fbc7f390cdc3e9cf5/_data",
    "Name": "myvolume",
    "Options": {},
    "Scope": "local"
  }
]
...
# -------------------------------------------------------------------------------------------------------
# -------- Label 
# Labels are used in Dockerfile to help organize your Docker Images.
#
# running container 
$ docker run my-image:latest --label=com.example.demo-label=example-value

# docker file
FROM ubuntu:latest
LABEL "website.name"="geeksforgeeks website"

# filtering
$ docker ps --filter "label=a=1" --filter "label=b=2"

# --------------------------------------------------------------------------------------------------------
# -------- Cleaning

# Remove all unused volumes
docker volume prune


# Remove all unused images
docker images -qf dangling=true | xargs docker rmi

# or
docker prune

# Remove dangling volumes
docker volume ls -qf dangling=true | xargs -r docker volume rm

# Delete exited containers
docker rm `docker ps -aq`

# Remove all unused thing
docker system prune

# -------------------------------------------------------------------------------------------------------
# -------- Stats
#  
$ docker stats

CONTAINER ID        NAME                                    CPU %               MEM USAGE / LIMIT     MEM %               NET I/O             BLOCK I/O           PIDS
b95a83497c91        awesome_brattain                        0.28%               5.629MiB / 1.952GiB   0.28%               916B / 0B           147kB / 0B          9


# -------- Events 
# Shell 1: Listening for events:

$ docker events

# Shell 2: Start and Stop containers:

$ docker create --name test alpine:latest top
$ docker start test
$ docker stop test

Shell 1: (Again .. now showing events):

2017-01-05T00:35:58.859401177+08:00 container create 0fdb48addc82871eb34eb23a847cfd033dedd1a0a37bef2e6d9eb3870fc7ff37 (image=alpine:latest, name=test)
2017-01-05T00:36:04.703631903+08:00 network connect e2e1f5ceda09d4300f3a846f0acfaa9a8bb0d89e775eb744c5acecd60e0529e2 (container=0fdb...ff37, name=bridge, type=bridge)
2017-01-05T00:36:04.795031609+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)


# -------------------------------------------------------------------------------------------------------
# ----------- DNS
# change the dns
$ sudo dockerd --dns 8.8.8.8


