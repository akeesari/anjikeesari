
## Introduction

In this article, I am going to present a comprehensive cheat sheet of commonly used **Helm** commands with examples.

Helm is a package manager for Kubernetes that helps you manage, install, and upgrade applications and services in a Kubernetes cluster.

## Basic Concepts

Having a recap of these Helm concepts will greatly assist you in following this article and understanding the Helm commands more easily.

- A **Helm chart** is a package containing all the necessary files, templates, and metadata required to describe and deploy an application on a Kubernetes cluster. 
- **Helm repositories** are locations where Helm charts are stored and can be accessed for installation. Helm supports both public and private repositories. Public repositories, such as the official Helm Hub, provide a wide range of community-contributed charts. Private repositories can be set up within organizations to distribute custom charts internally.
- -The **Helm Hub** is a centralized repository maintained by the Helm community. It serves as a catalog of Helm charts contributed by the community members. The Helm Hub provides a convenient way to discover and search for charts that you can use in your applications. You can find charts for various applications, databases, services, and more on the Helm Hub.
- A **Helm release** represents an instance of a chart deployed on a Kubernetes cluster. When you install a Helm chart, it creates a release with a unique name. Each release has its own set of resources, configuration values, and version history. Releases are managed by Helm, allowing you to upgrade, rollback, and delete them easily. Helm maintains a release history, allowing you to view and manage the different versions of a release.

## Prerequisites

- A Kubernetes cluster configured
- Helm package manager installed

## Installing Helm

Use the following commands to install Helm package manager in MacOS and Windows.

```sh
# MacOS (using Homebrew):
brew install helm

# Windows OS (using Choco)
choco install kubernetes-helm

#  verify the installation by running 
helm version
```

For more information, refer to the official Helm documentation:  - <https://helm.sh/docs/intro/install/>

## Azure login

Login into azure first.

``` sh
az login
az account list --output table

# Select the subscription
az account set -s "anji.keesari"

# Connect to Azure Kubernetes Service Cluster with User Role
az aks get-credentials -g "rg-rgname-dev" -n "aks-clustername-dev"

# Verify the cluster info
kubectl cluster-info
```

## Helm Version

See the installed version of Helm.

```sh
helm version
```

## Helm --help

Display the general help output for Helm

```sh
helm --help
helm [command] --help 

# examples
helm repo --help
helm repo list --help
```

<!-- # Showing Installed Helm Charts

List all installed Helm charts
To list all the installed Helm charts, use the following command:
helm ls -->

## Helm repositories

List the available Helm repositories. 

```sh
helm repo list
```
output

```sh
NAME                    URL
bitnami                 https://charts.bitnami.com/bitnami
runix                   https://helm.runix.net
ingress-nginx           https://kubernetes.github.io/ingress-nginx
jetstack                https://charts.jetstack.io
prometheus-community    https://prometheus-community.github.io/helm-charts
apache-solr             https://solr.apache.org/charts
azure-marketplace       https://marketplace.azurecr.io/helm/v1/repo
bitnami-azure           https://marketplace.azurecr.io/helm/v1/repo
```
Update list of Helm charts from repositories

```sh
helm repo update
```
output
```sh
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "ingress-nginx" chart repository
...Successfully got an update from the "jaegertracing" chart repository
...Successfully got an update from the "jetstack" chart repository
...Successfully got an update from the "runix" chart repository
...Successfully got an update from the "prometheus-community" chart repository
...Successfully got an update from the "apache-solr" chart repository
...Successfully got an update from the "azure-marketplace" chart repository
...Successfully got an update from the "bitnami-azure" chart repository
...Successfully got an update from the "bitnami" chart repository
```

## Search helm repo

`Helm search repo` searches the repositories that you have added to your local helm client (with helm repo add)


```sh
helm search <chart-name>
# Examples
helm search repo bitnami
helm search repo azure-marketplace
helm search repo wordpress
```

## Search Helm Hub

The `helm search hub` command allows you to search for Helm charts specifically in the official Helm Hub repository (Artifact Hub). The Helm Hub is a centralized repository of publicly available charts maintained by the Helm community.

```sh
helm search hub <chart-name>
# Examples
helm search hub hub
helm search hub bitnami
helm search hub microsoft
helm search hub wordpress 
helm search hub prometheus

```

## Add a repository 

Add a repository from the internet

```sh
helm repo add [repository-name] [url]
helm repo add bitnami https://charts.bitnami.com/bitnami
```
## Remove a repository 

Remove a repository from your system:

```sh
helm repo remove [repository-name]
helm repo remove bitnami
```

