# Download & install Software in macOS

## Introduction

In this article, I am going to present a comprehensive list of essential tools and software commonly needed by developers in the IT industry. If you are using macOS operating system, you can download and install the following software as per your requirements. It is recommended to use the `brew` tool for installation, but if you encounter any issues, you can also perform a direct manual install.

!!! note
    You may need to restart your Mac or terminal after completing all installations.

## What is Homebrew?

Homebrew is a free and open-source software package management system that simplifies the installation of software on Apple's operating system, macOS, as well as Linux. 

## Install Homebrew

This is the first software you may need to install before installing anything on a Mac. For more information, refer to this link: <https://brew.sh/>

Homebrew is similar to Chocolatey in the Windows environment.

homebrew (for Mac users) = choco (for Windows users)

To use Homebrew, you will need to have a terminal window open and install Homebrew on your system. To install Homebrew, you can copy and paste the following command into the terminal:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Expected output:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/anjikeesari/.zprofile   
eval "$(/opt/homebrew/bin/brew shellenv)"  
```

Once the installation is finished, you can use the `brew` command to install, upgrade, and manage software packages using Homebrew.

Verify the installation:

```sh
brew --version
# or
brew doctor
```

Upgrade Homebrew:

```sh
brew upgrade
```


## Install Google Chrome 

```sh
brew install --cask google-chrome
```

Verify the installed version:

```sh
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --version
```

Upgrade Google Chrome:

```sh
brew upgrade --cask google-chrome
```

## Install iTerm2 

iTerm2 is a popular terminal emulator for macOS. It provides a more advanced and feature-rich interface for working with the command line.

```sh
brew install --cask iterm2
```

Verify the installation:

```sh
/Applications/iTerm.app/Contents/MacOS/iTerm2 --version
```

Upgrade iTerm2:

```sh
brew upgrade --cask iterm2
```

## Install PowerShell

PowerShell is a command-line shell and scripting language developed by Microsoft. It allows you to automate tasks and manage your computer system efficiently.

``` 
# install
brew install --cask powershell

# upgrade
brew upgrade --cask powershell
```

## Install VS Code

It is the most commonly used IDE, it is widely used for programming and supports various languages with extensive customization options.

```sh
brew install --cask visual-studio-code
```

Verify the installation:

```sh
code --version
```

Upgrade VS Code:

```sh
brew upgrade --cask visual-studio-code
```

## VS Code Extensions

Install essential VS Code extensions using the command line:

```sh
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.azure-account
code --install-extension ms-kubernetes-tools.vscode-aks-tools
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension hashicorp.terraform
code --install-extension ms-dotnettools.csharp
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-azuretools.vscode-docker
code --install-extension tim-koehler.vscode-helm
code --install-extension ms-vscode.powershell
```

List all installed extensions:

```sh
code --list-extensions
```

## Install git

Git is a version control system used for tracking changes in software projects. It allows multiple developers to collaborate on a project efficiently and helps manage different versions of the code.

```sh
brew install git
```

Verify the installation:

```sh
git --version
```

Output:

```
git version 2.43.0
```

Upgrade Git:

```sh
brew upgrade git
```

## Install docker

Docker is a platform that simplifies the process of creating, deploying, and running applications using containers. 

```sh
brew install --cask docker
```

Verify the installation:

```sh
docker --version
```

Output:

```
Docker version 20.10.21, build baeda1f
```

Upgrade Docker:

```sh
brew upgrade --cask docker
```
## Install node

Node.js is a JavaScript runtime that allows you to execute JavaScript code outside of a web browser.

```sh
brew install node
```

Verify the installation:

```sh
node --version  
npm --version
```

Upgrade Node.js:

```sh
brew upgrade node
```

## Install dotnet

It provides a runtime environment and libraries for building and running different types of applications, especially those developed using the C# programming language. 

```sh
brew install --cask dotnet
```

Verify the installation:

```sh
dotnet --version
```

Upgrade .NET:

```sh
brew upgrade --cask dotnet
```

## Install python3

Python is a popular programming language known for its simplicity and versatility. Installing Python 3 refers to setting up the latest version of Python on your system for development purposes.

```sh
brew install python3
```

Verify the installation:

```sh
python3 --version
```

Upgrade Python 3:

```sh
brew upgrade python3
```

## Upgrade pip

```sh
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

