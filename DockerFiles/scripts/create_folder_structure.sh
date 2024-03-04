#!/bin/bash

# Define folder names
folders=("movies" "tvshows" "anime" "books" "music" "other")
subfolders=("config" "data" "downloads" "media")

# Create root folder with permissions 775
root_folder="$HOME/Docker"
mkdir -p "$root_folder" && chmod 775 "$root_folder"

# Create config and data folder with permissions 775
config_folder="$root_folder/config"
data_folder="$root_folder/data"
mkdir -p "$config_folder" && chmod 775 "$config_folder"
mkdir -p "$data_folder" && chmod 775 "$data_folder"

# Create downloads and media folder with permissions 775
downloads_folder="$data_folder/downloads"
media_folder="$data_folder/media"
mkdir -p "$downloads_folder" && chmod 775 "$downloads_folder"
mkdir -p "$media_folder" && chmod 775 "$media_folder"

# Create folders inside downloads with permissions 775
downloads_folders=("downloading" "movies" "tvshows" "anime" "books" "music" "other" "torrent_files")
for folder in "${folders[@]}"; do
    mkdir -p "$downloads_folder/$folder" && chmod 775 "$downloads_folder/$folder"
done

# Create folders inside media with permissions 775
media_folders=("movies" "tvshows" "anime" "books" "music" "other")
for folder in "${folders[@]}"; do
    mkdir -p "$media_folder/$folder"
    chmod 775 "$media_folder/$folder"
done

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
