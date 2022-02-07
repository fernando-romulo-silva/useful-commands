# --------------------------------------------------------------------------------------------------------
# --------- Pull a image
# docker image pull <repository>:<tag>
$ docker pull ubuntu:16.04

# docker image pull <url-register>/<repository>:<tag>
$ docker image pull gcr.io/google-containers/git-sync:v3.1.5


# -------------------------------------------------------------------------------------------------------
# --------- History
# Docker history show the history of an image.
$ docker history modular-java-tests-iso:latest
IMAGE          CREATED        CREATED BY                                      SIZE      COMMENT
fd809ad91774   2 days ago     /bin/sh -c #(nop)  ENTRYPOINT ["/bin/sh" "-c…   0B        
7a2447ac2b8b   2 days ago     /bin/sh -c #(nop) COPY file:e0c70e858407421e…   1.8kB     
808b3ed2a2b0   2 days ago     /bin/sh -c #(nop) COPY multi:067583134130327…   4.98MB    
eca5cc474853   2 days ago     /bin/sh -c #(nop) COPY dir:4d2e32e4cc3638b73…   51MB      
9c0d23fb5e7b   2 days ago     /bin/sh -c #(nop) WORKDIR /deployment           0B        
6dbb9cc54074   9 months ago   /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B        
<missing>      9 months ago   /bin/sh -c #(nop) ADD file:8ec69d882e7f29f06…   5.61MB 



# -------------------------------------------------------------------------------------------------------
# --------- Push
# Docker images are pushed to Docker Hub through the docker push command.
# docker push <REGISTRY_HOST>:<REGISTRY_PORT>/<APPNAME>:<APPVERSION> 
$ docker push repo.company.com:3456/myapp:0.1

# -------------------------------------------------------------------------------------------------------
# --------- Tag an image
$ docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]

# To tag a local image with ID “0e5574283393” into the “fedora” repository with “version1.0”:
$ docker tag 0e5574283393 fedora/httpd:version1.0

# To tag a local image with name “httpd” into the “fedora” repository with “version1.0”:
$ docker tag httpd fedora/httpd:version1.0 

# 
$ docker tag web:latest nigelpoulton/web:latest

# -------------------------------------------------------------------------------------------------------
# --------- List Images
$ docker image ls
# 
$ docker images

# List prefix's images
$ docker image ls | grep prefix/

# get image digest
$ docker image ls --digests alpine

# -------------------------------------------------------------------------------------------------------
# --------- Inspect Images
# Docker inspect provides detailed information on constructs controlled by Docker.

$ docker inspect --format '{{.Config.Cmd}}' <image:tag>

$ docker inspect --format '{{.Config.Entrypoint}}' <image:tag>


# -------------------------------------------------------------------------------------------------------
# --------- Create
# Create a image (from root Dockerfile)
$ docker build --tag image_name .

# Create a image (from especific Dockerfile) 
$ docker image build --file src/main/docker/Dockerfile.something --tag prefix/image_name .

# Different repository <hub-user>/<repo-name>:<tag>
$ docker build --tag whenry/fedora-jboss:latest .


# -------------------------------------------------------------------------------------------------------
# --------- Remove
# Remove an image
$ docker rmi 59ada6b2b508

# or

$ docker image rm mysql

Untagged: mysql:latest
Untagged: mysql@sha256:feada149cb8ff54eade1336da7c1d080c4a1c7ed82b5e320efb5beebed85ae8c

Options:

--force , -f    Force removal of the image
--no-prune		Do not delete untagged parents

# -------------------------------------------------------------------------------------------------------
# --------- History
# show the image's layer
$ docker image history web:latest





# create a image from container
$ docker container commit 59ada6b2b508 name-image

# search images on the registers
$ docker search openjdk

# show the image's layer
$ docker image inspect

