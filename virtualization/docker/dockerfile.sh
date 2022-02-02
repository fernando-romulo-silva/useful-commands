# --------------------------------------------------------------------------------------------------------
# -------- Directive EXPOSE
# It documents ports intended for publishing at the time of running a container.
EXPOSE 5000 # it's not expose, only document


# -------- RUN
#  executes a command and commits the resulting changed files as a new layer in the image
RUN apk add --update --no-cache tesseract-ocr dumb-init \ # install tesseract and create user 'javauser'
      && addgroup --system javauser \
      && adduser -S -s /bin/false -G javauser javauser \
      && chown -R javauser:javauser /application
      
      
      
# -------- COPY
# COPY  
# takes in a src and destination
# It only lets you copy in a local file or directory from your host (the machine building the Docker image) 
# into the Docker image itself.
COPY myFile.jar application.jar


# -------- ADD
# ADD lets you do that too, but it also supports 2 other sources. 
# First, you can use a URL instead of a local file / directory. 
# Secondly, you can extract a tar file from the source directly into the destination.
ADD website /var/www/html