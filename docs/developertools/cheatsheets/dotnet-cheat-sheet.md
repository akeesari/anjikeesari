# .NET CLI Commands

## Introduction

The .NET CLI (Command-Line Interface) is a cross-platform toolchain for developing, building, running, and publishing .NET applications. It provides a consistent experience across Windows, macOS, and Linux, making it essential for modern .NET development. This cheat sheet covers essential .NET CLI commands for project creation, package management, building, testing, publishing, and Entity Framework Core operations.

**Related Cheat Sheets:** [Docker Commands](docker-cheat-sheet.md)

---

## Installation

### Windows

``` powershell
# Install via winget
winget install Microsoft.DotNet.SDK.8

# Install via Chocolatey
choco install dotnet-sdk

# Download installer from: https://dotnet.microsoft.com/download

# Verify installation
dotnet --version
dotnet --info
```

### macOS

``` bash
# Install via Homebrew
brew install --cask dotnet-sdk

# Download installer from: https://dotnet.microsoft.com/download

# Verify installation
dotnet --version
dotnet --info
```

### Linux

``` bash
# Ubuntu/Debian
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y dotnet-sdk-8.0

# Fedora/CentOS/RHEL
sudo dnf install dotnet-sdk-8.0

# Verify installation
dotnet --version
dotnet --info
```

---

## Getting Started

### Version Information

``` bash
# Display .NET SDK version
dotnet --version

# Display detailed .NET information
dotnet --info

# List installed SDKs
dotnet --list-sdks

# List installed runtimes
dotnet --list-runtimes

# Check for updates
dotnet sdk check
```

### Help and Documentation

``` bash
# General help
dotnet --help
dotnet -h

# Command-specific help
dotnet new --help
dotnet build --help
dotnet run --help

# List available project templates
dotnet new list
dotnet new --list
```

---

## Project Management

### Creating Projects

``` bash
# Create console application
dotnet new console -n MyConsoleApp
dotnet new console -o MyConsoleApp

# Create web API
dotnet new webapi -n MyWebApi
dotnet new webapi -o MyWebApi --framework net8.0

# Create ASP.NET Core web app (MVC)
dotnet new mvc -n MyWebApp
dotnet new mvc -o MyWebApp

# Create Blazor Server app
dotnet new blazorserver -n MyBlazorApp

# Create Blazor WebAssembly app
dotnet new blazorwasm -n MyBlazorWasmApp

# Create class library
dotnet new classlib -n MyLibrary
dotnet new classlib -o MyLibrary --framework netstandard2.0

# Create xUnit test project
dotnet new xunit -n MyTests
dotnet new xunit -o MyApp.Tests

# Create NUnit test project
dotnet new nunit -n MyTests

# Create MSTest test project
dotnet new mstest -n MyTests

# Create Razor Pages app
dotnet new razor -n MyRazorApp

# Create worker service
dotnet new worker -n MyWorkerService

# Create solution file
dotnet new sln -n MySolution

# Create with specific framework
dotnet new console -n MyApp --framework net8.0
dotnet new console -n MyApp --framework net6.0
```

### Solution Management

``` bash
# Create new solution
dotnet new sln -n MySolution

# Add project to solution
dotnet sln add MyProject/MyProject.csproj
dotnet sln add MyProject1/MyProject1.csproj MyProject2/MyProject2.csproj

# List projects in solution
dotnet sln list

# Remove project from solution
dotnet sln remove MyProject/MyProject.csproj
```

### Project References

``` bash
# Add project reference
dotnet add reference ../MyLibrary/MyLibrary.csproj
dotnet add MyProject/MyProject.csproj reference MyLibrary/MyLibrary.csproj

# Remove project reference
dotnet remove reference ../MyLibrary/MyLibrary.csproj

# List project references
dotnet list reference
```

---

## Package Management

### Adding Packages

