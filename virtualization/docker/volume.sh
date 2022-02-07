# --------------------------------------------------------------------------------------------------------
# -------- Connect Volume From another container
$ docker run --name=d1 -v /svr1 busybox sh -c 'touch /svr1/some_data1'

$ docker run --name=d2 -v /svr2 busybox sh -c 'touch /svr2/some_data2'

# connect to two volumes, d1 and d2
$ docker run --rm --volumes-from=d1 --volumes-from=d2 busybox sh -c 'find -name some_data'
