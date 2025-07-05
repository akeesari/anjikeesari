
# Installation

## Prerequisites

- Homebrew (for Mac)
- Choco (for windows)


## Install Python (includes pip)


This installs Python and pip.  After install, restart your terminal then validate

```sh
# mac
brew install python
# validate
python3 --version # for mac
pip3 --version

# windows
choco install python -y
# validate
python --version
pip --version


# Upgrade commands
# Windoes
choco upgrade python -y
# After upgrading Python, upgrade pip using:
python -m pip install --upgrade pip

# Mac
brew upgrade python
python3 -m pip install --upgrade pip
```
## Install MkDocs

```sh
pip3 install mkdocs
pip3 install mkdocs-material
pip3 install mkdocs-material-extensions
# validate
mkdocs --version
```

## Create a New MkDocs Project

Clone the repository

```sh
git clone https://github.com/akeesari/anjikeesari.git
```

Navigate to the project directory

```sh
cd anjikeesari
```

create new mkdocs project

```sh
mkdocs new .
# or
mkdocs new anjikeesari
cd anjikeesari
```

## Start the MkDocs Server Locally

```sh
mkdocs serve
```
Open your browser and go to:

http://127.0.0.1:8000/

You should see the default MkDocs site!


For full documentation visit [mkdocs.org](https://www.mkdocs.org).

## References
- https://www.mkdocs.org/#installation
- https://suedbroecker.net/2021/01/25/how-to-install-mkdocs-on-mac-and-setup-the-integration-to-github-pages/