``` bash
# Add NuGet package
dotnet add package Newtonsoft.Json
dotnet add package Microsoft.EntityFrameworkCore

# Add specific version
dotnet add package Newtonsoft.Json --version 13.0.3

# Add with prerelease versions
dotnet add package Microsoft.AspNetCore.Components --prerelease

# Add package to specific project
dotnet add MyProject/MyProject.csproj package Serilog

# Add package from specific source
dotnet add package MyPackage --source https://api.nuget.org/v3/index.json
```

### Removing Packages

``` bash
# Remove package
dotnet remove package Newtonsoft.Json
dotnet remove package Microsoft.EntityFrameworkCore
```

### Listing Packages

``` bash
# List packages in project
dotnet list package

# List outdated packages
dotnet list package --outdated

# List vulnerable packages
dotnet list package --vulnerable

# List deprecated packages
dotnet list package --deprecated

# Include transitive packages
dotnet list package --include-transitive
```

### Restoring Packages

``` bash
# Restore all dependencies
dotnet restore

# Restore for specific project
dotnet restore MyProject/MyProject.csproj

# Restore with specific source
dotnet restore --source https://api.nuget.org/v3/index.json

# Force restore (ignore cache)
dotnet restore --force

# Restore with no cache
dotnet restore --no-cache
```

---

## Building

### Build Commands

``` bash
# Build project
dotnet build

# Build with Release configuration
dotnet build --configuration Release
dotnet build -c Release

# Build without restoring
dotnet build --no-restore

# Build specific project
dotnet build MyProject/MyProject.csproj

# Build solution
dotnet build MySolution.sln

# Build with verbose output
dotnet build --verbosity detailed
dotnet build -v d

# Build for specific runtime
dotnet build --runtime win-x64
dotnet build --runtime linux-x64
dotnet build --runtime osx-arm64

# Build with specific framework
dotnet build --framework net8.0
```

### Clean

``` bash
# Clean build outputs
dotnet clean

# Clean with configuration
dotnet clean --configuration Release

# Clean specific project
dotnet clean MyProject/MyProject.csproj
```

---

## Running Applications

### Run Commands

``` bash
# Run project
dotnet run

# Run with specific configuration
dotnet run --configuration Release
dotnet run -c Release

# Run with arguments
dotnet run -- arg1 arg2
dotnet run -- --environment Production

# Run specific project
dotnet run --project MyProject/MyProject.csproj

# Run without building
dotnet run --no-build

# Run without restoring
dotnet run --no-restore

# Run with specific framework
dotnet run --framework net8.0

# Run with environment variable
dotnet run --environment Production
```

### Watch Mode

``` bash
# Run with hot reload (watch mode)
dotnet watch run

# Watch and run tests
dotnet watch test

# Watch with specific project
dotnet watch --project MyProject/MyProject.csproj run
```

---

## Testing

### Running Tests

``` bash
# Run all tests
dotnet test

# Run tests with verbose output
dotnet test --verbosity normal
dotnet test -v n

# Run tests without building
dotnet test --no-build

# Run tests for specific project
dotnet test MyTests/MyTests.csproj

# Run tests with code coverage
dotnet test --collect:"XPlat Code Coverage"

# Run tests and generate results file
dotnet test --logger "trx;LogFileName=test-results.trx"

# Run specific test
dotnet test --filter FullyQualifiedName=MyNamespace.MyClass.MyTest

# Run tests matching pattern
dotnet test --filter Name~Integration
dotnet test --filter Category=Unit

# Run tests in parallel
dotnet test --parallel
```

### Test Filtering

``` bash
# Filter by test name
dotnet test --filter "FullyQualifiedName~MyTest"

# Filter by category/trait
dotnet test --filter "Category=Integration"
dotnet test --filter "Priority=1"

# Filter by namespace
dotnet test --filter "FullyQualifiedName~MyNamespace"

# Multiple filters
dotnet test --filter "(Category=Unit)|(Category=Integration)"
```

---

## Publishing

### Publish Commands

