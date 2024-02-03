#
$ kubectl port-forward container-name-34545f33-34dfg --namespace my-name-space 9010:9010

# check the version
$ kubectl version

# You can also look at the Pods with:
$ kubectl get pods

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

# Show displays the addresses
$ kubectl cluster-info

# The "kubectl get" command is used to display basic information about one or more resources:
$ kubectl get pod # pods
$ kubectl get rs # replicasets
$ kubectl get svc # services

# To target only pods in a specific namespace, use the namespace flag:
$ kubectl get deploy --namespace my-namespace # deployments
    
# shows the complete list of resource names that can be used with this command.
$ kubectl --help 
    
# To display only the name for each resource, use the -o name option.      
$ kubectl get pods -o name --namespace my-namespace

# The "kubectl describe" command can be used to get more details about a specific resource or a group of resources: 
kubectl describe pods wildfly-65cbbddcd7-68q4r --namespace my-namespace

# Run a command in a Container in the cluster by specifying the Pod name. You can specific namespace, use the namespace flag:
$ kubectl exec wildfly-65cbbddcd7-68q4r ls --namespace my-namespace

# To get a Shell in a Container, use the -t -i options to get a tty and attach STDIN. You can specific namespace, use the namespace flag:
$ kubectl exec -t -i  wildfly-65cbbddcd7-68q4r bash --namespace my-namespace

# show all elements
$ kubectl get all -o wide