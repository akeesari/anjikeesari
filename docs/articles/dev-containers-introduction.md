# What are Development Containers?

## Overview

Modern software development often involves complex setups, dependencies, and configurations. Ensuring that every team member's development environment matches and keeping it consistent can be challenging. That's where Development Containers come into play.

In this article, we will explore the fundamentals of `Dev Containers`. We'll try to understand what they are, why the `.devcontainer` folder is crucial, how Dev Containers work, and ultimately, we'll learn how to develop applications inside a Dev Container.

## Prerequisites

Before look into Development Containers, it's helpful to have a basic understanding of application development, containerization, and version control systems like Git. also, you should have Docker and VS code installed on your local machine, as Development Containers often rely on Docker to create isolated development environments.

## What is Dev Containers?

`Development containers`, or `dev containers` also known as `Remote Container`, are a standardized approach to defining and managing development environments within containers. They encapsulate all the necessary tools, libraries, and configurations required for a specific development project. Dev Containers enable developers to work in a consistent environment, regardless of their local setup, operating system, or development machine.

Using Dev Containers can significantly enhance the development experience by eliminating the setup overhead, ensuring consistency, and simplifying collaboration across teams. 

## What is `.devcontainer` folder ?

The `.devcontainer` folder is a special directory in a project that is often used with the Visual Studio Code (VS Code) Dev Containers extension. This folder contains configuration files that define how the development container should be set up when a developer opens the project in VS Code. The configuration details include settings for the container image, runtime, extensions, environment variables, and more.

The purpose of the `.devcontainer` folder is to encapsulate the development environment configuration as code. This enables developers to define and version their development environment settings alongside the project code. When someone opens the project in VS Code, the Dev Containers extension reads the configuration in the .devcontainer folder and automatically configures the development container accordingly.

`.devcontainer` folder typically include:

1. **devcontainer.json:**  The primary configuration file is `devcontainer.json.` This JSON file outlines the settings for the development container, specifying the Docker image, runtime, environment variables, user settings, and VS Code extensions to be installed.

2. **Dockerfile:** Optionally, you may include a Dockerfile in the .devcontainer folder if you need to customize the base Docker image further. This file is used to build the image when the container is created.

3. **docker-compose.yml** (Optional): If your project requires additional services or multiple containers, you can include a docker-compose.yml file to define the multi-container configuration.


## How Dev Containers works?

Dev Containers, often associated with Visual Studio Code's `Remote - Containers extension`, works by enabling developers to create and use containerized development environments. These environments are defined within a container and provide a consistent, reproducible setup for coding, building, and running applications. 


Here's a step-by-step explanation of how Dev Containers work:


- **Project Configuration:** Developers create a special folder in their project named as `.devcontainer`. Inside this folder, configuration files are added to define the development environment.

- **Configuration Files:**  The primary configuration file is `devcontainer.json`. This JSON file specifies details about the development container, such as the Docker image to use, runtime settings, environment variables, and Visual Studio Code settings.

3. **Optional Dockerfile:**  Optionally, a `Dockerfile` can be included in the `.devcontainer` folder. This file allows developers to customize the base Docker image further. It is used to build the container image when the development environment is created.

4. **Opening the Project in Visual Studio Code:** Developers open the project in Visual Studio Code, and the presence of the `.devcontainer` folder is detected by the "Remote - Containers" extension.

5. **Extension Activation:**  The "Remote - Containers" extension automatically recognizes the project as a Dev Container project and suggests reopening it in a containerized environment.

6. **Container Creation:** When developers choose to reopen the project in a container, Visual Studio Code uses the information from the `devcontainer.json` file to create a Docker container that encapsulates the development environment.

7. **Mounting Project Files:** Project files are mounted from the local file system into the container, allowing developers to work with their source code seamlessly.

8. **Extensions Installation:** Visual Studio Code extensions specified in `devcontainer.json` are installed and run inside the container. This ensures that developers have the necessary tools and extensions for their development tasks.

9. **Running and Debugging:**  Developers can run and debug their applications within the container. This allows them to test and iterate in an environment that mirrors production closely.


## Benefits of developing applications inside a Dev Container


Setup local development environment that leverages containerization through Microsoft's DevContainer mechanism allows developers to create and run their development environments within containers, providing a consistent and reproducible setup for coding, testing, and debugging. 

Here are some key benefits of a local development setup using Microsoft's DevContainer:


- **Container-Based Development:** Developers use containers to encapsulate their development environments, ensuring consistency and reproducibility across different machines.

- **Run Services and Databases together:** All the necessary services, databases, and supporting components for the application are containerized. This includes running databases like PostgreSQL, MySQL, or services like Redis or RabbitMQ in separate containers.

4. **Consistent Development Environments:** Developers benefit from a consistent development environment, minimizing the "it works on my machine" problem. Everyone working on the project uses the same containerized setup.

5. **Isolation and Portability:**  Containerization provides isolation for services and dependencies, preventing conflicts between different projects. It also ensures portability, allowing developers to easily share their container configurations.

6. **Ease of Onboarding:** New developers can quickly get started by cloning the repository and using the predefined Dev Container configuration. This streamlines the onboarding process, as developers don't need to spend time setting up dependencies manually.

7. **Integrated Development Environment (IDE) Support:** Integrated Development Environments (IDEs) like Visual Studio Code support the "Remote - Containers" extension, allowing developers to seamlessly work with containerized environments.

8. **Version Control for Development Environments::**  The `devcontainer.json` file, along with other configuration files like Dockerfiles, can be version controlled. This allows teams to track changes to the development environment settings and ensures a versioned and documented setup.

9. **Local Testing and Debugging:** Developers can locally test and debug their applications within the containerized environment. This includes running and debugging services, APIs, and other components.

10. **Facilitates Microservices Development:** Container-based development aligns well with microservices architecture. Each microservice can have its own containerized development environment, simplifying the overall development process for microservices-based applications.

11. **Docker Compose Integration:** Docker Compose may be utilized to define and manage multi-container environments locally. It simplifies the orchestration of multiple containers needed for the complete development setup.

## Conclusion

In conclusion, Development Containers are adds huge value in modern software development. They bring consistency, portability, isolation, and version control to development environments, making collaboration and project management more efficient. By adopting Dev Containers, development teams can streamline their workflows, reduce setup time, and ensure that everyone is on the same page when it comes to building and testing applications locally.

## References

- [Development Containers](https://containers.dev/){:target="_blank"}
- [Use a Docker container](https://learn.microsoft.com/en-us/training/modules/use-docker-container-dev-env-vs-code/){:target="_blank"}
- [Beginner's Series to: Dev Containers](https://www.youtube.com/watch?v=61M2takIKl8){:target="_blank"}
- [Visual Studio Code Remote - Containers](https://code.visualstudio.com/docs/remote/containers){:target="_blank"}