output
```sh
"bitnami" has been removed from your repositories
```


## List Installed Helm Charts

List Installed Helm Charts in default namespace

```sh
helm ls
```

output

```sh
NAME            NAMESPACE       REVISION        UPDATED                                 STATUS          CHART           APP VERSION
my-minio        default         1               2022-12-05 16:45:31.6927425 -0800 PST   deployed        minio-11.10.16  2022.11.11
```

List Installed Helm Charts from all namespace

```sh
helm ls -aA
```

output

```sh
NAME                                    NAMESPACE       REVISION        UPDATED                                 STATUS          CHART                                   APP VERSION
cert-manager                            cert-manager    1               2022-11-09 17:54:00.8093352 -0800 PST   deployed        cert-manager-v1.10.0                    v1.10.0
csi-secrets-store-provider-azure        kube-system     1               2022-12-09 16:37:01.010911 -0800 PST    deployed        csi-secrets-store-provider-azure-1.3.0  1.3.0
```

List Installed Helm Charts in specific namespace

```sh
helm ls -n cert-manager
```

output

```sh
NAME            NAMESPACE       REVISION        UPDATED                                 STATUS          CHART                   APP VERSION
cert-manager    cert-manager    1               2022-11-09 17:54:00.8093352 -0800 PST   deployed        cert-manager-v1.10.0    v1.10.0
```

## Install helm chart

The `helm install` command is used to deploy a chart onto a Kubernetes cluster. It takes a chart package as input and deploys the associated resources, such as pods, services, and config maps, to the cluster.

```sh
helm install <release-name> <chart>
```

- `<release-name>` is the name you choose for the release of the chart. It is used to uniquely identify the deployed resources.
- `<chart>` refers to the chart package or the path to the chart directory. This can be either a local chart or a chart from a remote repository.

**Install a chart from a remote repository:**

```sh
helm install my-release stable/mysql
```
This command installs the mysql chart from the stable repository with the release name my-release. It deploys the MySQL database to the cluster.

**Install a chart from a local directory:**

```sh
helm install my-release ./my-chart
```

This command installs a chart located in the my-chart directory with the release name my-release. It deploys the resources defined in the chart to the cluster.

**Install a chart with custom configuration values:**

```sh
helm install my-release stable/mysql --set mysqlRootPassword=secretpassword
```

**Install a release in a specific namespace:**

```sh
helm install -name release-name charts-name --namespace sample
```

**Override the default values** with those specified in a file of your choice:

```sh
helm install [app-name] [chart] --values [yaml-file/url]
helm install -name helm-release-name helm-charts --namespace sample --values helm-charts/values-dev.yaml
helm install -name helm-release-name helm-charts --namespace sample --values helm-charts/values-test.yaml
helm install -name helm-release-name helm-charts --namespace sample --values helm-charts/values-prod.yaml
```

**Run a test installation** to validate and verify the chart:

```sh
helm install [release-name] --dry-run --debug
```

## Uninstall helm chart

To uninstall a Helm chart and delete the associated resources from your Kubernetes cluster, you can use the helm uninstall command. 

```sh
helm uninstall [release]

# Example
helm uninstall helm-release-name -n sample
```


## Upgrading Helm Charts

To upgrade a Helm chart to a new version or with updated configuration, you can use the helm upgrade command. 

```sh
helm upgrade [release] [chart]
helm upgrade -name helm-release-name helm-charts --namespace sample
```

Instruct Helm to rollback changes if the upgrade fails:

```sh
helm upgrade [release] [chart] --atomic
```

Upgrade a release. If it does not exist on the system, install it:

```sh
helm upgrade [release] [chart] --install
```

Upgrade to a specified version:

```sh
helm upgrade [release] [chart] --version [version-number]

# first get the info
helm list --namespace sample

helm upgrade -name helm-release-name helm-charts --version 1.0.0 --namespace sample
```

## Rollback helm chart

The `helm rollback` command allows you to revert a failed or undesired Helm release upgrade to a previous version. This feature is especially useful when an upgrade introduces issues or unexpected behavior, enabling you to quickly restore the previous working state.


```sh

helm rollback [release] [revision]
# first list installed helm charts 
helm list --namespace sample
# rollback to specific version.
helm rollback -name helm-release-name 18 --namespace sample
```

## Release Monitoring

The helm list command enables listing releases in a Kubernetes cluster

List all available releases in the current namespace:

```sh
helm list

```

List all available releases across `all namespaces`:

```sh
helm ls -aA
helm list --all-namespaces
```
List all releases in a `specific namespace`:

