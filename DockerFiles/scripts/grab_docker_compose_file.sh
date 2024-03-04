#!/bin/bash

# Define variables
github_repo="https://raw.githubusercontent.com/longmpham/homemediaserver/main/DockerFiles/docker-compose.yml"
destination_folder="$HOME/Docker/config"
#destination_folder="$HOME/temp/config"
# Create the destination folder if it doesn't exist
mkdir -p "$destination_folder"

# Download the docker-compose.yml file using curl
curl -o "$destination_folder/docker-compose.yml" "$github_repo"
