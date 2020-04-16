# You can also look at the Pods with:
kubectl get pods

# Having our service.yml file ready, we can create our first Kubernetes service, by executing the following kubectl command:
kubectl create -f service.yml

#or you can use 'apply' command, create if not exist or update the resource:
kubectl apply -f service.yml

# To see if our service is created properly:
kubectl get services

# To see the details of a specific service, we use the describe command:
kubectl describe service rest-example

# Describe Persistent volume claim
kubectl describe pvc mysql-pv-claim