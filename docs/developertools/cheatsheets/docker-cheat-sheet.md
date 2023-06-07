# Docker Cheat Sheet

## Introduction
In this article, I am going to present a comprehensive cheat sheet of commonly used `Docker` commands

## Installing git

Here are the commands to install Docker on different operating systems:

```sh
# Ubuntu/Debian:
sudo apt-get update
sudo apt-get install docker.io


# MacOS (using Homebrew):
brew install docker

# Windows OS (using choco)
choco install docker-desktop
```

## General Commands

- Start the docker daemon
```
docker -d
```
- Get help with Docker. Can also use –help on all subcommands
```
docker --help
```
- Display system-wide information
```
docker info
```

## Docker Image

 Docker image is a lightweight, standalone, and executable package that contains everything needed to run a piece of software, including the code, runtime, system tools, libraries, and dependencies. 

```sh
# List local images
docker images

# Delete an Image
docker rmi <image_name>

# Remove all unused images
docker image prune
```


## Docker Build

Build an image from a Dockerfile

```sh
# Build an image from a Dockerfile and tag it with a specified name.
docker build -t <image_name>

# build an image and tag with naming conventions
docker build -t projectname/domainname/appname:yyyymmdd.sequence .
# Example
docker build -t sample/aspnet-api:20230226.1 .

# Build an image from a Dockerfile without the cache
docker build -t <image_name> . –no-cache
```

## Docker Run

```sh
# Create and run a container from an image, with a custom name:
docker run --name <container_name> <image_name>

# Run a container with and publish a container’s port(s) to the host.
docker run -p <host_port>:<container_port> <image_name>

# Run a container in the background
docker run -d <image_name>

# Remove a stopped container:
docker rm <container_name>

# Example: 
docker run --rm -p 8080:80 project1/domain1/app1:20230226.1
```

- **--rm:** This option automatically removes the container when it exits. It ensures that the container is cleaned up after it finishes running. This is useful for temporary or disposable containers.
- **-p 8080:80:** This option maps the host machine's port 8080 to the container's port 80. It establishes a network connection between the host and the container, allowing access to the containerized application via port 8080 on the host.

## Docker Push


```sh
# Publish an image to Docker Hub
docker push <username>/<image_name>
``` 
## Docker container

A Docker container is a lightweight, standalone, and executable runtime instance of a Docker image. It represents a running process that is isolated from the host system and other containers. Docker container providing a consistent and reproducible environment for running applications. Containers are highly portable and can be easily moved and deployed across different environments, such as development, testing, staging, and production. 

## 
## Docker Hub

Docker Hub is a cloud-based registry service provided by Docker that allows developers to store and share container images. It serves as a centralized repository for Docker images,

```sh
# Login into Docker
docker login -u <username>

# Publish an image to Docker Hub
docker push <username>/<image_name>

# Search Hub for an image
docker search <image_name>

# Pull an image from a Docker Hub
docker pull <image_name>
```

## Docker commands Summary
### Basic Commands

- docker run [image]: Start a new container from an image
- docker ps: List all running containers
- docker stop [container]: Stop a running container
- docker rm [container]: Remove a container
- docker images: List all available images
- docker pull [image]: Download an image from a registry
- docker push [image]: Upload an image to a registry
- docker build [options] [path]: Build an image from a Dockerfile

### Advanced Commands

- docker exec [container] [command]: Run a command inside a running container
- docker-compose up: Start a Docker Compose application
- docker network [subcommand]: Manage Docker networks
- docker volume [subcommand]: Manage Docker volumes
- docker logs [container]: View the logs of a container
- docker inspect [container]: Inspect a container
- docker diff [container]: Show changes to the filesystem of a container
- docker commit [container] [image]: Create a new image from a container's changes
- docker save [image]: Save an image to a tar archive
- docker load: Load an image from a tar archive

### Docker Compose Commands

- docker-compose up: Start a Docker Compose application
- docker-compose down: Stop a Docker Compose application
- docker-compose build: Build Docker Compose services
- docker-compose up --scale [service]=[num]: Scale a service to [num] instances


<!-- # Reference

- <https://docs.docker.com/get-started/docker_cheatsheet.pdf> -->