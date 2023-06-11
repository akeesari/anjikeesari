## Introduction

In this article, I am going to present a comprehensive cheat sheet of commonly used **ArgoCD  ** commands with examples.


`ArgoCD` is a popular tool for managing Kubernetes applications and deploying them in a declarative manner. ArgoCD provides a web UI, but it also has a command-line interface (CLI) that can be used to manage applications, repositories, and other resources.

## Prerequisites

- Install Argocd CLI [Install Argocd CLI](../devops/argocd/install-argocd-cli.md)
- Azure login
- Select the subscription
- Connect to k8s Cluster



## Installing ArgoCD

Use the following commands to install ArgoCD CLI in MacOS and Windows.

```sh
# MacOS (using Homebrew):
brew install argocd

# Windows OS (using Choco)
choco install argocd-cli

#  verify the installation by running 
argocd version
```

## Connection to Kubernetes cluster

Note: Make sure that you login into azure, select the azure subscription & connect k8s cluster before running any `argocd` commands.

``` sh
# Azure login
az login

# Select the subscription
az account set -s "anji.keesari"
az account show --output table

# Connect to k8s Cluster

# Azure Kubernetes Service Cluster User Role
az aks get-credentials -g "rg-aks-dev" -n "aks-cluster1-dev"

# Azure Kubernetes Service Cluster Admin Role
az aks get-credentials -g "rg-aks-dev" -n "aks-cluster1-dev" --admin

# get nodes
kubectl get no
kubectl get namespace -A
```

## ArgoCD Commands & description

Here are some common ArgoCD CLI commands and their purposes:

- `argocd login:` This command logs in to an ArgoCD server and saves the session token locally.
- `argocd app create:` This command creates a new application from a Git repository.
- `argocd app get:` This command retrieves information about an existing application, such as its status and configuration.
- `argocd app sync:` This command synchronizes an application's configuration with the desired state specified in its Git repository.
- `argocd app delete:` This command deletes an application from ArgoCD.
- `argocd app diff:` This command displays the differences between the current state of an application and the desired state specified in its Git repository.
- `argocd app history:` This command lists the deployment history of an application in ArgoCD.
- `argocd app rollback:` This command rolls back an application to a previous deployment revision.
- `argocd repo add:` This command adds a Git repository to ArgoCD's list of managed repositories.
- `argocd repo list:` This command lists all the Git repositories that ArgoCD is currently managing.
- `argocd repo rm:` This command removes a Git repository from ArgoCD's list of managed repositories.
- `argocd repo list-resources:` This command lists all the Kubernetes resources in a Git repository.
- `argocd proj create:` This command creates a new project in ArgoCD, which can be used to group related applications and apply shared policies.
- `argocd proj get:` This command retrieves information about an existing project, such as its applications and policies.
- `argocd proj delete:` This command deletes a project from ArgoCD.
- `argocd proj list:` This command lists all the projects in ArgoCD.
- `argocd proj delete:` This command deletes a project from ArgoCD.
- `argocd cluster add:` This command adds a new Kubernetes cluster to ArgoCD's list of managed clusters.
- `argocd cluster list:` This command lists all the Kubernetes clusters that ArgoCD is currently managing.
- `argocd cluster rm:` This command removes a Kubernetes cluster from ArgoCD's list of managed clusters.
- `argocd account update-password:` This command allows you to change the password for your ArgoCD account.
- `argocd account list:` This command lists all the user accounts that have access to ArgoCD.
- `argocd version:` This command retrieves the current version of ArgoCD.



## ArgoCD help

This command provides general help and usage information about ArgoCD. It gives an overview of available commands and their usage.


```sh
argocd help
or 
argocd --help
```
output

```sh
Available Commands:
  account     Manage account settings
  admin       Contains a set of commands useful for Argo CD administrators and requires direct Kubernetes access
  app         Manage applications
  cert        Manage repository certificates and SSH known hosts entries
  cluster     Manage cluster credentials
  completion  output shell completion code for the specified shell (bash or zsh)
  context     Switch between contexts
  gpg         Manage GPG keys used for signature verification
  help        Help about any command
  login       Log in to Argo CD
  logout      Log out from Argo CD
  proj        Manage projects
  relogin     Refresh an expired authenticate token
  repo        Manage repository connection parameters
  repocreds   Manage repository connection parameters
  version     Print version information
```

## ArgoCD commands help

This command provides detailed help and usage information about individual ArgoCD commands. It can be used to get specific information about any command's usage, options, and arguments.

