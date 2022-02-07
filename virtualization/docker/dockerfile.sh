# --------------------------------------------------------------------------------------------------------
# -------- FROM
# sets a base image that can be used as a platform to begin builds.
FROM eclipse-temurin:17.0.1_12-jre-alpine as builder

# --------------------------------------------------------------------------------------------------------
# -------- EXPOSE
# It documents ports intended for publishing at the time of running a container.
EXPOSE 5000 # it's not expose, only document

# now you are exposing it
$ docker run --name test-mysql --detach --publish 3306:5000 test-image:latest


# --------------------------------------------------------------------------------------------------------
# -------- RUN
#  executes a command and commits the resulting changed files as a new layer in the image
RUN apk add --update --no-cache tesseract-ocr dumb-init \ # install tesseract and create user 'javauser' on new layer
      && addgroup --system javauser \
      && adduser -S -s /bin/false -G javauser javauser \
      && chown -R javauser:javauser /application
      
      
# --------------------------------------------------------------------------------------------------------      
# -------- COPY
# takes in a src and destination
# It only lets you copy in a local file or directory from your host (the machine building the Docker image) 
# into the Docker image itself.
COPY myFile.jar application.jar


# --------------------------------------------------------------------------------------------------------
# -------- ADD
# Lets you do that too, but it also supports 2 other sources. 
# First, you can use a URL instead of a local file / directory. 
# Secondly, you can extract a tar file from the source directly into the destination.
ADD website /var/www/html


# --------------------------------------------------------------------------------------------------------
# -------- ENV
# It sets environment variables that are made available in subsequent build steps and to containers at the runtime.

ARG VAR_A 5
ENV VAR_B $VAR_A

# container
$ docker run --name test-container --env VAR_A=10 test-image:5.7


# --------------------------------------------------------------------------------------------------------
# -------- ARG
# Arguments can be set to a default value inside of a Dockerfile
ARG VAR_NAME 5

# but, argument when you build your image
--build-arg VAR_NAME=6

# --------------------------------------------------------------------------------------------------------
# -------- CMD 
# sets default command and/or parameters, which can be overwritten from command line when docker container runs.

# --------------------------------------------------------------------------------------------------------
# -------- ENTRYPOINT 
# configures a container that will run as an executable.