``` bash
# Publish project
dotnet publish

# Publish with Release configuration
dotnet publish --configuration Release
dotnet publish -c Release

# Publish to specific output directory
dotnet publish --output ./publish
dotnet publish -o ./publish

# Publish for specific runtime (self-contained)
dotnet publish --runtime win-x64 --self-contained
dotnet publish --runtime linux-x64 --self-contained
dotnet publish --runtime osx-arm64 --self-contained

# Publish framework-dependent
dotnet publish --runtime win-x64 --self-contained false
dotnet publish --runtime win-x64 --no-self-contained

# Publish single file
dotnet publish --runtime win-x64 --self-contained -p:PublishSingleFile=true

# Publish with trimming
dotnet publish --runtime win-x64 --self-contained -p:PublishTrimmed=true

# Publish ReadyToRun
dotnet publish --runtime win-x64 --self-contained -p:PublishReadyToRun=true

# Publish to specific framework
dotnet publish --framework net8.0
```

### Publishing for Docker

``` bash
# Publish for Linux container
dotnet publish --configuration Release --runtime linux-x64 --self-contained false --output ./publish

# Publish for Alpine Linux
dotnet publish --configuration Release --runtime linux-musl-x64 --self-contained false --output ./publish
```

---

## Entity Framework Core

### Installation

``` bash
# Install EF Core tools globally
dotnet tool install --global dotnet-ef

# Update EF Core tools
dotnet tool update --global dotnet-ef

# Verify installation
dotnet ef --version
```

### Migrations

``` bash
# Add migration
dotnet ef migrations add InitialCreate
dotnet ef migrations add AddUserTable

# Add migration with specific context
dotnet ef migrations add InitialCreate --context MyDbContext

# Add migration for specific project
dotnet ef migrations add InitialCreate --project MyProject

# List migrations
dotnet ef migrations list

# Remove last migration
dotnet ef migrations remove

# Generate SQL script for migration
dotnet ef migrations script
dotnet ef migrations script --output migration.sql

# Generate SQL for specific migration range
dotnet ef migrations script InitialCreate AddUserTable
dotnet ef migrations script 0 InitialCreate
```

### Database Operations

``` bash
# Update database to latest migration
dotnet ef database update

# Update to specific migration
dotnet ef database update InitialCreate

# Revert all migrations
dotnet ef database update 0

# Drop database
dotnet ef database drop
dotnet ef database drop --force

# Get database connection string
dotnet ef dbcontext info

# List DbContext types
dotnet ef dbcontext list

# Generate DbContext from existing database (scaffold)
dotnet ef dbcontext scaffold "Server=localhost;Database=MyDb;User=sa;Password=Pass;" Microsoft.EntityFrameworkCore.SqlServer

# Scaffold with specific tables
dotnet ef dbcontext scaffold "ConnectionString" Microsoft.EntityFrameworkCore.SqlServer --table Users --table Orders

# Scaffold to specific output directory
dotnet ef dbcontext scaffold "ConnectionString" Microsoft.EntityFrameworkCore.SqlServer --output-dir Models --context-dir Data
```

### EF Core with Projects

``` bash
# Specify startup project and project with DbContext
dotnet ef migrations add InitialCreate --startup-project MyApi --project MyData

# Update database with specific projects
dotnet ef database update --startup-project MyApi --project MyData
```

---

## Global Tools

### Installing Tools

``` bash
# Install tool globally
dotnet tool install --global dotnet-ef
dotnet tool install --global dotnet-aspnet-codegenerator

# Install tool locally (project-specific)
dotnet new tool-manifest
dotnet tool install dotnet-ef

# Install specific version
dotnet tool install --global dotnet-ef --version 8.0.0
```

### Managing Tools

``` bash
# List installed global tools
dotnet tool list --global

# List local tools
dotnet tool list

# Update tool
dotnet tool update --global dotnet-ef

# Uninstall tool
dotnet tool uninstall --global dotnet-ef

# Restore local tools
dotnet tool restore
```

---

## NuGet Package Creation

### Pack and Push

