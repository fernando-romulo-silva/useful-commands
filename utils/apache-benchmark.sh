# Link
# https://help.salesforce.com/s/articleView?id=001115044&type=1

# send 10000 GET requests to a target HTTP service, with 50 concurrent clients, and setting the custom request header "UUID" to "my-uuid":
$ ab -n 10000 -c 50 -H "UUID: my-uuid" http://localhost:8081/v1/clients