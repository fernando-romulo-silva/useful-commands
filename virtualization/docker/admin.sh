# --------------------------------------------------------------------------------------------------------
# -------- login on docker repository
$ docker login --username=fernandoromulosilva --password=123changeit

# --------------------------------------------------------------------------------------------------------
# -------- Show info about docker that is installed in your system
$ docker info
Client:
 Context:    default
 Debug Mode: false

Server:
 Containers: 8
  Running: 0
  Paused: 0
  Stopped: 8
 Images: 384
 Server Version: 20.10.7
 Storage Driver: overlay2
  Backing Filesystem: extfs
  Supports d_type: true
  Native Overlay Diff: true
  userxattr: false
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Cgroup Version: 1
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
 Swarm: inactive
 Runtimes: io.containerd.runc.v2 io.containerd.runtime.v1.linux runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 
 runc version: 
 init version: 
 Security Options:
  apparmor
  seccomp
   Profile: default
 Kernel Version: 5.4.0-97-generic
 Operating System: Ubuntu 20.04.3 LTS
 OSType: linux
 Architecture: x86_64
 CPUs: 24
 Total Memory: 62.82GiB
 Name: pc02
 ID: TWEW:67BH:XQTU:YS4Z:7AN4:RUS3:WLSI:ZAA3:SGEJ:NO26:ZX3W:4GSN
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Username: fernandoromulosilva
 Registry: https://index.docker.io/v1/
 Labels:
 Experimental: false
 Insecure Registries:
  127.0.0.0/8
 Live Restore Enabled: false

WARNING: No swap limit support

 

# --------------------------------------------------------------------------------------------------------
# -------- Check docker server and client
# checking the docker client and docker server
$ docker version
Client:
 Version:           20.10.7
 API version:       1.41
 Go version:        go1.13.8
 Git commit:        20.10.7-0ubuntu5~20.04.2
 Built:             Mon Nov  1 00:34:17 2021
 OS/Arch:           linux/amd64
 Context:           default
 Experimental:      true

Server:
 Engine:
  Version:          20.10.7
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.13.8
  Git commit:       20.10.7-0ubuntu5~20.04.2
  Built:            Fri Oct 22 00:45:53 2021
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.5.5-0ubuntu3~20.04.1
  GitCommit:        
 runc:
  Version:          1.0.1-0ubuntu2~20.04.1
  GitCommit:        
 docker-init:
  Version:          0.19.0
  GitCommit:        


# -------------------------------------------------------------------------------------------------------
# -------- Show the logs
# docker logs [CONTAINER]

$ docker logs jmodular-java-tests-1

13:37:15.464 [main] INFO  modular.java.test.App - hello, the application has started
13:37:15.466 [main] ERROR modular.java.test.App - Hello World!
13:37:15.466 [main] INFO  modular.java.test.App - the application is now complete

# --follow command will continue streaming the new output
$ docker logs --follow books-database

# -------------------------------------------------------------------------------------------------------
# -------- Docker PS
# Show the running container
$ docker ps

CONTAINER ID   IMAGE       COMMAND                  CREATED        STATUS         PORTS                                                  NAMES
7a38e315e870   mysql:5.7   "docker-entrypoint.s…"   6 months ago   Up 3 seconds   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp   murachs-mysql

# filtering
$ docker ps --filter "label=a=1" --filter "label=b=2"

# All containers
$ docker ps --all
# or
$ docker container ls --all


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

# Shell 1: (Again .. now showing events):
2017-01-05T00:35:58.859401177+08:00 container create 0fdb48addc82871eb34eb23a847cfd033dedd1a0a37bef2e6d9eb3870fc7ff37 (image=alpine:latest, name=test)
2017-01-05T00:36:04.703631903+08:00 network connect e2e1f5ceda09d4300f3a846f0acfaa9a8bb0d89e775eb744c5acecd60e0529e2 (container=0fdb...ff37, name=bridge, type=bridge)
2017-01-05T00:36:04.795031609+08:00 container start 0fdb...ff37 (image=alpine:latest, name=test)


# -------------------------------------------------------------------------------------------------------
# ----------- DNS
# change the dns
$ sudo dockerd --dns 8.8.8.8

# -------------------------------------------------------------------------------------------------------
# ----------- Disk Usage
$ docker system df
TYPE            TOTAL     ACTIVE    SIZE      RECLAIMABLE
Images          92        6         22.05GB   21.02GB (95%)
Containers      8         0         9B        9B (100%)
Local Volumes   3         1         220.2MB   92B (0%)
Build Cache     78        0         1.212GB   1.212GB