```sh
brew install azure-cli
```

Verify the installation:

```sh
az --version
```

Upgrade Azure CLI:

```sh
brew upgrade azure-cli
```

## Install kubectl

 kubectl is a command-line tool used to interact with Kubernetes clusters. It enables you to deploy, manage, and monitor applications running on Kubernetes.

For more information, please refer to the following link: - - <https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/>

```sh
brew install kubectl
```

Verify the installation:

```sh
kubectl version
```

Upgrade kubectl:

```sh
brew upgrade kubectl
```

## Install Lens

Lens is a popular Kubernetes platform that serves as a robust and advanced development and management environment for Kubernetes clusters. It provides a comprehensive graphical user interface (GUI) that simplifies the management, monitoring, and interaction with Kubernetes resources and clusters.

```sh
brew install --cask lens
```

Verify the installation:

```sh
lens --version
```

Upgrade Lens:

```sh
brew upgrade --cask lens
```

## Install Terraform

Terraform is an infrastructure-as-code tool used for provisioning and managing cloud resources. It allows you to define your infrastructure in code and automates the deployment and management of resources across different cloud providers.

```sh
brew install terraform
```

Verify the installation:

```sh
terraform version
```

Upgrade Terraform:

```sh
brew upgrade terraform
```

## Install Helm

Helm is a package manager for Kubernetes that simplifies the deployment and management of applications on Kubernetes clusters. It allows you to define and install applications using charts, which are packages of pre-configured Kubernetes resources.

```sh
brew install helm
```

Verify the installation:

```sh
helm version
```

Upgrade Helm:

```sh
brew upgrade helm
```

## Install argocd

Argo CD is a declarative, GitOps continuous delivery tool for Kubernetes.

```sh
brew install argocd
```

Verify the installation:

```sh
argocd version
```

Upgrade Argo CD:

```sh
brew upgrade argocd
```

## Install pgadmin4

pgAdmin is a graphical administration and development platform for PostgreSQL, a popular open-source relational database management system. It provides a user-friendly interface for managing databases, running queries, and monitoring server activity.

```sh
brew install pgadmin4
```

Verify the installation:

```sh
brew list pgadmin4
```

Upgrade pgAdmin 4:

```sh
brew upgrade pgadmin4
```

## Install Azure Data Studio

Data management tool that enables working with SQL Server, PostgerSQL, MySQL and more.

```sh
brew install --cask azure-data-studio
```

Verify the installation:

```sh
brew list azure-data-studio
```

Upgrade Azure Data Studio:

```sh
brew upgrade --cask azure-data-studio
```
## Azure Storage Explorer

Azure Storage Explorer is a standalone application provided by Microsoft that allows users to interact Azure storage account services and making it easier to work with Azure Blob Storage, Azure Queue Storage, Azure Table Storage, and Azure Cosmos DB.

```sh
brew install --cask microsoft-azure-storage-explorer
```

Verify the installation:

```sh
brew list microsoft-azure-storage-explorer
```

Upgrade Azure Storage Explorer:

```sh
brew upgrade --cask microsoft-azure-storage-explorer
```
## Install Microsoft Remote Desktop

Microsoft Remote Desktop is a Microsoft application that allows users to remotely access and control Windows-based computers or virtual machines from other devices.


```sh
brew install --cask microsoft-remote-desktop
```

Verify the installation:

```sh
brew list microsoft-remote-desktop
```

Upgrade Microsoft Remote Desktop:

```sh
brew upgrade --cask microsoft-remote-desktop
```

## Install zoom

Zoom is a video conferencing and online meeting platform that enables you to communicate with others through video, audio, and chat. It's widely used for remote work and virtual meetings.

```sh
brew install --cask zoom
```

Verify the installation:

```sh
brew list zoom
```

Upgrade Zoom:

```sh
brew upgrade --cask zoom
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

<!-- ## install-docker

follow the instruction provided in the following links to install docker.

<https://dotnet.microsoft.com/en-us/learn/aspnet/microservice-tutorial/install-docker>
<https://docs.docker.com/desktop/install/mac-install/> -->

## Install github

GitHub CLI (gh) is a command-line tool that brings GitHub functionality to your terminal, allowing you to manage pull requests, issues, repositories, and other GitHub features without leaving the command line.

```sh
brew install gh
```

Verify the installation:

```sh
gh --version
```

Upgrade GitHub CLI:

```sh
brew upgrade gh
```

## Install jq

 JQ is a lightweight and flexible command-line tool for processing JSON data. It provides various features to extract, manipulate, and transform JSON files efficiently.

```sh
brew install jq
```

Verify the installation:

```sh
jq --version
```

Upgrade JQ:

```sh
brew upgrade jq
```

## Install postman


Postman is a popular API development and testing tool. It allows you to make HTTP requests, test APIs, and automate API workflows, making it easier to develop and debug APIs.

```sh
brew install --cask postman
```

Verify the installation:

```sh
brew list postman
```

Upgrade Postman:

```sh
brew upgrade --cask postman
```

## Install Lightshot

Lightshot is a free program that offers a quick and easy way to capture a screen including basic editing tools. 

I don't see brew commands to install this tool but you can install it manually from here:

 [Lightshot downloads](https://app.prntscr.com/en/download.html){:target="_blank"}

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

## Troubleshooting

### Common Installation Issues

**Homebrew Permission Errors**

If you encounter permission errors during installation:

```sh
# Fix Homebrew permissions
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/share

# For Apple Silicon Macs
sudo chown -R $(whoami) /opt/homebrew
```

**Command Not Found After Installation**

If installed tools are not recognized:

```sh
# Add Homebrew to PATH (for Apple Silicon)
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# For Intel Macs
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile

# Restart terminal or source the profile
source ~/.zprofile
```

**Xcode Command Line Tools Issues**

Homebrew requires Xcode Command Line Tools:

```sh
# Install Xcode Command Line Tools
xcode-select --install

# Verify installation
xcode-select -p
```

**Version Conflicts**

To check installed versions and resolve conflicts:

```sh
# List all installed packages
brew list

# Check for outdated packages
brew outdated

# Force reinstall a package
brew reinstall <package>
```

### Additional Resources

- [Homebrew Documentation](https://docs.brew.sh/)
- [Homebrew FAQ](https://docs.brew.sh/FAQ)
- [Useful Network Tools](../tools/useful-tools.md)
- [Kubectl Cheat Sheet](../cheatsheets/kubectl-cheat-sheet.md)
- [Docker Cheat Sheet](../cheatsheets/docker-cheat-sheet.md)
- [Helm Cheat Sheet](../cheatsheets/helm-cheat-sheet.md)
- [Terraform Cheat Sheet](../cheatsheets/terraform-cheat-sheet.md)
- [Git Cheat Sheet](../cheatsheets/git-cheat-sheet.md)

# For Intel Macs
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile

# Restart terminal or source the profile
source ~/.zprofile
```

**Xcode Command Line Tools Issues**

Homebrew requires Xcode Command Line Tools:

```sh
# Install Xcode Command Line Tools
xcode-select --install

# Verify installation
xcode-select -p
```

**Version Conflicts**

To check installed versions and resolve conflicts:

```sh
# List all installed packages
brew list

# Check for outdated packages
brew outdated

# Force reinstall a package
brew reinstall <package>
```

### Quick Command Reference: Windows vs macOS

| Task | Windows (Chocolatey) | macOS (Homebrew) |
|------|---------------------|------------------|
| Install package | `choco install <package>` | `brew install <package>` |
| Install GUI app | `choco install <package>` | `brew install --cask <package>` |
| Update package manager | `choco upgrade chocolatey` | `brew update` |
| Upgrade package | `choco upgrade <package> -y` | `brew upgrade <package>` |
| Upgrade all | `choco upgrade all -y` | `brew upgrade` |
| List installed | `choco list --local-only` | `brew list` |
| Search packages | `choco search <package>` | `brew search <package>` |
| Uninstall package | `choco uninstall <package>` | `brew uninstall <package>` |
| Get package info | `choco info <package>` | `brew info <package>` |

### Additional Resources

- [Homebrew Documentation](https://docs.brew.sh/)
- [Homebrew FAQ](https://docs.brew.sh/FAQ)
- [Useful Network Tools](../tools/useful-tools.md)