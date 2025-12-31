# Download & install Software in Windows OS

## Introduction

In this article, I am going to present a comprehensive list of essential tools and software commonly needed by developers in the IT industry. If you are using Windows operating system, you can download and install the following software as per your requirements. It is recommended to use the choco tool for installation, but if you encounter any issues, you can also perform a direct install.

!!! note
    Restart your computer when prompted or needed and also restart your terminal for every install before validating it.

## Install Chocolatey

We will be using Chocolatey commands to install all the required software and developer tools.

**What is Chocolatey?**

Chocolatey is a package manager for Windows that enables you to install, upgrade, and manage software packages from the command line.

It is strongly recommended to use choco commands for searching and installing the required software instead of attempting manual installations using the provided links.

To use Chocolatey, you will need to have Windows PowerShell installed on your system. You can then install Chocolatey using a PowerShell command, and use it to install and manage packages from the command line.

**Install Chocolatey**

This is the first step you need to take before installing anything on the Windows OS.

To install Chocolatey on your Windows system, open a terminal window (such as PowerShell or Command Prompt) and run as **Administrator** with the following command:

```sh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Reference - [https://docs.chocolatey.org/en-us/choco/setup](https://docs.chocolatey.org/en-us/choco/setup)

Verify the version installed
```sh
choco --version
```

Upgrading Chocolatey
```sh
choco upgrade chocolatey
```
## Install VS Code

It is the most commonly used IDE, It is widely used for programming and supports various languages with extensive customization options.

Open Command Prompt (cmd) or PowerShell as Administrator and run:

```sh
choco install vscode
```

Verify the installation

```sh
code --help

# or

code --version


# Check for the latest version (available via choco)

choco info vscode
```

Upgrade VS Code to the latest version

```sh
choco upgrade vscode -y
```

Note: 
  "Yes to all prompts" or "Automatically accept all confirmations."

## VS Code Extensions

After install VS Code, install the following extensions in VS Code as per the need.

You can install directly using the VS Code CLI:

```sh
code --install-extension ms-vscode.azurecli
# or
code --install-extension ms-vscode.azurecli --force

code --install-extension ms-vscode.azure-account
code --install-extension ms-kubernetes-tools.vscode-aks-tools
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension hashicorp.terraform
code --install-extension ms-dotnettools.csharp
code --install-extension microsoft.k8s-bridge-to-kubernetes
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension ms-azuretools.vscode-docker
code --install-extension formulahendry.dotnet
code --install-extension tht13.helm-intellisense
code --install-extension tim-koehler.vscode-helm
code --install-extension ms-vscode.mssql
code --install-extension ms-vscode.powershell
code --install-extension mongodb.mongodb-vscode

```

List All Installed Extensions

```sh
code --list-extensions
```


## Install Git

Git is a version control system used for tracking changes in software projects. It allows multiple developers to collaborate on a project efficiently and helps manage different versions of the code.

```sh
choco install git -y
```

Verify the installation:

```sh
git --version
```

Output:

```
git version 2.43.0.windows.1
```

Upgrade Git to the Latest Version

```sh
choco upgrade git -y
```

## Install Chrome

Chrome is a popular web browser developed by Google. It provides a fast and secure browsing experience and supports various web technologies.

```sh
choco install googlechrome  -y
```

Upgrade Google Chrome

```sh
choco upgrade googlechrome -y
```


## Install Node JS

Node.js is a JavaScript runtime that allows you to execute JavaScript code outside of a web browser.

```sh
choco install nodejs -y
```

```sh
node --version
# or
node -v
npm -v
```

Upgrade Node.js

```sh
choco upgrade nodejs -y
```

## Install Docker

Docker is a platform that simplifies the process of creating, deploying, and running applications using containers.

```sh
choco install docker-desktop -y
```

```sh
docker --version
docker compose version
```

Upgrade Docker Desktop

```sh
choco upgrade docker-desktop -y
```

## Install Azure CLI

Azure CLI is a command-line interface for managing and interacting with Microsoft Azure cloud services. It provides a convenient way to automate and control your Azure resources.

```sh
choco install azure-cli -y
```

Verify the installation:

```sh
az --version
```

Output:

```
azure-cli                         2.54.0
core                              2.54.0
telemetry                          1.1.0
```

Upgrade Azure CLI

```sh
choco upgrade azure-cli -y
```

Useful Commands

```sh
az account list --output table
az account show
az --help
```


## Install Terraform

Terraform is an infrastructure-as-code tool used for provisioning and managing cloud resources. It allows you to define your infrastructure in code and automates the deployment and management of resources across different cloud providers.

```sh
choco install terraform -y
```

```sh
terraform --version
```

Upgrade Terraform

```sh
choco upgrade terraform -y
```


```sh
terraform -help
```


## Install kubectl

kubectl is a command-line tool used to interact with Kubernetes clusters. It enables you to deploy, manage, and monitor applications running on Kubernetes.

```sh
choco install kubernetes-cli
```
For more information, please refer to the following link: - <https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/>

```sh
# Test to ensure the version you installed is up-to-date:
kubectl version
kubectl version --client

