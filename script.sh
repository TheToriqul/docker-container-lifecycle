#!/bin/bash

###############################################################################
#
# Docker Container Lifecycle Management Commands Reference
# Author: Md Toriqul Islam
# Description: Command reference for managing Docker container lifecycle states
# Note: This is a reference script. Do not execute directly.
#
###############################################################################

#------------------------------------------------------------------------------
# Container Creation & Initialization
#------------------------------------------------------------------------------

# Method 1: Create and start a container with interactive shell
# Creates a named container with Ubuntu image and bash shell access
docker run --name percy -it ubuntu:latest /bin/bash

# Method 2: Create container in detached mode
# Runs container in background with specific port mapping
docker run --name percy-detached -d -p 80:80 ubuntu:latest

# Method 3: Create container with resource limits
# Sets memory and CPU constraints for the container
docker run --name percy-limited -it --memory="512m" --cpus="1.0" ubuntu:latest /bin/bash

#------------------------------------------------------------------------------
# Container State Management
#------------------------------------------------------------------------------

# List all running containers
docker ps

# List all containers (including stopped ones)
docker ps -a

# Stop a running container
docker stop percy

# Start a stopped container
docker start percy

# Restart a container
docker restart percy

# Pause container processes
docker pause percy

# Unpause container processes
docker unpause percy

#------------------------------------------------------------------------------
# Container Interaction & Monitoring
#------------------------------------------------------------------------------

# Attach to a running container
docker attach percy

# Execute command in running container
docker exec -it percy bash

# View container logs
docker logs percy

# Follow container logs in real-time
docker logs -f percy

# Show container resource usage statistics
docker stats percy

# Display detailed container information
docker inspect percy

#------------------------------------------------------------------------------
# Data Management & Persistence
#------------------------------------------------------------------------------

# Copy file from host to container
docker cp ./localfile percy:/path/in/container

# Copy file from container to host
docker cp percy:/path/in/container ./localfile

# Create a volume
docker volume create percy-volume

# Run container with volume mount
docker run --name percy-data -v percy-volume:/data ubuntu:latest

#------------------------------------------------------------------------------
# Container Cleanup Operations
#------------------------------------------------------------------------------

# Remove a stopped container
docker rm percy

# Force remove a running container
docker rm -f percy

# Remove all stopped containers
docker container prune

# Remove container and its volume
docker rm -v percy

#------------------------------------------------------------------------------
# Image Management
#------------------------------------------------------------------------------

# List available images
docker images

# Remove an image
docker rmi ubuntu:latest

# Remove unused images
docker image prune

#------------------------------------------------------------------------------
# Network Operations
#------------------------------------------------------------------------------

# List container networks
docker network ls

# Create a network
docker network create percy-network

# Connect container to network
docker network connect percy-network percy

# Disconnect container from network
docker network disconnect percy-network percy

###############################################################################
# End of Command Reference
###############################################################################