```sh
argocd help app
```
output
```sh
Manage applications

Usage:
  argocd app [flags]
  argocd app [command]        

Examples:
  # List all the applications.
  argocd app list

  # Get the details of a application
  argocd app get my-app

  # Set an override parameter
  argocd app set my-app -p image.tag=v1.0.1

Available Commands:
  actions         Manage Resource actions
  create          Create an application
  delete          Delete an application
  delete-resource Delete resource in an application
  diff            Perform a diff against the target and live state.
  edit            Edit application
  get             Get application details
  history         Show application deployment history
  list            List applications
  logs            Get logs of application pods
  manifests       Print manifests of an application
  patch           Patch application
  patch-resource  Patch resource in an application
  resources       List resource of application
  rollback        Rollback application to a previous deployed version by History ID, omitted will Rollback to the previous version
  set             Set application parameters
  sync            Sync an application to its target state
  terminate-op    Terminate running operation of an application
  unset           Unset application parameters
  wait            Wait for an application to reach a synced and healthy state
```

```sh
argocd help repo
```
output
```sh
Manage repository connection parameters

Usage:
  argocd repo [flags]
  argocd repo [command]

Available Commands:
  add         Add git repository connection parameters
  get         Get a configured repository by URL
  list        List configured repositories
  rm          Remove repository credentials
```


```sh
argocd help account
```
output
```sh
Manage account settings

Usage:
  argocd account [flags]
  argocd account [command]

Available Commands:
  can-i           Can I
  delete-token    Deletes account token
  generate-token  Generate account token
  get             Get account details
  get-user-info   Get user info
  list            List accounts
  update-password Update an account's password
```


## Login to argocd

Before running next set of command you've to login into ArgoCD.

To login to ArgoCD, you can use the `argocd login` command followed by the URL of your ArgoCD server and your credentials. Here's an example:

``` sh
argocd login <ARGOCD_SERVER> [--insecure] [--username <USERNAME>] [--password <PASSWORD>]
```

examples:

```sh
# localhost argocd login
argocd login localhost:8080 - need to test this

argocd login yourdomainname.com

# IP address of the ArgoCD service.
argocd login 20.241.96.132
```
Note: By default, the Argo CD API server is not exposed with an external IP. To access the API server, Change the argocd-server service type to **LoadBalancer**:

``` sh
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```
If your ArgoCD server is using a self-signed SSL certificate, you may need to use the **--insecure** flag to bypass SSL verification.

Enter ArgoCD credentials
```sh
admin
xxxxx - in bash you may need to right click the mouse instead of key board copy paste to make it work
```
output
```sh
WARNING: server is not configured with TLS. Proceed (y/n)? y
Username: admin
Password: 
'admin:login' logged in successfully
Context '20.241.96.132' updated
```

in case if you use the yourdomainname.com URL, you will see output like this.
```sh
time="2022-11-20T09:44:31-08:00" level=warning msg="Failed to invoke grpc call. Use flag --grpc-web in grpc calls. To avoid this warning message, 
use flag --grpc-web."
Username: admin
Password: 
'admin:login' logged in successfully
Context 'yourdomainname.com' updated
```

Once you have logged in successfully, ArgoCD will save a session token locally so that you don't have to log in again for subsequent commands.


## Cluster list

This command lists the clusters connected to the ArgoCD server. It displays information about each cluster, such as name, server URL, and current context.

```sh
argocd cluster list
```
output
```sh
time="2022-11-20T09:48:31-08:00" level=warning msg="Failed to invoke grpc call. Use flag --grpc-web in grpc calls. To avoid this warning message, 
use flag --grpc-web."
SERVER                          NAME        VERSION  STATUS      MESSAGE  PROJECT
https://kubernetes.default.svc  in-cluster  1.22     Successful

```


## Add cluster

This command is used to add a new external Kubernetes cluster to the ArgoCD server. It requires specifying the cluster's context name, server URL, and authentication credentials.


```sh
argocd cluster add aks-cluster2-dev
```

output - It will look like this:

```sh
WARNING: This will create a service account `argocd-manager` on the cluster referenced by context `aks-cluster2-dev` with full cluster level privileges. Do you want to continue [y/N]? y

.
.
.
Cluster 'https://cluster2-dns-89d81b75.hcp.northcentralus.azmk8s.io:443' added

```
## Repository List

This command lists the repositories configured in the ArgoCD server. It provides information about each repository, such as name, URL, and connection status.

```sh
argocd repo list
```
output

