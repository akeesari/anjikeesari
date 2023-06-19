
# Azure CLI Commands
## Introduction

In this article, I am going to present a comprehensive cheat sheet of commonly used **azure cli** commands with examples.

The Azure command-line interface (Azure CLI) is a set of commands used to create and manage Azure resources. 

<!-- ## Prerequisites

- A Kubernetes cluster configured
- Helm package manager installed -->

## Installing Azure CLI

Use the following commands to install Azure CLI in Windows, MacOS and Linux environments.

```sh
# MacOS (using Homebrew):
brew install azure-cli

# Windows OS (using choco)
choco install azure-cli

#  verify the installation by running 
az --version

# updating cli
az upgrade
```
For more information, refer to the official documentation:  - [How to install the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)


## az Login

```sh
az login

```
## az account
```sh  
az account set -s "anji-cloud"

# Get a list of subscriptions for the logged in account.
az account list -o table 

# To view all the Azure subscription names and IDs for a specific Microsoft account,
az account list --query "[?user.name=='anjkeesari@gmail.com'].{Name:name, ID:id, Default:isDefault}" --output Table

# Get the details of a subscription.
 az account show
 az account show -o table

# Get all subscriptions for a tenant.
az account subscription list -o table

# Get details about a specified subscription.
az account subscription show --subscription-id "85c49b84-b13d-4168-962c-8107c5b32b7e"
# or
az account subscription show --id '85c49b84-b13d-4168-962c-8107c5b32b7e'

# Get the tenants for your account.
az account tenant list  

```

## az group

```sh
# Create a new resource group.k
az group create -l 'eastus' -n 'rg-demo'

# List resource groups.
az group list -o table

# Check if a resource group exists.
az group exists -n 'rg-demo'

# Create a resource group lock.
 az group lock create --lock-type ReadOnly -n lockName -g 'rg-demo'
 az group lock create --lock-type CanNotDelete -n lockName -g 'rg-demo'

# List lock information in the resource-group.
 az group lock list -g 'rg-demo'

# Show the details of a resource group lock.
 az group lock show -n lockname -g 'rg-demo'

# Delete a resource group lock.
az group lock delete -n lockName -g 'rg-demo'  

# Delete a resource group.
az group delete -n 'rg-demo'
```


## az aks

Manage Azure Kubernetes Services - [Reference](https://learn.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest)

```sh

# List managed Kubernetes clusters.
az aks list -o table

# Get access credentials for a managed Kubernetes cluster.

# user authentication
az aks get-credentials --name 'aks-cluster1-dev' --resource-group 'rg-aks-dev'

# admin authentication
az aks get-credentials --name 'aks-cluster1-dev' --resource-group 'rg-aks-dev' --admin

# Get the versions available for creating a managed Kubernetes cluster.
az aks get-versions --location westus2 -o table 

# Run a shell command
az aks command invoke -n 'aks-cluster1-dev' -g 'rg-aks-dev' --command "kubectl get namespaces"
az aks command invoke -n 'aks-cluster1-dev' -g 'rg-aks-dev' --command "kubectl create namespace test"

# Download and install kubectl, the Kubernetes command-line tool. 
az aks install-cli

# List node pools in the managed Kubernetes cluster
az aks nodepool list --cluster-name 'aks-cluster1-dev' -g 'rg-aks-dev'
az aks nodepool list --cluster-name 'aks-cluster1-dev' -g 'rg-aks-dev' -o table
```

## az acr

Manage private registries with Azure Container Registries. - [Reference](https://learn.microsoft.com/en-us/cli/azure/acr?view=azure-cli-latest)

## az ad
Azure AD for Role Based Access Control - [Reference](https://learn.microsoft.com/en-us/cli/azure/ad?view=azure-cli-latest)

## az webapp

Manage web app logs - [Reference](https://learn.microsoft.com/en-us/cli/azure/webapp/log?view=azure-cli-latest)

```sh

# Start live log tracing for a web app.
az webapp log tail --name 'feedback-api-dev' --resource-group 'aklab-rg-dev'

# Download a web app's log history as a zip file.
az webapp log download --name 'feedback-api-dev' --resource-group 'aklab-rg-dev' --log-file webapp_624221039.zip
```
## Reference

- [Azure CLI reference](https://learn.microsoft.com/en-us/cli/azure/reference-index?view=azure-cli-latest)