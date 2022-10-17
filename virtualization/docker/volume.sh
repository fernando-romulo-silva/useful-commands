# --------------------------------------------------------------------------------------------------------
# -------- Create volume
$ docker volume create myvol

# --------------------------------------------------------------------------------------------------------
# -------- Connect Volume From another container
$ docker run --name=d1 --volume /svr1 busybox sh -c 'touch /svr1/some_data1'

$ docker run --name=d2 --volume /svr2 busybox sh -c 'touch /svr2/some_data2'

# connect to two volumes, d1 and d2
$ docker run --rm --volumes-from=d1 --volumes-from=d2 busybox sh -c 'find -name some_data'

# -------- Connect on read only volume
$ docker volume create volume-name


$ docker run -v volume-name:/path/in/container:ro myImage

# or

$ docker run --mount source=volume-name,destination=/path/in/container,readonly my/image

# --------------------------------------------------------------------------------------------------------
# List Volume
$ docker volume list
DRIVER    VOLUME NAME
local     myvol
local     ac3d69b5be238813eec0eb7382997d1ceded70b0ed5015e7cb340a2e44fc40cf

# --------------------------------------------------------------------------------------------------------
# Inspect Volume
$ docker volume inspect myvol

# --------------------------------------------------------------------------------------------------------
# Delete one volume
$ docker volume rm myvol

# --------------------------------------------------------------------------------------------------------
# Delete All Volumes at Once
$ docker volume prune

# --------------------------------------------------------------------------------------------------------
# List volumes for specific volumes
$ docker inspect -f '{{ .Volumes }}' nginx

Or

$ docker volume inspect nginx-volume