```sh
TYPE  NAME  REPO                                                  INSECURE  OCI    LFS    CREDS  STATUS      MESSAGE  PROJECT
git         https://github.com/argoproj/argocd-example-apps.git   false     false  false  false  Successful           default
```

## Application List

This command lists all applications managed by ArgoCD. It displays information about each application, including its name, project, health status, and synchronization status.

```sh
argocd app list
```
output

```sh
NAME        CLUSTER                         NAMESPACE  PROJECT  STATUS     HEALTH       SYNCPOLICY  CONDITIONS  REPO                                                  PATH         TARGET
guestbook   https://kubernetes.default.svc  default    default  Synced     Healthy      <none>      <none>      https://github.com/argoproj/argocd-example-apps.git   guestbook    HEAD 
```

## App Resources

This command shows the Kubernetes resources associated with a specific application. It provides a detailed list of resources deployed by the application, including their types, names, and current status.

```sh
argocd app resources aspnetcore-webapp
```
output

```sh
time="2022-11-20T09:53:32-08:00" level=warning msg="Failed to invoke grpc call. Use flag --grpc-web in grpc calls. To avoid this warning message, 
use flag --grpc-web."
GROUP  KIND        NAMESPACE     NAME               ORPHANED
       Service     sample  aspnetcore-webapp  No      
apps   Deployment  sample  aspnetcore-webapp  No      
```

## Application Details

This command displays detailed information about a specific application. It shows information such as the application's project, repository, target revision, and synchronization status.

```sh
argocd app get aspnetcore-webapp
```
output
```sh
time="2022-11-20T09:54:28-08:00" level=warning msg="Failed to invoke grpc call. Use flag --grpc-web in grpc calls. To avoid this warning message, 
use flag --grpc-web."
time="2022-11-20T09:54:28-08:00" level=warning msg="Failed to invoke grpc call. Use flag --grpc-web in grpc calls. To avoid this warning message, 
use flag --grpc-web."
Name:               aspnetcore-webapp
Project:            development
Server:             https://kubernetes.default.svc
Namespace:          sample
URL:                https://yourdomainname.com/applications/aspnetcore-webapp
Repo:               https://dev.azure.com/keesari/microservices/_git/argocd
Target:             develop
Path:               sample/aspnetcore-webapp
SyncWindow:         Sync Allowed
Sync Policy:        Automated (Prune)
Sync Status:        Unknown
Health Status:      Healthy

CONDITION        MESSAGE                                                   LAST TRANSITION
ComparisonError  rpc error: code = Unknown desc = authentication required  2022-11-19 21:07:07 -0800 PST


GROUP  KIND        NAMESPACE     NAME               STATUS   HEALTH   HOOK  MESSAGE
       Service     sample  aspnetcore-webapp  Unknown  Healthy        service/aspnetcore-webapp unchanged
apps   Deployment  sample  aspnetcore-webapp  Unknown  Healthy        deployment.apps/aspnetcore-webapp configured
```

## Application Delete

 This command is used to delete a specific application managed by ArgoCD. It removes the application and all associated resources from the Kubernetes cluster.

```sh
argocd app delete guestbook
```

## Application sync

This command triggers a synchronization of a specific application with its target state. It ensures that the application's deployed resources match the desired state defined in the repository.

```sh
argocd app sync guestbook
```

## Project List

This command lists the projects defined in ArgoCD. It provides information about each project, such as name, description, and application count.

```sh
argocd proj list
```
output

```sh
NAME                DESCRIPTION                                       DESTINATIONS    SOURCES  CLUSTER-RESOURCE-WHITELIST  NAMESPACE-RESOURCE-BLACKLIST  SIGNATURE-KEYS  ORPHANED-RESOURCES
default                                                               *,*             *        */*                         <none>                        <none>          disabled
```

## Create Project

This command is used to create a new project in ArgoCD. It requires specifying the project name, optionally providing a description, and setting other project-specific configurations.

```sh
argocd proj create myproj
```


## Logout argocd

When you run argocd logout, ArgoCD will remove the session token that was saved when you logged in, so you will need to log in again with argocd login the next time you want to run any ArgoCD commands.

```sh
argocd logout 52.159.112.67
```
output

```sh
Logged out from '52.159.112.67'
```

These commands allow you to interact with ArgoCD, manage clusters, repositories, applications, projects, and perform various administrative tasks related to continuous deployment and GitOps workflows.


<!-- # Reference

- <https://argo-cd.readthedocs.io/en/release-1.8/user-guide/commands/argocd/>
 -->
