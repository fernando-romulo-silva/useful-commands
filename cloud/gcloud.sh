# init
$ gcloud init 

# Login on google cloud
$ gcloud auth login

# update the components
$ gcloud components update

# show the configuratio list
$ gcloud config configurations list

# set auth configs for application GOOGLE_APPLICATION_CREDENTIALS
$ gcloud auth application-default login

# define the project
$ gcloud config set project PROJECT_ID

# get credentials from cluster
$ gcloud container cluster get-credentials CLUSTER_ID

# set your compute zone
$ gcloud config set compute/zone southamerica-east1

# Configure cluster access for kubectl 
$ gcloud container clusters get-credentials CLUSTER_ID --region southamerica-east1 --project PROJECT_ID