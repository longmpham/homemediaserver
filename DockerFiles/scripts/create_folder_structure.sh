#!/bin/bash

# Define folder names
folders=("movies" "tvshows" "anime" "books" "music" "other")
subfolders=("config" "data" "downloads" "media")

# Create root folder with permissions 775
root_folder="$HOME/Docker"
mkdir -p "$root_folder"
chmod 775 "$root_folder"

# Create subfolders with permissions 775
for subfolder in "${subfolders[@]}"; do
    mkdir -p "$root_folder/$subfolder"
    chmod 775 "$root_folder/$subfolder"
done

# Create folders inside downloads with permissions 775
for folder in "${folders[@]}"; do
    mkdir -p "$root_folder/data/downloads/$folder"
    chmod 775 "$root_folder/data/downloads/$folder"
done

# Create folders inside media with permissions 775
for folder in "${folders[@]}"; do
    mkdir -p "$root_folder/data/media/$folder"
    chmod 775 "$root_folder/data/media/$folder"
done

# Additionally, create the 'downloading' folder inside 'downloads' with permissions 775
mkdir -p "$root_folder/data/downloads/downloading"
chmod 775 "$root_folder/data/downloads/downloading"

# Display the folder structure
echo "Folder structure created successfully with permissions set to 775."
echo "# Docker"
echo "# ├── config"
echo "# └── data"
echo "#     ├── downloads"
echo "#     │   ├── downloading"
echo "#     │   ├── movies"
echo "#     │   ├── tvshows"
echo "#     │   ├── anime"
echo "#     │   ├── books"
echo "#     │   ├── music"
echo "#     │   └── other"
echo "#     └── media"
echo "#         ├── movies"
echo "#         ├── tvshows"
echo "#         ├── anime"
echo "#         ├── books"
echo "#         ├── music"
echo "#         └── other"