# use this for detailed view of version:
kubectl version --client --output=yaml

or 
kubectl version --output=json

#Verify kubectl configuration
kubectl cluster-info

```

Upgrade kubectl

```sh
choco upgrade kubernetes-cli -y
```

## Install Lens

Lens is a popular Kubernetes platform that serves as a robust and advanced development and management environment for Kubernetes clusters. It provides a comprehensive graphical user interface (GUI) that simplifies the management, monitoring, and interaction with Kubernetes resources and clusters.

```sh
choco install lens
```

```sh
lens --version
```

Upgrade Lens

```sh
choco upgrade lens -y
```


## Install azure kubelogin

Azure Kubelogin is a tool that enables seamless authentication and access to Azure Kubernetes Service (AKS) clusters using your Azure credentials.

```sh
choco install azure-kubelogin -y
```

Verify the installation:

```sh
kubelogin --version
```

Upgrade Azure Kubelogin:

```sh
choco upgrade azure-kubelogin -y
```

## Install Helm

Helm is a package manager for Kubernetes that simplifies the deployment and management of applications on Kubernetes clusters. It allows you to define and install applications using charts, which are packages of pre-configured Kubernetes resources.

```sh
choco install kubernetes-helm -y
```

```sh
helm version
```

```sh
choco upgrade kubernetes-helm -y
```

## Install pgadmin4

pgAdmin is a graphical administration and development platform for PostgreSQL, a popular open-source relational database management system. It provides a user-friendly interface for managing databases, running queries, and monitoring server activity.

```sh
choco install pgadmin4 -y
```

Upgrade pgAdmin 4

```sh
choco upgrade pgadmin4 -y
```
## Install PostgreSQL

To install PostgreSQL, you can use Chocolatey by running the following command from the command line or PowerShell:


```sh
choco install postgresql -y
```

Alternatively, you can choose to use the graphical installation wizard for PostgreSQL on Windows.

[Downloading PostgreSQL](https://www.enterprisedb.com/software-downloads-postgres)

Follow the installation wizard instructions to complete the PostgreSQL installation on your Windows system.

!!! note
    Depending on your requirements, you may want to uncheck the option for `Stack Builder` during the installation process.

**psql - Command-line tools**

By default, the installer does not modify the system path. If you wish to use command-line tools like `psql`, you will need to manually add PostgreSQL to your system's  path after installation.

**Update Environment Variables**

To update the system path and include PostgreSQL in it, add the following directory to your PATH variable:

```sh
C:\Program Files\PostgreSQL\16\bin
```
Make sure to replace 16 with your specific PostgreSQL version if it differs.

!!! note
    System restart is needed after the installation

verify the psql installation


```sh
psql --version

#output
psql (PostgreSQL) 16.1
```
## Install argocd

Argo CD is a declarative, GitOps continuous delivery tool for Kubernetes.

```sh
choco install argocd -y
```

```sh
argocd version

# output
argocd: v2.4.7+81630e6
  BuildDate: 2022-07-18T21:49:23Z
  GitCommit: 81630e6d5075ac53ac60457b51343c2a09a666f4
  GitTreeState: clean
  GoVersion: go1.18.3
  Compiler: gc
  Platform: windows/amd64
