#!/bin/bash

# Run install_docker.sh
./install_docker.sh

# Run create_folder_structure.sh
./create_folder_structure.sh

# Run add_firewall.sh
./add_firewall.sh

# Run grab_docker_compose_file.sh
./grab_docker_compose_file.sh

# Run create_env_file.sh
./create_env_file.sh
