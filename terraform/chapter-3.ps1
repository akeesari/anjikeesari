# Chapter 3: Install and Setup Terraform Locally

<!-- # Chapter 3: Install and setup terraform to create your first Azure resource -->


In the previous chapter, we introduced you to Terraform and explored its fundamental concepts. Now, it's time to roll up our sleeves and get our hands on Terraform by setting it up on your local development environment. In this chapter, we will walk you through the installation and configuration process, ensuring that you have everything you need to start provisioning Azure resources using Terraform.


## Downloading Terraform

To begin the installation process, you need to download the Terraform binary for your operating system. 

1. **Visit the Official Terraform Website:** Open your web browser and navigate to the [official Terraform website](https://www.terraform.io/downloads.html).

2. **Select Your Operating System:** On the downloads page, select your operating system from the available options (e.g., Windows, macOS, Linux).

3. **Download the Latest Version:** Click on the download link to fetch the latest version of Terraform for your OS.

With Terraform downloaded, it's time to move on to the installation process.

## Installing Terraform

The installation steps vary depending on your operating system. Follow the instructions relevant to your operating system below:

Here's are the installation steps for Terraform on Windows, macOS, and Linux:

**For Windows:**

1. Download Terraform for Windows from the [Terraform Downloads page](https://www.terraform.io/downloads.html).

2. Extract the downloaded ZIP file to a folder.

3. Add the folder containing "terraform.exe" to your system's PATH.

4. Open a command prompt or PowerShell window and run `terraform --version` to confirm the installation.

**For macOS:**

1. Download Terraform for macOS from the [Terraform Downloads page](https://www.terraform.io/downloads.html).

2. Extract the downloaded ZIP file in the Terminal.

3. Move the "terraform" binary to a directory in your system's PATH, such as "/usr/local/bin."

4. Open a new Terminal window and run `terraform --version` to confirm the installation.

**For Linux (Ubuntu/Debian):**

1. Download Terraform for Linux from the [Terraform Downloads page](https://www.terraform.io/downloads.html).

2. Extract the downloaded ZIP file in the Terminal.

3. Move the "terraform" binary to a directory in your system's PATH, such as "/usr/local/bin."

4. Open a new Terminal window and run `terraform --version` to confirm the installation.

## Create your first Azrue resource using terraform


Creating your first Azure resource using Terraform can be a great way to get started with infrastructure as code (IaC). Here are step-by-step instructions for complete beginners on how to create an Azure Resource Group using Terraform:


**Prerequisites:**

- Azure Account: you can sign up for a free Azure account on the [Azure website](https://azure.com).
- Azure CLI Tool: You'll need a command-line interface to execute Terraform commands.
- Terraform Installed: Make sure that terraform is installed in your system. 


### Step 1: Authenticate using the Azure CLI

1. Open a terminal or command prompt on your computer.

2. Run the following command to log in to your Azure account:
   ```
   az login
   ```
   This command will open a web page where you can enter your Azure credentials. Follow the prompts to complete the login process.


### Step 2: Create a Directory for Your terraform project

Create a new directory for your Terraform project. You can do this with the following command:

```bash
mkdir my-terraform-project
cd my-terraform-project
```

### Step 3: Create a Service Principal

1. A Service Principal is required to allow Terraform to interact with Azure resources securely. You can create one using the Azure CLI.

2. Run the following command to create a Service Principal:
   ```sh
   az ad sp create-for-rbac --name TerraformServicePrincipal --role Contributor --scopes /subscriptions/{your-subscription-id}
   ```
   Replace `{your-subscription-id}` with your Azure subscription ID.

3. After running the command, you will receive a JSON response containing information about the Service Principal. Make note of the following values:
      - `appId` (Client ID)
      - `password` (Client Secret)
      - `tenant` (Tenant ID)

### Step 4: Set your environment variables

1. In your terminal or command prompt, set the following environment variables using the values from the Service Principal you created. Replace the placeholders with your actual values:
   ```sh
   export ARM_CLIENT_ID={appId}
   export ARM_CLIENT_SECRET={password}
   export ARM_SUBSCRIPTION_ID={your-subscription-id}
   export ARM_TENANT_ID={tenant}
   ```

   Alternatively, you can add these environment variables to a `.env` file in your Terraform project directory.

### Step 4: Write Terraform configuration for Azure resource group

1. Inside your project directory, create a file named `main.tf` using a text editor of your choice.

2. In `main.tf`, define your Azure resource group configuration using Terraform's HashiCorp Configuration Language (HCL). For example:
   ```hcl
    # Configure the Azure provider
    terraform {
      required_providers {
        azurerm = {
          source  = "hashicorp/azurerm"
          version = "~> 3.0.2"
        }
      }

      required_version = ">= 1.1.0"
    }

    provider "azurerm" {
      features {}
    }

    resource "azurerm_resource_group" "rg" {
      name     = "myTFResourceGroup"
      location = "westus2"
    }
   ```
   This configuration creates an Azure resource group named "example-resources" in the "East US" region.

Let me explain the key components of a Terraform configuration file:

**Terraform Block:**
   
   - The `terraform` block is used to specify the configuration settings for Terraform itself. It is typically placed at the beginning of your Terraform configuration file (e.g., `main.tf`).
   - Inside the `terraform` block, you can set various configurations such as the required Terraform version, backend configuration (where to store state files), and other global settings.
   - Example of a `terraform` block:

   ```sh
   terraform {
     required_version = ">= 0.14"
     backend "azurerm" {
       resource_group_name   = "my-terraform-state"
       storage_account_name  = "mytfstatestorage"
       container_name        = "tfstate"
       key                   = "terraform.tfstate"
     }
   }
   ```

**Providers Block:**

   - The `providers` block is used to define the cloud or infrastructure provider that Terraform will use to manage resources. Terraform supports multiple providers, including AWS, Azure, Google Cloud, and more.
   - You specify the provider type (e.g., `azurerm` for Azure) and configure its settings, including authentication credentials.
   - Example of a `providers` block for Azure:

   ```sh
   provider "azurerm" {
     features {}
   }
   ```

**Resource Block:**

   - The `resource` block is where you define the infrastructure resources you want to create and manage using Terraform. These resources can be virtual machines, databases, networks, or any other resource supported by the chosen provider.
   - Each `resource` block has a resource type (e.g., `azurerm_virtual_machine` for an Azure virtual machine) and a unique name for that resource instance.
   - You specify the configuration details for the resource within the block, such as its name, location, size, and other properties.
   - Example of a `resource` block for an Azure Resource Group:

   ```sh
   resource "azurerm_resource_group" "example" {
     name     = "my-resource-group"
     location = "East US"
   }
   ```

### Step 5: Initialize your Terraform configuration

1. In your terminal or command prompt, navigate to the directory containing `main.tf`.

2. Run the following command to initialize your Terraform project and download necessary provider plugins:
```sh
terraform init
```

### Step 6: Format and validate the configuration

1. To ensure consistent formatting of your Terraform configuration, run the following command:
```sh
terraform fmt
```

2. To check for syntax errors and configuration issues, use the following command:
```sh
terraform validate
```

### Step 7: Apply your Terraform Configuration

1. To preview the changes defined in your Terraform configuration, run:
```sh
terraform plan
```

2. Review the proposed changes in the output.

3. To apply the changes and create the Azure resource group, run:
```sh
terraform apply
```

4. Confirm the action by entering "yes" when prompted.

### Step 8: Inspect your state

1. Terraform maintains a state file that tracks the state of your infrastructure. To view the current state, run:
```sh
terraform show
```

2. To list all resources in the state, run:
```sh
terraform state list
```

3. To show details of a specific resource, use the following command (replace `{resource-name}` with the actual resource name):
```bash
terraform state show azurerm_resource_group.example
```


### Step 9: Clean Up (Optional)

If you want to delete the resource group and all the resources created by Terraform, you can run:

```bash
terraform destroy
```

Confirm with "yes" when prompted.

Congratulations! You've successfully created your first Azure resource group using Terraform. You can expand your Terraform configuration to manage additional Azure resources as needed.

## Conclusion

In this chapter, you've learned the importance of installing Terraform locally for your Azure Infrastructure as Code (IaC) journey. We've covered the prerequisites, downloading the Terraform binary, and installation steps for Windows, macOS, and Linux. With Terraform now installed, you're one step closer to automating the provisioning and management of Azure resources from your development machine.

We've also introduced the concept of Terraform configuration and created your first azure resource and demonstrated how to create a basic configuration file for an Azure project.



