#!/bin/bash

# Define the base directory
base_dir="$HOME/temp"

# Create temp directory
mkdir -p "$base_dir"
chmod 775 "$base_dir"

# Create Docker directory
docker_dir="$base_dir/Docker"
mkdir -p "$docker_dir"
chmod 775 "$docker_dir"

# Create config directory
config_dir="$docker_dir/config"
mkdir -p "$config_dir"
chmod 775 "$config_dir"

# Create data directory
data_dir="$docker_dir/data"
mkdir -p "$data_dir"
chmod 775 "$data_dir"

# Create downloads directory
downloads_dir="$data_dir/downloads"
mkdir -p "$downloads_dir"
chmod 775 "$downloads_dir"

# Create downloading directory inside downloads
downloading_dir="$downloads_dir/downloading"
mkdir -p "$downloading_dir"
chmod 775 "$downloading_dir"

# Create media directory inside data
media_dir="$data_dir/media"
mkdir -p "$media_dir"
chmod 775 "$media_dir"

# Create subdirectories inside media
subdirs=("movies" "tvshows" "anime" "books" "music" "other")
for subdir in "${subdirs[@]}"; do
    subdir_path="$media_dir/$subdir"
    mkdir -p "$subdir_path"
    chmod 775 "$subdir_path"
done

# Create subdirectories inside downloads
subdirs=("movies" "tvshows" "anime" "books" "music" "other")
for subdir in "${subdirs[@]}"; do
    subdir_path="$downloads_dir/$subdir"
    mkdir -p "$subdir_path"
    chmod 775 "$subdir_path"
done

