#!/bin/bash

# Set up logging
log_file="shell.log"
touch "$log_file"
exec 3>&1 4>&2
exec 1>>"$log_file" 2>&1

# Check if argument is provided
if [ $# -eq 0 ]; then
    echo "Error: no project name provided."
    exit 1
fi

# Execute the python file
python3 PATH/TO/FILE "$1"
if [ $? -ne 0 ]; then
    echo "Error: failed to create project directory."
    exit 1
fi

# Navigate to the project directory
cd -P "PATH/TO/PROJECTDIR/$1"
if [ $? -ne 0 ]; then
    echo "Error: failed to navigate to project directory."
    exit 1
fi

# Run git commands
if ! git init; then
    echo "Error: failed to initialize git repository."
    exit 1
fi
touch readme.md
if ! git add .; then
    echo "Error: failed to stage files for commit."
    exit 1
fi
if ! git commit -m 'initial commit'; then
    echo "Error: failed to commit changes."
    exit 1
fi
if ! git remote add origin https://github.com/<USERNAME>/$1.git; then
    echo "Error: failed to set remote repository URL."
    exit 1
fi
if ! git branch -M main; then
    echo "Error: failed to rename main branch."
    exit 1
fi
if ! git push -u origin main; then
    echo "Error: failed to push changes to remote repository."
    exit 1
fi

# Restore stdout and stderr
exec 1>&3 2>&4

echo "Project created successfully."
