# Docker Compose Commands

## Introduction

Docker Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application's services, networks, and volumes. Then, with a single command, you create and start all the services from your configuration. This cheat sheet covers essential Docker Compose commands and configuration patterns for local development and testing environments.

**Related Cheat Sheets:** [Docker Commands](docker-cheat-sheet.md) | [Dockerfile Reference](dockerfile-cheat-sheet.md) | [Kubernetes Commands](kubectl-cheat-sheet.md)

---

## Installation

### Windows

``` powershell
# Docker Desktop includes Docker Compose
# Download from: https://www.docker.com/products/docker-desktop

# Verify installation
docker-compose --version
docker compose version

# Note: Docker Desktop includes both 'docker-compose' (v1) and 'docker compose' (v2)
# Prefer 'docker compose' (v2) for new projects
```

### macOS

``` bash
# Docker Desktop includes Docker Compose
# Download from: https://www.docker.com/products/docker-desktop

# Alternatively, install via Homebrew
brew install docker-compose

# Verify installation
docker-compose --version
docker compose version
```

### Linux

``` bash
# Install Docker Compose v2 (plugin method - recommended)
sudo apt-get update
sudo apt-get install docker-compose-plugin

# Verify installation
docker compose version

# Alternative: Install standalone binary
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

---

## Basic docker-compose.yml Structure

### Minimal Example

``` yaml
version: '3.8'

services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
```

### Common docker-compose.yml Template

``` yaml
version: '3.8'

services:
  # Web application service
  web:
    build:
      context: ./web
      dockerfile: Dockerfile
    container_name: my-web-app
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=development
      - DATABASE_URL=postgresql://user:pass@db:5432/mydb
    volumes:
      - ./web:/app
      - /app/node_modules
    depends_on:
      - db
      - redis
    networks:
      - app-network
    restart: unless-stopped

  # Database service
  db:
    image: postgres:16
    container_name: postgres-db
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
      POSTGRES_DB: mydb
    volumes:
      - postgres-data:/var/lib/postgresql/data
    ports:
      - "5432:5432"
    networks:
      - app-network
    restart: unless-stopped

  # Cache service
  redis:
    image: redis:7-alpine
    container_name: redis-cache
    ports:
      - "6379:6379"
    networks:
      - app-network
    restart: unless-stopped

volumes:
  postgres-data:

networks:
  app-network:
    driver: bridge
```

---

## Essential Commands

### Starting and Stopping Services

``` bash
# Start services in foreground
docker compose up

# Start services in background (detached mode)
docker compose up -d

# Start specific services
docker compose up web db

# Build images before starting
docker compose up --build

# Force recreate containers
docker compose up --force-recreate

# Stop services (preserves containers)
docker compose stop

# Stop and remove containers, networks
docker compose down

# Stop and remove containers, networks, and volumes
docker compose down -v

# Stop and remove containers, networks, volumes, and images
docker compose down -v --rmi all
```

### Building Images

``` bash
# Build or rebuild services
docker compose build

# Build specific service
docker compose build web

# Build without cache
docker compose build --no-cache

# Build with parallel execution
docker compose build --parallel

# Pull images before building
docker compose build --pull
```

### Viewing Logs

``` bash
# View logs from all services
docker compose logs

# Follow log output (tail -f)
docker compose logs -f

# View logs for specific service
docker compose logs web

# Follow logs for specific service
docker compose logs -f web

# View last 100 lines
docker compose logs --tail=100

# View logs with timestamps
docker compose logs -t

# View logs for multiple services
docker compose logs web db
```

### Managing Containers

``` bash
# List running containers
docker compose ps

# List all containers (including stopped)
docker compose ps -a

# Execute command in running container
docker compose exec web sh
docker compose exec web bash
docker compose exec db psql -U user -d mydb

# Execute command without allocating TTY
docker compose exec -T web npm test

# Run one-off command (creates new container)
docker compose run web npm install
docker compose run --rm web python manage.py migrate

