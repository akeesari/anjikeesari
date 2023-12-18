# Download & install Software in Mac OS

## Introduction

In this article, I am going to present a comprehensive list of essential tools and software commonly needed by developers in the IT industry. If you are using Mac operating system, you can download and install the following software as per your requirements. It is recommended to use the `brew` tool for installation, but if you encounter any issues, you can also perform a direct manual install.


## What is Homebrew?

Homebrew is a free and open-source software package management system that simplifies the installation of software on Apple's operating system, macOS, as well as Linux. 

## Install homebrew

This is the first software you may need to install before installing anything on a Mac. For more information, refer to this link: <https://brew.sh/>

Homebrew is similar to Chocolatey in the Windows environment.

homebrew (for Mac users) = cocho (for Windows users)

To use Homebrew, you will need to have a terminal window open and install Homebrew on your system. To install Homebrew, you can copy and paste the following command into the terminal:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

output

``` 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/anjikeesari/.zprofile   
eval "$(/opt/homebrew/bin/brew shellenv)"  
```
upgrade brew

``` 
brew upgrade 
```
```bash
brew --version
```
Once the installation is finished, you can use the `brew` command to install, upgrade, and manage software packages using Homebrew.


## Install Google Chrome 

```sh
brew install --cask google-chrome
```

## Install iTerm2 

iTerm2 is a popular terminal emulator for macOS. It provides a more advanced and feature-rich interface for working with the command line.

```sh
brew install --cask iterm2
```

## Install PowerShell

PowerShell is a command-line shell and scripting language developed by Microsoft. It allows you to automate tasks and manage your computer system efficiently.

``` 
# install
brew install --cask powershell

# upgrade
brew upgrade --cask powershell
```

## Install vs code

It is the most commonly used IDE,  It is widely used for programming and supports various languages with extensive customization options.

```
brew install --cask visual-studio-code
```

## Install git

Git is a version control system used for tracking changes in software projects. It allows multiple developers to collaborate on a project efficiently and helps manage different versions of the code.

```
brew install git  
git --version    
```
## Install docker

Docker is a platform that simplifies the process of creating, deploying, and running applications using containers. 

```
brew install docker --cask
docker --version

# outpu
Docker version 20.10.21, build baeda1f
```
## Install node

Node.js is a JavaScript runtime that allows you to execute JavaScript code outside of a web browser.

```
brew install node
node --version  
npm version
```

## Install dotnet

It provides a runtime environment and libraries for building and running different types of applications, especially those developed using the C# programming language. 

```
brew install --cask dotnet
```

## Install python3

Python is a popular programming language known for its simplicity and versatility. Installing Python 3 refers to setting up the latest version of Python on your system for development purposes.

```
brew install python3
python3 --version
```

## Upgrade pip
```
pip3 install --upgrade pip

```
##  Install mkdocs
```sh
pip3 install mkdocs
pip3 install mkdocs-material
pip3 install mkdocs-material-extensions
```
## Install azure-cli

Azure CLI is a command-line interface for managing and interacting with Microsoft Azure cloud services. It provides a convenient way to automate and control your Azure resources.

```
brew install azure-cli
```

## Install kubectl

 kubectl is a command-line tool used to interact with Kubernetes clusters. It enables you to deploy, manage, and monitor applications running on Kubernetes.

For more information, please refer to the following link: - - <https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/>

```sh
brew install kubectl

# verify the installation
kubectl version 
```

## Install Lens

Lens is a popular Kubernetes platform that serves as a robust and advanced development and management environment for Kubernetes clusters. It provides a comprehensive graphical user interface (GUI) that simplifies the management, monitoring, and interaction with Kubernetes resources and clusters.

```sh
brew install --cask lens
```

## Install Terraform

Terraform is an infrastructure-as-code tool used for provisioning and managing cloud resources. It allows you to define your infrastructure in code and automates the deployment and management of resources across different cloud providers.

```
brew install terraform
```

