# Delete the cluster
minikube delete cluster-name

# Start the cluster
minikube start --vm-driver="virtualbox" 

minikube delete --all

# start with 2 nodes
minikube start --nodes 2

# other infos
minikube start --vm-driver="virtualbox" --memory=8192 --cpus=6 --disk-size=10g --nodes 3 -p multinode

# Minikube stop
minikube stop -p multinode

# Show dashboard
minikube dashboard

# Minikube runs in a separate VM, hence it will not see the images you've built locally using Docker on your machine.
# Set docker to point to minikube

eval $(minikube docker-env)

# Push to minikube docker
docker build -t hello-java:v1 .

# Set your deployment to not pull IfNotPresent, K8S default is set to "Always" Change to "IfNotPresent"
imagePullPolicy: IfNotPresent

# To get the URL and port to access our application
minikube service list

# All we need to call the service is the IP of the cluster. We can get it using the following command:
minikube ip

# There's a shortcut for getting to know the externally accessible service URL and a port number.
# We can use a minikube service command to tell us the exact service address:
minikube service rest-example --url

# http://192.168.99.100:32702/book

# You can connect the host to the cluster direct:
minikube tunnel

# Sometimes minikube does not clean up the tunnel network properly. To force a proper cleanup:
minikube tunnel --cleanup

# Show Minikube addons
minikube addons list

# Enable a addon
minikube addons enable ingress

minikube addons enable dashboard

minikube addons enable logviewer

minikube addons enable metrics-server