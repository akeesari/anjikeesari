
# Terraform Commands

## Introduction

In this article, I am going to present a comprehensive cheat sheet of commonly used **Terraform** commands with examples.

Terraform is the infrastructure as code tool from HashiCorp. It is a tool for building, changing, and managing infrastructure in a safe, repeatable way.

<!-- ## Prerequisites

- A Kubernetes cluster configured
- Helm package manager installed -->

## Installing Terraform

Use the following commands to install Terraform in Windows, MacOS and Linux environments.

```sh
# MacOS (using Homebrew):
# First, install the HashiCorp tap
brew brew tap hashicorp/tap
# Now, install Terraform
brew install hashicorp/tap/terraform

# Windows OS (using choco)
choco install terraform


```
For more information, refer to the official documentation:  - [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)


## Upgrade Terraform

Use the following commands to upgrade Terraform in Windows

```sh
#  verify the installation by running 
terraform --version

# update to the latest version of Terraform in Mac OS
brew update
brew upgrade hashicorp/tap/terraform

# update to the latest version of Terraform in Windows OS
choco upgrade terraform
```

## terraform help

Displays general help information about Terraform, including a list of available commands and options.

```sh
terraform -h
# or
terraform --help

# Displays help information for a specific Terraform command
terraform <command> --help
terraform plan --help
terraform workspace --help
```

## terraform init

Initializes a Terraform working directory by downloading and configuring providers.

```sh
terraform init

# Forces Terraform to reconfigure the backend, even if it is already initialized.
terraform init -reconfigure

# Specifies a backend configuration file to use during initialization.
terraform init -backend-config="access_key=$(az storage account keys list --resource-group "rg-terraform-mgmt-poc" --account-name "sttfstatespoc01" --query '[0].value' -o tsv)"

# if you don’t want to hold a state lock during backend migration.
terraform init -lock=false 

#  user this to disable interactive prompts.
terraform init -input=false 
```

## terraform plan

Generates an execution plan, showing the changes that will be made without actually applying them.

```sh

terraform plan

# Saves the generated plan to a file named tfplan for later use.
terraform plan -out=tfplan

# Specifies a file containing variable values to be used during planning.
terraform plan -out=dev-plan -var-file="./environments/dev-variables.tfvars"

```
## terraform apply

Applies the changes required to reach the desired state defined in the Terraform configuration.

```sh
terraform apply

# Automatically approves and applies the changes without requiring manual confirmation.
terraform apply -auto-approve

# use this command to refresh the state for manual changes done from portal directly.
terraform apply -refresh-only -var-file="./environments/dev-variables.tfvars"

# applies the changes with planfilename
terraform apply poc-plan

terraform apply -lock=false
#  Do not hold a state lock during the Terraform apply operation. 
#  Use with caution if other engineers might run concurrent commands against the same workspace
```


## terraform destroy

Destroys the Terraform-managed infrastructure, terminating all resources defined in the Terraform configuration.

```sh
terraform destroy

# Destroy the infrastructure without having to interactively type ‘yes’ to the plan. Useful in automation CI/CD pipelines.
terraform destroy --auto-approve

terraform destroy -var-file="./environments/poc-variables.tfvars"

# Destroy an instance of a resource created with for_each.

terraform destroy -target="module.appgw.resource[\"key\"]" 

```


## terraform validate

Checks if the Terraform configuration files are valid and properly formatted.

```sh
terraform validate

# see errors and warnings that you have.
terraform validate -json
```
## terraform fmt

Automatically updates and formats the Terraform configuration files to follow the canonical format.

```sh
terraform fmt

# format files in subdirectories
terraform fmt --recursive

#  Display differences between original configuration files and formatting changes.
terraform fmt --diff
```

## terraform state
Manages Terraform's state, allowing you to inspect, modify, and manage the state file.

```sh
terraform state list

# Remove the specified instance from the state file
# Useful when a resource has been manually deleted outside of Terraform.
terraform state rm 'azurerm_logic_app_workflow.logic[\"1\"]'
terraform state rm 'azurerm_resource_group.rg' 
```
## terraform output

Displays the outputs defined in the Terraform configuration after applying the changes.

```sh

terraform output

# state file in JSON format 
terraform output -json
```

## terraform import

Imports existing infrastructure into Terraform state, allowing you to manage resources that were not created by Terraform.

```sh

# use this when the resource is created with for_each 
terraform import -var-file="./environments/dev-variables.tfvars" 'azurerm_resource_group.rg[\"3\"]' /subscriptions/342334ec-8a2e-4b7d-a886-e772dc017316/resourceGroups/rg-sitecore-dev

terraform import -var-file="./environments/dev-variables.tfvars" 'azurerm_resource_group.rg' '/subscriptions/dsaf2343-8a2e-4b7d-a886-e772dc017316/resourceGroups/rg-demo'


terraform import azurerm_resource_group.rg
```
## terraform workspace

Manages Terraform workspaces, allowing you to create, select, and delete different named workspaces.

```sh
# Creates a new Terraform workspace.
terraform workspace new dev

# Selects an existing Terraform workspace.
terraform workspace select prod

# Lists all available Terraform workspaces.
terraform workspace list

# Shows the currently selected Terraform workspace.
terraform workspace show

# Deletes an existing Terraform workspace.
terraform workspace delete dev
```

## terraform show

Show the state file in a human-readable format.

```sh
terraform show

terraform show <path to statefile> 
```

## terraform providers

Prints a tree of all available providers and their versions.

```sh
terraform providers

# Locks the provider versions in the Terraform configuration to ensure reproducible builds.
terraform providers lock

terraform providers init
terraform providers migrate
```

## terraform force-unlock

Remove the lock with the specified lock ID from your workspace. Useful when a lock has become ‘stuck’, usually after an incomplete Terraform run.


```sh
terraform force-unlock <lock_id> 
```

## terraform graph

 Produce a graph in DOT language showing the dependencies between objects in the state file. 

```sh
terraform graph
```