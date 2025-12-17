#!/bin/bash

git remote set-url origin https://github.com/isbrandonw/epoch_saas.git
# Script to set up a local Git repository with user configuration

# Repository-specific configuration
git config user.name "$GIT_USER_NAME"
git config user.email "$GIT_USER_EMAIL"

# Check if .env.dev exists and source it
if [ -f ".env.dev" ]; then
	# Source the .env.dev file
	set -a
	source .env.dev
	set +a
else
	echo "Error: .env.dev file not found"
	exit 1
fi

# Check if required variables are set
if [ -z "$GIT_USER_NAME" ] || [ -z "$GIT_USER_EMAIL" ]; then
	echo "Error: GIT_USER_NAME and GIT_USER_EMAIL must be set in .env.dev"
	exit 1
fi

# Check if a directory name is provided
if [ -z "$1" ]; then
	echo "Usage: $0 <directory_name>"
	exit 1
fi

# Set global Git user configuration from .env.dev variables
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"

# Create the directory
mkdir -p "$1"
cd "$1" || exit

# Initialize the Git repository
git init

# Create a README file
echo "# $1" >README.md

# Stage and commit the README file
git add README.md
git commit -m "Initial commit with README"

echo "Local Git repository initialized in $1"
echo "Git user configured as:"
echo "Name: $GIT_USER_NAME"
echo "Email: $GIT_USER_EMAIL"