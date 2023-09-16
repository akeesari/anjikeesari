# My Personal Website

Welcome to my personal (anjikeesari.com) website! This site is built using [MkDocs](https://www.mkdocs.org/), a fast and simple static site generator.

## Getting Started

To view the website locally and make changes, you'll need to set up the development environment:

1. **Installation:** Install MkDocs by following the [official installation guide](https://www.mkdocs.org/#installation).

**Local setup on Mac OS**

install brew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install python3


```sh
brew install python3
python3 --version
```

Upgrade pip

```sh
pip3 install --upgrade pip

```
Install mkdocs

```sh
pip3 install mkdocs
pip3 install mkdocs-material
pip3 install mkdocs-material-extensions
```

2. **Clone the repository:** Clone this repository to your local machine using the command:
```sh
git clone https://github.com/akeesari/anjikeesari.git
```

3. **Navigate to the project directory:** Go to the project directory using the command:

```
cd anjikeesari
```

4. **Run Initial Setup** 

create new mkdocs project

```
mkdocs new .
```
output in index.md
```
# Welcome to MkDocs

For full documentation visit [mkdocs.org](https://www.mkdocs.org).

## Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.

## Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.

```
check the mkdocs installation 
```
pip list
```


create `init_setup.sh` with following 

``` bash
echo [$(date)]: "START"
export _VERSION_=3.8
echo [$(date)]: "creating environment with python ${_VERSION_}"
conda create --prefix ./env python=${_VERSION_} -y
echo [$(date)]: "activate environment"
source activate ./env
echo [$(date)]: "install requirements"
pip install -r requirements.txt
echo [$(date)]: "END"

```

create `requirements.txt` with following contents
```
mkdocs-material
mkdocs-glightbox
mkdocs-pdf-export-plugin
```

Open Git bash in VS code and run the following command to setup the project:

```
bash init_setup.sh
```

1. **Start the local server:** Launch the development server with the command:

```
mkdocs serve
```

6. **View the website:** Open your browser and visit http://localhost:8000 to view the website locally.

## Contributing
If you find any issues with my website or would like to suggest improvements, feel free to open an issue or submit a pull request. Contributions are always welcome!

## License
This project is licensed under the MIT License.

## References
https://suedbroecker.net/2021/01/25/how-to-install-mkdocs-on-mac-and-setup-the-integration-to-github-pages/