``` bash
# Create NuGet package
dotnet pack

# Pack with specific configuration
dotnet pack --configuration Release

# Pack with version
dotnet pack --configuration Release /p:Version=1.0.0

# Pack to specific output directory
dotnet pack --output ./packages

# Push package to NuGet.org
dotnet nuget push MyPackage.1.0.0.nupkg --api-key YOUR_API_KEY --source https://api.nuget.org/v3/index.json

# Push to private feed
dotnet nuget push MyPackage.1.0.0.nupkg --source https://pkgs.dev.azure.com/myorg/_packaging/myfeed/nuget/v3/index.json

# Add NuGet source
dotnet nuget add source https://api.nuget.org/v3/index.json --name nuget.org

# List NuGet sources
dotnet nuget list source

# Remove NuGet source
dotnet nuget remove source mySource
```

---

## Code Formatting

### Format Commands

``` bash
# Format code
dotnet format

# Format and verify only
dotnet format --verify-no-changes

# Format specific files/folders
dotnet format --include Program.cs

# Format with specific severity
dotnet format --severity info
dotnet format --severity warn
dotnet format --severity error
```

---

## Common Workflows

### Creating Web API Project

``` bash
# Create solution and projects
dotnet new sln -n MyApiSolution
dotnet new webapi -n MyApi
dotnet new xunit -n MyApi.Tests
dotnet new classlib -n MyApi.Data

# Add projects to solution
dotnet sln add MyApi/MyApi.csproj
dotnet sln add MyApi.Tests/MyApi.Tests.csproj
dotnet sln add MyApi.Data/MyApi.Data.csproj

# Add project references
cd MyApi
dotnet add reference ../MyApi.Data/MyApi.Data.csproj
cd ../MyApi.Tests
dotnet add reference ../MyApi/MyApi.csproj

# Add required packages
cd ../MyApi
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Serilog.AspNetCore
dotnet add package Swashbuckle.AspNetCore

# Build and run
cd ..
dotnet build
dotnet run --project MyApi
```

### Entity Framework Setup

``` bash
# Install EF Core tools
dotnet tool install --global dotnet-ef

# Add EF Core packages
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.EntityFrameworkCore.Tools

# Create initial migration
dotnet ef migrations add InitialCreate

# Update database
dotnet ef database update

# Scaffold existing database
dotnet ef dbcontext scaffold "Server=localhost;Database=MyDb;Trusted_Connection=True;" Microsoft.EntityFrameworkCore.SqlServer --output-dir Models
```

### Docker Publishing

``` bash
# Publish for Docker container
dotnet publish --configuration Release --runtime linux-x64 --self-contained false --output ./publish

# Create Dockerfile
# FROM mcr.microsoft.com/dotnet/aspnet:8.0
# WORKDIR /app
# COPY ./publish .
# ENTRYPOINT ["dotnet", "MyApi.dll"]

# Build Docker image
docker build -t myapi:latest .

# Run container
docker run -p 8080:8080 myapi:latest
```

### CI/CD Build Script

``` bash
# Restore, build, test, publish
dotnet restore
dotnet build --configuration Release --no-restore
dotnet test --configuration Release --no-build --verbosity normal
dotnet publish --configuration Release --output ./publish --no-build
```

---

## Configuration and Environment

### User Secrets

``` bash
# Initialize user secrets
dotnet user-secrets init

# Set secret
dotnet user-secrets set "ConnectionStrings:DefaultConnection" "Server=localhost;Database=MyDb;"
dotnet user-secrets set "ApiKey" "my-secret-key"

# List all secrets
dotnet user-secrets list

# Remove secret
dotnet user-secrets remove "ApiKey"

# Clear all secrets
dotnet user-secrets clear
```

### Environment Variables

``` bash
# Run with environment variable (Windows)
$env:ASPNETCORE_ENVIRONMENT="Production"; dotnet run

# Run with environment variable (Linux/Mac)
ASPNETCORE_ENVIRONMENT=Production dotnet run

# Set for current session (Windows)
$env:ASPNETCORE_ENVIRONMENT="Development"

# Set for current session (Linux/Mac)
export ASPNETCORE_ENVIRONMENT=Development
```

---

## Troubleshooting

### Build Issues

