#!/bin/bash

# Check if the .dotfiles_repo directory exists, if not, create it
DOTFILES_DIR="$HOME/.dotfiles"
if [ ! -d "$DOTFILES_DIR" ]; then
    mkdir -p "$DOTFILES_DIR"
fi

if [ -z "$1" ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# Get the absolute path of the file
FILE_PATH=$(realpath "$1")

# Get the filename and its directory
FILE_NAME=$(basename "$FILE_PATH")
FILE_DIR=$(dirname "$FILE_PATH")

# Move the file to the .dotfiles_repo directory
mv "$FILE_PATH" "$DOTFILES_DIR/$FILE_NAME"

# Create a symbolic link from the original location to the new location
ln -s "$DOTFILES_DIR/$FILE_NAME" "$FILE_DIR/$FILE_NAME"

echo "Moved $FILE_PATH to $DOTFILES_DIR/$FILE_NAME and created a symbolic link back to $FILE_PATH"