argocd-server: v2.5.2+148d8da
```

Upgrade Argo CD

```sh
choco upgrade argocd -y
```

## Install SQL server

SQL Server is a relational database management system developed by Microsoft. It allows you to store, manage, and retrieve structured data efficiently.

```sh
choco install sql-server-management-studio
```

## Install Azure Data Studio

Azure Data Studio is a cross-platform database tool for data professionals using the Microsoft family of on-premises and cloud data platforms on Windows, MacOS, and Linux.

```sh
choco install azure-data-studio
```

## Azure Storage Explorer

Azure Storage Explorer is a standalone application provided by Microsoft that allows users to interact Azure storage account services and making it easier to work with Azure Blob Storage, Azure Queue Storage, Azure Table Storage, and Azure Cosmos DB.

```sh
choco install microsoftazurestorageexplorer
```

## Install RDCMan

RDCMan, short for Remote Desktop Connection Manager, is a free Microsoft Windows utility used to manage multiple remote desktop connections from a single application. It is particularly useful to connect and manage multiple remote servers, workstations, or virtual machines.

**Key Features**

*   Group RDP sessions for easy organization    
*   Save credentials per group or server    
*   Automatically reconnect dropped sessions    
*   Session-wide actions like log off, disconnect, or reconnect    
*   Custom display resolution and settings for individual servers

Option 1: Install via Chocolatey 

```sh
choco install remote-desktop-connection-manager

# To upgrade:
choco upgrade remote-desktop-connection-manager
```

 Option 2: Manual Installation

**Download RDCMan** from the official Microsoft site or trusted repository:
*   [Microsoft RDCMan Download Page](https://learn.microsoft.com/en-us/sysinternals/downloads/rdcman)


## mRemoteNG

**mRemoteNG** (multi-Remote Next Generation) is an open-source. It supports multiple remote connection protocols, making it a powerful alternative to RDCMan with broader capabilities.   

**Key Features**

*   Tabbed interface for managing multiple sessions    
*   Support for a wide range of protocols - RDP, VNC, SSH, Telnet, ICA, HTTP/HTTPS, RLogin, Raw Socket   
*   Credential inheritance and secure storage    
*   Connection tree and grouping for organization    
*   Import/Export of configuration files
    

Option 1: Install via Chocolatey (Recommended)

```sh
choco install mremoteng
    
# To upgrade
choco upgrade mremoteng
```    
Option 2: Manual Installation

**Download Installer** from the official site:
    *   [https://mremoteng.org/download](https://mremoteng.org/download)
        
## Install dotnet

Microsoft .NET 8.0 Runtime 8.0.10

```sh
choco install dotnet-8.0-runtime
```

Microsoft .NET 8.0 SDK 8.0.403

```sh
choco install dotnet-8.0-sdk
# verify the installation
dotnet --version
```

## Install Python

Python is a popular programming language known for its simplicity and versatility. It is widely used for web development, data analysis, and scripting tasks.

```sh
choco install python
```

Verify the installation:

```sh
python --version
```

Upgrade Python:

```sh
choco upgrade python -y
```

## Verify Pip installation

```sh
pip --version
```

Output:

```
pip 23.3.1 from C:\Python312\lib\site-packages\pip (python 3.12)
```

## Install WSL

Windows Subsystem for Linux (WSL) is a feature of Windows that allows developers to run a Linux environment without the need for a separate virtual machine or dual booting. 

```sh
choco install wsl
```

```sh
wsl --help
# or
wsl --list --verbose
```

Update WSL

```sh
wsl --update
```

## Install Ubunto

Ubuntu on Windows via WSL (Windows Subsystem for Linux) is incredibly useful — it gives you the power of Linux without leaving Windows.

install Ubuntu

```sh
wsl --install -d Ubuntu
```

Check WSL Version

```sh
wsl --list --verbose

```

## Install Ansible

Ansible is an open-source automation tool used for configuring systems, deploying software, and orchestrating IT infrastructure. It uses simple, human-readable YAML files (called playbooks) and requires no agents on managed machines.

install Ansible easily on Ubuntu (on WSL or native Linux)



```sh
# Step 1: Update your package list
sudo apt update
# Step 2: Install required dependencies
sudo apt install -y software-properties-common
# Step 3: Add the official Ansible PPA (Personal Package Archive)
sudo add-apt-repository --yes --update ppa:ansible/ansible
# Step 4: Install Ansible
sudo apt install -y ansible
# Step 5: Verify the installation
ansible --version
```

Test Ansible with a Simple Command

```sh
ansible localhost -m ping

# If it's working, you’ll see:
localhost | SUCCESS => {
    "changed": false,
    "ping": "pong"
}

