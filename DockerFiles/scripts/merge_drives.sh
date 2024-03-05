#currently doesn't work...
#!/bin/bash

# Install MergerFS if not already installed
if ! command -v mergerfs &> /dev/null; then
    echo "MergerFS not found. Installing..."
    sudo apt-get update
    sudo apt-get install mergerfs -y
fi

# Define the mount points for the drives
drive1="/mnt/drive1"
drive2="/mnt/drive2"
drive3="/mnt/drive3"

# Define the mount point for the merged filesystem
merged_mount="/mnt/merged"

# Create the merged mount point if it doesn't exist
mkdir -p "$merged_mount"

# Merge the drives using mergerfs with default permissions set to 775
mergerfs -o defaults,allow_other,use_ino,category.create=mfs "$drive1:$drive2:$drive3" "$merged_mount"
