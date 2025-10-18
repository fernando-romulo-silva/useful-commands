# check the version
$ kubectl version

# Show displays the addresses
$ kubectl cluster-info

# Having our service.yml file ready, we can create our first Kubernetes service, by executing the following kubectl command:
$ kubectl create -f service.yml

#or you can use 'apply' command, create if not exist or update the resource:
$ kubectl apply -f service.yml

# To see if our service is created properly:
$ kubectl get services -o wide

# To see the details of a specific service, we use the describe command:
$ kubectl describe service rest-example

# Describe Persistent volume claim
$ kubectl describe pvc mysql-pv-claim

# The "kubectl get" command is used to display basic information about one or more resources:
$ kubectl get pod # pods
$ kubectl get rs # replicasets
$ kubectl get svc # services

# To target only pods in a specific namespace, use the namespace flag:
$ kubectl get deploy --namespace my-namespace # deployments
    
# shows the complete list of resource names that can be used with this command.
$ kubectl --help 
    
# show all elements
$ kubectl get all -o wide