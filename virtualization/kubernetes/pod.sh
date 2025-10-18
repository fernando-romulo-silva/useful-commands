# To display only the name for each resource, use the -o name option.      
$ kubectl get pods -o name --namespace my-namespace

# The "kubectl describe" command can be used to get more details about a specific resource or a group of resources: 
$ kubectl describe pods wildfly-65cbbddcd7-68q4r --namespace my-namespace

# Run a command in a Container in the cluster by specifying the Pod name. You can specific namespace, use the namespace flag:
$ kubectl exec wildfly-65cbbddcd7-68q4r ls --namespace my-namespace

# To get a Shell in a Container, use the -t -i options to get a tty and attach STDIN. You can specific namespace, use the namespace flag:
$ kubectl exec -t -i  wildfly-65cbbddcd7-68q4r bash --namespace my-namespace

# -----------------------------------------
# Get all pod names from dev01 namespace:

$ kubectl get pods --namespace dev01

# or

$ kubectl get pods -n dev01

$ kubectl get svc,deploy,pod


#------------------------------------------
# Connect to pod:

$ kubectl port-forward pod-name 5005:5005 --namespace dev01

#-------------------------------------------
# Log pods

$ kubectl logs pod_name --namespace dev01

# If a Pod contains multiple containers, you must specify the container name using the -c flag:

$ kubectl logs <pod_name> -c <container_name> --namespace dev01

# Streaming logs

$ kubectl logs --follow <pod_name>
