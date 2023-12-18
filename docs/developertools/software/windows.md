# Download & install Software in Windows OS

## Introduction

In this article, I am going to present a comprehensive list of essential tools and software commonly needed by developers in the IT industry. If you are using Window operating system, you can download and install the following software as per your requirements. It is recommended to use the choco tool for installation, but if you encounter any issues, you can also perform a direct install.

Note: - Restart your computer when prompted or needed.

## Install Chocolatey

We will be using Chocolatey commands to install all the required software and developer tools.

**What is Chocolatey?**

Chocolatey is a package manager for Windows that enables you to install, upgrade, and manage software packages from the command line. It functions similarly to package managers on Linux systems, such as apt or yum, and it can be utilized to install a wide range of software applications and libraries on Windows.

It is strongly recommended to use choco commands for searching and installing the required software instead of attempting manual installations using the provided links.

To use Chocolatey, you will need to have Windows PowerShell installed on your system. You can then install Chocolatey using a PowerShell command, and use it to install and manage packages from the command line.

**Install Chocolatey**

This is the first step you need to take before installing anything on the Windows OS.

To install Chocolatey on your Windows system, open a terminal window (such as PowerShell or Command Prompt) and run the following command:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

```
reference - [https://docs.chocolatey.org/en-us/choco/setup](https://docs.chocolatey.org/en-us/choco/setup){:target="_blank"}

Once the installation is finished, you can use the `choco` command to install, upgrade, and manage software packages using Chocolatey.

**Search choco commands** 

Use the following link, click on the search button, and start typing the required software. Copy the command provided into the clipboard, then open a PowerShell window in administrator mode to execute the commands.

 [https://community.chocolatey.org/](https://community.chocolatey.org/){:target="_blank"}

## Install VS code

It is the most commonly used IDE, It is widely used for programming and supports various languages with extensive customization options.

```sh
choco install vscode
```

verify the installation
```sh
code --help
```

## VS Code Extensions

After install VS code, install the following extensions in vs code as per the need:

```sh
Azure CLI Tools
Azure Account
Azure Kubernetes Services
Kubernetes
Azure Terraform
C#
Bridge to Kubernetes
Dev Containers
Remote Development
Docker
Dotnet
Helm Intelligence
vscode-helm
Kubernetes – very helpful for debugging services in AKS 
PostgreSQL - get this from Microsoft 
PowerShell Extension- https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell
```

## Install SQL server

SQL Server is a relational database management system developed by Microsoft. It allows you to store, manage, and retrieve structured data efficiently.

```
choco install sql-server-management-studio
```

## Install Chrome

Chrome is a popular web browser developed by Google. It provides a fast and secure browsing experience and supports various web technologies.

```
choco install googlechrome
```

## Install Node JS

Node.js is a JavaScript runtime that allows you to execute JavaScript code outside of a web browser.

```
choco install nodejs
```
```
node --version
```

## Install Git

Git is a version control system used for tracking changes in software projects. It allows multiple developers to collaborate on a project efficiently and helps manage different versions of the code.

```
choco install git
```
```
git --version
```

## Install Docker

Docker is a platform that simplifies the process of creating, deploying, and running applications using containers.

```
choco install docker-desktop
```

```
docker --version
```

## Install Azure CLI

Azure CLI is a command-line interface for managing and interacting with Microsoft Azure cloud services. It provides a convenient way to automate and control your Azure resources.

```sh
choco install azure-cli
```

```
az --version
```

## Install Terraform

Terraform is an infrastructure-as-code tool used for provisioning and managing cloud resources. It allows you to define your infrastructure in code and automates the deployment and management of resources across different cloud providers.

```sh
choco install terraform
```

```
terraform --version
```

## Install kubectl

kubectl is a command-line tool used to interact with Kubernetes clusters. It enables you to deploy, manage, and monitor applications running on Kubernetes.

```sh
choco install kubernetes-cli
```
For more information, please refer to the following link: - <https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/>

```
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

## Install Lens

Lens is a popular Kubernetes platform that serves as a robust and advanced development and management environment for Kubernetes clusters. It provides a comprehensive graphical user interface (GUI) that simplifies the management, monitoring, and interaction with Kubernetes resources and clusters.

```sh
choco install lens
```

## Install azure kubelogin

Azure Kubelogin is a tool that enables seamless authentication and access to Azure Kubernetes Service (AKS) clusters using your Azure credentials.

```sh
choco install azure-kubelogin
```

## Install Helm

Helm is a package manager for Kubernetes that simplifies the deployment and management of applications on Kubernetes clusters. It allows you to define and install applications using charts, which are packages of pre-configured Kubernetes resources.

```sh
choco install kubernetes-helm
```

## Install pgadmin4

pgAdmin is a graphical administration and development platform for PostgreSQL, a popular open-source relational database management system. It provides a user-friendly interface for managing databases, running queries, and monitoring server activity.

```sh
choco install pgadmin4
```

## Install argocd

Argo CD is a declarative, GitOps continuous delivery tool for Kubernetes.

```sh
choco install argocd
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

```sh
choco install rdcman
```

## Install Python

Python is a popular programming language known for its simplicity and versatility. It is widely used for web development, data analysis, and scripting tasks.

```
choco install python
```

## Install Pip

Pip is a package installer for Python. It allows you to easily install, upgrade, and manage Python packages and dependencies.

```
choco install pip
```
## Install WSL

Windows Subsystem for Linux (WSL) is a feature of Windows that allows developers to run a Linux environment without the need for a separate virtual machine or dual booting. 

```
choco install wsl
```

```
wsl --help
// or
wsl --list --verbose
```


## Install JQ

JQ is a lightweight and flexible command-line tool for processing JSON data. It provides various features to extract, manipulate, and transform JSON files efficiently.

```
choco install jq
```

## Postman

Postman is a popular API development and testing tool. It allows you to make HTTP requests, test APIs, and automate API workflows, making it easier to develop and debug APIs.

```sh
choco install postman
```


## Windows Terminal 

Allows us to access multiple command-line tools and shells in one customizable interface. It is an open-source project developed and maintained by Microsoft.

```sh
choco install microsoft-windows-terminal
``` 


After the installation quickly check to see the status of these installation by running version commands in PowerShell script or VS code terminal

For example:

```
PS C:\WINDOWS\system32> code --help
Visual Studio Code 1.71.2

PS C:\WINDOWS\system32> node --version
v14.16.0

PS C:\WINDOWS\system32> git --version
git version 2.29.2.windows.2

PS C:\WINDOWS\system32> docker --version
Docker version 20.10.17, build 100c701

PS C:\WINDOWS\system32> az --version
azure-cli                         2.38.0 *
…

PS C:\WINDOWS\system32> docker version
Client:
 Cloud integration: v1.0.24
 Version:           20.10.17
…

```

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
- SAML Tracer [Browser extention](https://chrome.google.com/webstore/detail/saml-tracer/mpdajninpobndbfcldcmbpnnbhibjmch?hl=en)
- WSL - https://learn.microsoft.com/en-us/windows/wsl/install>
- [Azure storage-explorer](https://azure.microsoft.com/en-us/products/storage/storage-explorer/)
- RDC - <https://learn.microsoft.com/en-us/sysinternals/downloads/rdcman>
- base64encode - <https://www.base64encode.org/>
- LightShot (prntscr) - https://app.prntscr.com/en/