# Azure ACR Commands
## Introduction

The `az acr` commands are used for managing private registries with Azure Container Registries.

This page contains a list of commonly used `az acr` commands.

**Note:** Make sure that you log in to Azure and select the Azure subscription before running any `az acr` commands.

## Azure Login

```bash
az login
az account list --output table
```

## Select the Subscription

```bash
az account set -s "anji.keesari"
az account show --output table
```

## Connect to Container Registry

```bash
az acr login --name myregistry
```

Output:

```bash
Login Succeeded
```

**Troubleshoot:**

If you get the following error, run Docker Desktop to fix the issue:

```bashbash
You may want to use 'az acr login -n myregistry --expose-token' to get an access token, which does not require Docker to be installed.
2023-02-20 21:38:37.187022 An error occurred: DOCKER_COMMAND_ERROR
error during connect: This error may indicate that the docker daemon is not running.: Get "http://%2F%2F.%2Fpipe%2Fdocker_engine/v1.24/containers/json": open //./pipe/docker_engine: The system cannot find the file specified.
```

## Get the Login Server Address

```bashbash
az acr list -g "rg-acr-dev" --query "[].{acrLoginServer:loginServer}" --output table
```

Output:

```bash
AcrLoginServer
-----------------------
myregistry.azurecr.io
```


## Import Container Images

```powershell
$acrName = "myregistry"
$imageName = "mcr.microsoft.com/dotnet/aspnet:6.0"

az acr import --name $acrName --source $imageName --image $imageName
```

Or using direct parameters:

```bash
az acr import --name "myregistry" --source "mcr.microsoft.com/dotnet/sdk:6.0" --image "mcr.microsoft.com/dotnet/sdk:6.0"
```

## List Registries

Lists all the container registries under the current subscription.

```bash
az acr repository list --name myregistry --output table
```

Output:

```bash
Result
-------------------------------
mcr.microsoft.com/dotnet/aspnet
mcr.microsoft.com/dotnet/sdk
```
## Show Tags

Show tags of an image in the ACR.

```bash
az acr repository show-tags --name myregistry --repository mcr.microsoft.com/dotnet/aspnet --output table
```

Output:

```bash
Result
--------
6.0
```

## Check Health

```bash
az acr check-health -n "myregistry" -y
```

Output:

```bash
Docker daemon status: available
Docker version: 'Docker version 20.10.17, build a89b842, platform linux/amd64'
Docker pull of 'mcr.microsoft.com/mcr/hello-world:latest' : OK
Azure CLI version: 2.44.1
DNS lookup to myregistry.azurecr.io at IP 20.0.0.10 : OK
Challenge endpoint https://myregistry.azurecr.io/v2/ : OK
Fetch refresh token for registry 'myregistry.azurecr.io' : OK
Fetch access token for registry 'myregistry.azurecr.io' : OK
Helm version: 3.8.2
2023-02-20 21:58:29.062713 An error occurred: NOTARY_COMMAND_ERROR
Please verify if notary is installed.

Please refer to https://aka.ms/acr/errors#notary_command_error for more information.
```

## Helm List

List all Helm charts in an Azure Container Registry.

```bash
az acr helm list -n 'myregistry'
```

## References

- [Azure ACR CLI Reference](https://learn.microsoft.com/en-us/cli/azure/acr?view=azure-cli-latest)