# Restart services
docker compose restart

# Restart specific service
docker compose restart web

# Pause services
docker compose pause

# Unpause services
docker compose unpause
```

### Inspecting and Monitoring

``` bash
# View configuration
docker compose config

# Validate and view configuration
docker compose config --quiet

# View service ports
docker compose port web 3000

# View running processes
docker compose top

# View resource usage
docker compose stats

# View events
docker compose events

# View images
docker compose images
```

---

## Service Configuration

### Build Configuration

``` yaml
services:
  web:
    build:
      context: ./app          # Build context directory
      dockerfile: Dockerfile.dev  # Custom Dockerfile name
      args:                   # Build arguments
        - NODE_VERSION=18
        - APP_ENV=development
      target: development     # Multi-stage build target
      cache_from:            # Cache source images
        - myapp:latest
```

### Image and Container Name

``` yaml
services:
  web:
    image: myapp:latest       # Pull or use this image
    container_name: my-web-container  # Custom container name
```

### Ports Mapping

``` yaml
services:
  web:
    ports:
      - "3000:3000"           # HOST:CONTAINER
      - "8080:80"
      - "127.0.0.1:5432:5432" # Bind to specific interface
      - "3000-3005:3000-3005" # Range mapping
```

### Environment Variables

``` yaml
services:
  web:
    environment:
      - NODE_ENV=production
      - DATABASE_URL=postgresql://user:pass@db:5432/mydb
      - API_KEY=${API_KEY}    # From .env file or shell
    env_file:
      - .env                  # Load from .env file
      - .env.production
```

### Volumes

``` yaml
services:
  web:
    volumes:
      # Named volume
      - app-data:/app/data
      
      # Bind mount (host:container)
      - ./src:/app/src
      - ./config:/app/config:ro  # Read-only
      
      # Anonymous volume
      - /app/node_modules
      
      # Tmpfs mount (in-memory)
      - type: tmpfs
        target: /app/cache

volumes:
  app-data:                   # Define named volume
    driver: local
```

### Networking

``` yaml
services:
  web:
    networks:
      - frontend
      - backend
    network_mode: "bridge"    # or "host", "none"

networks:
  frontend:
    driver: bridge
  backend:
    driver: bridge
    internal: true            # Isolated network
```

### Dependencies

``` yaml
services:
  web:
    depends_on:
      - db
      - redis
    
  # With health check conditions (v2.1+)
  api:
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_started
```

### Health Checks

``` yaml
services:
  web:
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000/health"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
```

### Restart Policy

``` yaml
services:
  web:
    restart: always           # always, on-failure, unless-stopped, no
```

### Resource Limits

``` yaml
services:
  web:
    deploy:
      resources:
        limits:
          cpus: '0.5'
          memory: 512M
        reservations:
          cpus: '0.25'
          memory: 256M
```

---

## Common Use Cases

### Full-Stack Web Application

``` yaml
version: '3.8'

services:
  frontend:
    build: ./frontend
    ports:
      - "3000:3000"
    environment:
      - REACT_APP_API_URL=http://localhost:5000
    volumes:
      - ./frontend/src:/app/src
    depends_on:
      - backend

  backend:
    build: ./backend
    ports:
      - "5000:5000"
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/appdb
      - REDIS_URL=redis://redis:6379
    volumes:
      - ./backend:/app
    depends_on:
      - db
      - redis

  db:
    image: postgres:16
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
      POSTGRES_DB: appdb
    volumes:
      - postgres-data:/var/lib/postgresql/data
    ports:
      - "5432:5432"

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"

volumes:
  postgres-data:
```

### Microservices Architecture

``` yaml
version: '3.8'