```sh
helm list --namespace [namespace]
helm list --namespace sample
```
## helm status

See the `status` of a specific release:

```sh
helm status [release]
helm status argocd --namespace argocd
```

output

```sh
NAME: argocd
LAST DEPLOYED: Fri Jan 20 20:18:33 2023
NAMESPACE: argocd
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
In order to access the server UI you have the following options:

1. kubectl port-forward service/argocd-server -n argocd 8080:443

    and then open the browser on http://localhost:8080 and accept the certificate

2. enable ingress in the values file `server.ingress.enabled` and either
      - Add the annotation for ssl passthrough: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-1-ssl-passthrough
      - Set the `configs.params."server.insecure"` in the values file and terminate SSL at your ingress: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-2-multiple-ingress-objects-and-hosts


After reaching the UI the first time you can login with username: admin and the random password generated during the installation. You can find the password by running:

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

## Helm history

Display the release `history`

```sh
helm history [release]
helm history argocd --namespace argocd
```

output 
```
REVISION        UPDATED                         STATUS    CHART                                                                                                                                                   APP VERSION      DESCRIPTION
1               Fri Jan 20 20:18:33 2023        deployed  argo-cd-5.13.7                                                                                                                                          v2.5.2           Install complete
```


## Chart Management

Create new helm chart 

```sh
helm create my-chart
```

output

```sh
Creating my-chart
```
Run tests (**lint**) to examine a chart and identify possible issues:

```sh
helm lint my-chart
```
output
```sh
==> Linting my-charts
[INFO] Chart.yaml: icon is recommended

1 chart(s) linted, 0 chart(s) failed
```

Inspect a chart and list its **contents**:
```sh
helm show all my-chart
```
output

```sh
apiVersion: v2
appVersion: 1.0.0
description: A Helm chart for project1 projects for AKS cluster
name: helm-release-name
type: application
version: "20220823.12"
.
.
.
```


Display the chart’s **values**:
```sh
helm show values my-charts
```

**Download** a chart:

```sh
helm pull my-charts
```

Display a list of a chart’s **dependencies**:
```sh
helm dependency list my-charts
```

## Helm client environment

See information about the Helm client environment:

```sh
helm env
```

output
```
HELM_BIN="C:\ProgramData\chocolatey\lib\kubernetes-helm\tools\windows-amd64\helm.exe"
HELM_CACHE_HOME="C:\Users\ANJI~1.KEE\AppData\Local\Temp\helm"
HELM_CONFIG_HOME="C:\Users\anji.keesari\AppData\Roaming\helm"
HELM_DATA_HOME="C:\Users\anji.keesari\AppData\Roaming\helm"
HELM_DEBUG="false"
HELM_KUBEAPISERVER=""
HELM_KUBEASGROUPS=""
HELM_KUBEASUSER=""
HELM_KUBECAFILE=""
HELM_KUBECONTEXT=""
HELM_KUBETOKEN=""
HELM_MAX_HISTORY="10"
HELM_NAMESPACE="default"
HELM_PLUGINS="C:\Users\anji.keesari\AppData\Roaming\helm\plugins"
HELM_REGISTRY_CONFIG="C:\Users\anji.keesari\AppData\Roaming\helm\registry\config.json"
HELM_REPOSITORY_CACHE="C:\Users\ANJI~1.KEE\AppData\Local\Temp\helm\repository"
HELM_REPOSITORY_CONFIG="C:\Users\anji.keesari\AppData\Roaming\helm\repositories.yaml"
```

## Commands Summary

```
completion  generate autocompletion scripts for the specified shell
create      create a new chart with the given name
dependency  manage a chart's dependencies
env         helm client environment information
get         download extended information of a named release
help        Help about any command
history     fetch release history
install     install a chart
lint        examine a chart for possible issues
list        list releases
package     package a chart directory into a chart archive
plugin      install, list, or uninstall Helm plugins
pull        download a chart from a repository and (optionally) unpack it in local directory
push        push a chart to remote
registry    login to or logout from a registry
repo        add, list, remove, update, and index chart repositories
rollback    roll back a release to a previous revision
search      search for a keyword in charts
show        show information of a chart
status      display the status of the named release
template    locally render templates
test        run tests for a release
uninstall   uninstall a release
upgrade     upgrade a release
verify      verify that a chart at the given path has been signed and is valid
version     print the client version information
```

<!-- ## References
- <https://phoenixnap.com/kb/helm-commands-cheat-sheet>
- <https://github.com/RehanSaeed/Helm-Cheat-Sheet> -->