```
terraform version
```

## Install Helm

Helm is a package manager for Kubernetes that simplifies the deployment and management of applications on Kubernetes clusters. It allows you to define and install applications using charts, which are packages of pre-configured Kubernetes resources.

```
brew install helm
```
```
helm version
```

## Install argocd

Argo CD is a declarative, GitOps continuous delivery tool for Kubernetes.

```
brew install argocd
```
```
argocd version
```

## Install pgadmin4

pgAdmin is a graphical administration and development platform for PostgreSQL, a popular open-source relational database management system. It provides a user-friendly interface for managing databases, running queries, and monitoring server activity.

```sh
brew install pgadmin4
```

## Install Azure Data Studio

Data management tool that enables working with SQL Server, PostgerSQL, MySQL and more.

```sh
brew install --cask azure-data-studio
```
## Azure Storage Explorer

Azure Storage Explorer is a standalone application provided by Microsoft that allows users to interact Azure storage account services and making it easier to work with Azure Blob Storage, Azure Queue Storage, Azure Table Storage, and Azure Cosmos DB.

```sh
brew install --cask microsoft-azure-storage-explorer
```
## Install Microsoft Remote Desktop

Microsoft Remote Desktop is a Microsoft application that allows users to remotely access and control Windows-based computers or virtual machines from other devices.


```sh
brew install --cask microsoft-remote-desktop
```

## Install zoom

Zoom is a video conferencing and online meeting platform that enables you to communicate with others through video, audio, and chat. It's widely used for remote work and virtual meetings.

```
brew install --cask zoom
```

## Install Teams

Teams is a collaboration platform developed by Microsoft. It offers features such as chat, video meetings, file sharing, and integration with other Microsoft services to facilitate teamwork and communication.

```sh
# install
brew install --cask microsoft-teams

# uninstall teams, it will ask the Mac login password for any software uninstall.
brew uninstall microsoft-teams
```
## Install WhatsApp

Native desktop client for WhatsApp

```sh
brew install --cask whatsapp
```

## Install .NET 7 SDK for Mac

The .NET SDK (Software Development Kit) is a set of tools and libraries provided by Microsoft for building applications using the .NET framework. Installing the .NET 7 SDK specifically refers to setting up the latest version of the .NET framework for Mac development.


Use the following link for download and install it manually.

<https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-7.0.100-macos-x64-installer?journey=vs-code>

## install-docker

follow the instruction provided in the following links to install docker.

<https://dotnet.microsoft.com/en-us/learn/aspnet/microservice-tutorial/install-docker>
<https://docs.docker.com/desktop/install/mac-install/>

## Install github

GitHub is a web-based platform for version control and collaboration that allows developers to host, review, and manage code repositories. It's widely used for open-source projects and collaborative development.

```
brew install gh
```

## Install jq

 JQ is a lightweight and flexible command-line tool for processing JSON data. It provides various features to extract, manipulate, and transform JSON files efficiently.

```sh
brew install jq
```
## Install postman


Postman is a popular API development and testing tool. It allows you to make HTTP requests, test APIs, and automate API workflows, making it easier to develop and debug APIs.

```sh
brew install --cask postman
```
<!-- Here is the list of other software you may need during the development.

```
1. Zsh 
2. Homebrew - Mac
2. choco - windows
3. Chrome 
3. Alfred 
4. Iterm2 
5. Git 
6. Pycharm 
5. Visual Studio Code 
6. Vim 
7. Extentions a. Prettier b. Bracket Pair Colorizer c. Live Share 
8. Slack 
9. Zoom 
10. Droplr 
11. Loom 
12. Virtual Desktop 13. Spectical
``` -->
<!-- 
## Reference

- <https://www.youtube.com/watch?v=0MiGnwPdNGE> - How I setup the Terminal on my M1 Max MacBook Pro 
- https://www.robinwieruch.de/mac-setup-web-development/
- https://www.robinwieruch.de/mac-setup-web-development/
-->