services:
  api-gateway:
    build: ./gateway
    ports:
      - "8080:8080"
    environment:
      - AUTH_SERVICE_URL=http://auth-service:3001
      - USER_SERVICE_URL=http://user-service:3002
      - ORDER_SERVICE_URL=http://order-service:3003
    networks:
      - frontend
      - backend

  auth-service:
    build: ./services/auth
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/auth
    networks:
      - backend

  user-service:
    build: ./services/user
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/users
    networks:
      - backend

  order-service:
    build: ./services/order
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/orders
    networks:
      - backend

  db:
    image: postgres:16
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
    volumes:
      - postgres-data:/var/lib/postgresql/data
    networks:
      - backend

networks:
  frontend:
  backend:

volumes:
  postgres-data:
```

### Testing Environment

``` yaml
version: '3.8'

services:
  app:
    build: .
    environment:
      - NODE_ENV=test
      - DATABASE_URL=postgresql://test:test@db:5432/testdb
    depends_on:
      - db
    command: npm test

  db:
    image: postgres:16
    environment:
      POSTGRES_USER: test
      POSTGRES_PASSWORD: test
      POSTGRES_DB: testdb
    tmpfs:
      - /var/lib/postgresql/data  # In-memory database for tests
```

---

## Environment Variables

### Using .env File

Create a `.env` file in the same directory as `docker-compose.yml`:

``` env
# Database configuration
POSTGRES_USER=myuser
POSTGRES_PASSWORD=mypassword
POSTGRES_DB=mydb

# Application configuration
NODE_ENV=development
API_PORT=3000
API_KEY=your-secret-key

# External service URLs
REDIS_URL=redis://redis:6379
```

Reference in `docker-compose.yml`:

``` yaml
version: '3.8'

services:
  web:
    environment:
      - NODE_ENV=${NODE_ENV}
      - API_PORT=${API_PORT}
      - API_KEY=${API_KEY}
  
  db:
    environment:
      - POSTGRES_USER=${POSTGRES_USER}
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
      - POSTGRES_DB=${POSTGRES_DB}
```

### Multiple Environment Files

``` yaml
services:
  web:
    env_file:
      - .env.common
      - .env.development
      - .env.local
```

---

## Networking

### Default Network

``` yaml
# Services automatically join a default network
services:
  web:
    image: nginx
  db:
    image: postgres
# Both can communicate using service names: http://web, postgresql://db:5432
```

### Custom Networks

``` yaml
services:
  frontend:
    networks:
      - frontend-net
  
  backend:
    networks:
      - frontend-net
      - backend-net
  
  db:
    networks:
      - backend-net

networks:
  frontend-net:
    driver: bridge
  backend-net:
    driver: bridge
    internal: true  # No external access
```

### External Networks

``` yaml
services:
  web:
    networks:
      - existing-network

networks:
  existing-network:
    external: true
```

---

## Volumes

### Named Volumes

``` yaml
services:
  db:
    volumes:
      - postgres-data:/var/lib/postgresql/data

volumes:
  postgres-data:
    driver: local
```

### Bind Mounts

``` yaml
services:
  web:
    volumes:
      - ./app:/usr/src/app        # Relative path
      - /opt/data:/data:ro        # Absolute path, read-only
      - ~/configs:/etc/configs    # Home directory
```

### Volume Management Commands

``` bash
# List volumes
docker compose volume ls

# Remove volumes
docker compose down -v

# Create volume manually
docker volume create my-volume

# Inspect volume
docker volume inspect my-volume

# Remove unused volumes
docker volume prune
```

---

## Multi-File Compose

### Override Files

``` bash
# docker-compose.yml (base)
version: '3.8'
services:
  web:
    image: myapp:latest
    environment:
      - NODE_ENV=production

# docker-compose.override.yml (automatically merged)
version: '3.8'
services:
  web:
    environment:
      - DEBUG=true
    ports:
      - "3000:3000"

# Use both files (automatic)
docker compose up

# Explicitly specify files
docker compose -f docker-compose.yml -f docker-compose.dev.yml up
```

### Environment-Specific Configurations

``` bash
# Production
docker compose -f docker-compose.yml -f docker-compose.prod.yml up

# Development
docker compose -f docker-compose.yml -f docker-compose.dev.yml up

