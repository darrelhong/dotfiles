#!/bin/bash

# Define the source directory (where your config files are located)
source_dir="./fish/"

# Define the destination directory (home folder)
dest_dir="${HOME}/.config/fish"

# Copy the configuration files to the home folder
echo "Copying configuration files from '${source_dir}' to '${dest_dir}'" >&2
cp -r "${source_dir}/." "${dest_dir}/"

echo "Configuration files have been copied successfully." >&2