```

## Install JQ

JQ is a lightweight and flexible command-line tool for processing JSON data. It provides various features to extract, manipulate, and transform JSON files efficiently.

```sh
choco install jq
```

Verify the installation:

```sh
jq --version
```

Upgrade JQ:

```sh
choco upgrade jq -y
```

## Install MongoDB Compass

Install MongoDB Compass using Chocolatey
```sh
choco install mongodb-compass -y
```
Check MongoDB Version

```sh
mongod --version
```

```sh
choco upgrade mongodb-compass -y
```
## Install Postman

Postman is a popular API development and testing tool. It allows you to make HTTP requests, test APIs, and automate API workflows, making it easier to develop and debug APIs.

```sh
choco install postman -y
```

Upgrade Postman
```sh
choco upgrade postman -y
```

## Install Notepad++

```sh
choco install notepadplusplus -y
```

Verify Installation:

```sh
notepad++
```

Upgrade Notepad++:

```sh
choco upgrade notepadplusplus -y
```

## Windows Terminal 

Allows us to access multiple command-line tools and shells in one customizable interface. It is an open-source project developed and maintained by Microsoft.

```sh
choco install microsoft-windows-terminal -y
```

Upgrade Windows Terminal:

```sh
choco upgrade microsoft-windows-terminal -y
``` 

## Install Lightshot

Lightshot is a free program that offers a quick and easy way to capture a screen including basic editing tools. 

I don't see brew commands to install this tool but you can install it manually from here:

 [Lightshot downloads](https://app.prntscr.com/en/download.html){:target="_blank"}

 _____


## Manual Install

If you would prefer to install manually then here is the same list of software you can download and Install them manually

- Visual studio code (recommended) - <https://code.visualstudio.com/download/>
- Visual studio (optional) - <https://visualstudio.microsoft.com/downloads/>
- SQL Server Management Studio (optional) - <https://www.microsoft.com/en-us/sql-server/sql-server-downloads>
- Notepad++ - <https://notepad-plus-plus.org/downloads/>
- Google Chrome – search in google for later version of Google Chrome and download & install it
- Node JS - <https://nodejs.org/en/download/>
- Git - <https://git-scm.com/download/win>
- Docker desktop - <https://docs.docker.com/desktop/install/windows-install/>


## Additional Software

You may need these additional software to perform daily activities.

- Zoom - <https://zoom.us/download>
- Teams - <https://www.microsoft.com/en-us/microsoft-teams/download-app>
- WhatsApp - <https://www.whatsapp.com/download>
- SQL Search - <https://www.red-gate.com/products/sql-development/sql-search/>
- JSON viewer online - <https://codebeautify.org/jsonviewer>
- regexr validator - <https://regexr.com/>
- SAML Tracer [Browser extension](https://chrome.google.com/webstore/detail/saml-tracer/mpdajninpobndbfcldcmbpnnbhibjmch?hl=en)
- WSL - <https://learn.microsoft.com/en-us/windows/wsl/install>
- [Azure storage-explorer](https://azure.microsoft.com/en-us/products/storage/storage-explorer/)
- RDC - <https://learn.microsoft.com/en-us/sysinternals/downloads/rdcman>
- base64encode - <https://www.base64encode.org/>
- LightShot (prntscr) - <https://app.prntscr.com/en/>

## Troubleshooting

### Common Installation Issues

**Chocolatey Permission Errors**

If you encounter permission errors, ensure you're running PowerShell or Command Prompt as Administrator:

1. Right-click PowerShell/CMD
2. Select "Run as Administrator"
3. Run the installation command again

**Path/Environment Variable Issues**

If installed tools are not recognized:

```sh
# Refresh environment variables in current session
refreshenv

# Or restart your terminal
```

**Version Conflicts**

To check installed versions and resolve conflicts:

```sh
# List all installed packages
choco list --local-only

# Force reinstall a package
choco install <package> --force -y
```

**Network/Proxy Issues**

If downloads fail due to network restrictions:

```sh
# Set proxy for Chocolatey
choco config set proxy <proxy-url>
choco config set proxyUser <username>
choco config set proxyPassword <password>
```

### Additional Resources

- [Chocolatey Documentation](https://docs.chocolatey.org/)
- [Troubleshooting Guide](https://docs.chocolatey.org/en-us/troubleshooting)
- [Network Tools](../tools/network-tools.md)
- [Kubectl Cheat Sheet](../cheatsheets/kubectl-cheat-sheet.md)
- [Docker Cheat Sheet](../cheatsheets/docker-cheat-sheet.md)
- [Helm Cheat Sheet](../cheatsheets/helm-cheat-sheet.md)
- [Terraform Cheat Sheet](../cheatsheets/terraform-cheat-sheet.md)