# Testing
docker compose -f docker-compose.yml -f docker-compose.test.yml up
```

---

## Troubleshooting

### View Service Status

``` bash
# Check running services
docker compose ps

# Check service logs
docker compose logs <service-name>

# Check service health
docker compose ps --format json | jq '.[].Health'
```

### Container Not Starting

``` bash
# View detailed logs
docker compose logs -f <service-name>

# Check container status
docker compose ps -a

# Inspect container
docker inspect <container-name>

# Execute command in container
docker compose exec <service-name> sh
```

### Port Already in Use

``` bash
# Find process using port
# Windows
netstat -ano | findstr :<port>

# Linux/Mac
lsof -i :<port>
sudo ss -tulpn | grep :<port>

# Change port in docker-compose.yml
ports:
  - "3001:3000"  # Use different host port
```

### Network Issues

``` bash
# List networks
docker network ls

# Inspect network
docker network inspect <network-name>

# Test connectivity between services
docker compose exec web ping db
docker compose exec web nc -zv db 5432
```

### Volume Permission Issues

``` yaml
# Run container as specific user
services:
  web:
    user: "1000:1000"  # UID:GID
    volumes:
      - ./data:/app/data
```

### Clear Everything and Restart

``` bash
# Stop and remove everything
docker compose down -v

# Remove all containers, images, volumes
docker compose down -v --rmi all

# Rebuild and start fresh
docker compose build --no-cache
docker compose up -d
```

### Performance Issues

``` bash
# Check resource usage
docker compose stats

# Limit resources
services:
  web:
    deploy:
      resources:
        limits:
          memory: 512M
          cpus: '0.5'
```

---

## Best Practices

### Development Best Practices

1. **Use .env files** for environment-specific configuration
2. **Use bind mounts** for live code reloading during development
3. **Use named volumes** for persistent data
4. **Set container names** for easier debugging
5. **Use health checks** to ensure services are ready
6. **Use depends_on** to define service dependencies
7. **Keep docker-compose.yml** in version control
8. **Exclude .env** files from version control (use .env.example)

### Production Considerations

1. **Don't use bind mounts** in production
2. **Use specific image tags** instead of `latest`
3. **Set restart policies** to `always` or `unless-stopped`
4. **Use secrets** for sensitive data
5. **Implement health checks** for all services
6. **Set resource limits** for containers
7. **Use multi-stage builds** to reduce image size
8. **Separate production** compose file from development

### Security Best Practices

1. **Don't commit .env files** with secrets
2. **Use Docker secrets** for sensitive data
3. **Run containers as non-root** user when possible
4. **Use read-only** volumes where appropriate
5. **Limit network exposure** (use internal networks)
6. **Keep images updated** regularly
7. **Scan images** for vulnerabilities

---

## Useful Commands Summary

``` bash
# Lifecycle
docker compose up -d                 # Start services
docker compose down                  # Stop and remove services
docker compose restart               # Restart services

# Building
docker compose build                 # Build images
docker compose build --no-cache      # Build without cache

# Logs and monitoring
docker compose logs -f               # Follow logs
docker compose ps                    # List containers
docker compose top                   # Show running processes
docker compose stats                 # Show resource usage

# Execution
docker compose exec <service> sh     # Execute shell in service
docker compose run --rm <service> cmd # Run one-off command

# Cleanup
docker compose down -v               # Remove volumes
docker compose down --rmi all        # Remove images
docker system prune -a --volumes     # Clean everything
```

---

## References

- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Compose File Reference](https://docs.docker.com/compose/compose-file/)
- [Docker Commands Cheat Sheet](docker-cheat-sheet.md)
- [Dockerfile Best Practices](dockerfile-cheat-sheet.md)
- [Kubernetes vs Docker Compose](https://docs.docker.com/compose/migrate-to-kubernetes/)
- [Docker Compose GitHub Repository](https://github.com/docker/compose)

---

**Last Updated:** December 30, 2025