``` bash
# Clean and rebuild
dotnet clean
dotnet restore
dotnet build

# Force package restore
dotnet restore --force --no-cache

# Build with diagnostic output
dotnet build --verbosity diagnostic

# Check for SDK issues
dotnet --info
dotnet --list-sdks
```

### Runtime Issues

``` bash
# List installed runtimes
dotnet --list-runtimes

# Check framework compatibility
dotnet --info

# Run with detailed logging
dotnet run --verbosity detailed
```

### Package Issues

``` bash
# Clear NuGet cache
dotnet nuget locals all --clear

# List package sources
dotnet nuget list source

# Restore with specific source
dotnet restore --source https://api.nuget.org/v3/index.json
```

### EF Core Issues

``` bash
# Verify EF Core tools installation
dotnet ef --version

# Check DbContext configuration
dotnet ef dbcontext info

# Generate migration SQL without applying
dotnet ef migrations script --output migration.sql

# Drop and recreate database
dotnet ef database drop --force
dotnet ef database update
```

### Port Already in Use

``` bash
# Check what's using port (Windows)
netstat -ano | findstr :5000

# Kill process (Windows)
taskkill /PID <process_id> /F

# Run on different port
dotnet run --urls "http://localhost:5001"
```

---

## Best Practices

### Project Structure

1. **Use solution files** for multi-project applications
2. **Separate concerns** with class libraries (Data, Business, API)
3. **Create test projects** for each main project
4. **Use project references** instead of binary references
5. **Keep .csproj files clean** - use Directory.Build.props for shared settings

### Package Management

1. **Pin package versions** in production
2. **Regularly update packages** with `dotnet list package --outdated`
3. **Check for vulnerabilities** with `dotnet list package --vulnerable`
4. **Use central package management** for multi-project solutions
5. **Audit dependencies** before production deployment

### Building and Publishing

1. **Use Release configuration** for production builds
2. **Enable ReadyToRun** for faster startup: `-p:PublishReadyToRun=true`
3. **Trim unused code** for smaller deployments: `-p:PublishTrimmed=true`
4. **Self-contained** for environments without .NET runtime
5. **Framework-dependent** for environments with .NET runtime (smaller size)

### Entity Framework

1. **Always create migrations** for schema changes
2. **Generate SQL scripts** for production deployments
3. **Use separate migration projects** for large solutions
4. **Test migrations** in staging before production
5. **Keep migrations in source control**

### Development Workflow

1. **Use `dotnet watch`** for hot reload during development
2. **Run tests frequently** with `dotnet test`
3. **Format code** regularly with `dotnet format`
4. **Use user secrets** for local development sensitive data
5. **Enable detailed errors** in development environment

---

## Useful Commands Summary

``` bash
# Project lifecycle
dotnet new webapi -n MyApi             # Create project
dotnet restore                         # Restore packages
dotnet build                           # Build project
dotnet run                             # Run application
dotnet test                            # Run tests
dotnet publish -c Release              # Publish for deployment

# Package management
dotnet add package PackageName         # Add package
dotnet list package --outdated         # Check for updates
dotnet remove package PackageName      # Remove package

# Entity Framework
dotnet ef migrations add Name          # Create migration
dotnet ef database update              # Apply migrations
dotnet ef migrations list              # List migrations

# Tools
dotnet tool install --global dotnet-ef # Install global tool
dotnet tool list --global              # List installed tools

# Cleaning and maintenance
dotnet clean                           # Clean build outputs
dotnet nuget locals all --clear        # Clear NuGet cache
```

---

## References

- [.NET CLI Documentation](https://docs.microsoft.com/en-us/dotnet/core/tools/)
- [.NET SDK Download](https://dotnet.microsoft.com/download)
- [Entity Framework Core](https://docs.microsoft.com/en-us/ef/core/)
- [NuGet Package Manager](https://docs.microsoft.com/en-us/nuget/)
- [Docker Commands](docker-cheat-sheet.md)
- [.NET API Reference](https://docs.microsoft.com/en-us/dotnet/api/)

---

**Last Updated:** December 30, 2025
