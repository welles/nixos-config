#!/usr/bin/env bash

# User NPM Package Installer
# Installs or updates a list of npm packages into ~/.npm-global

PACKAGES=("$@")

if [ ${#PACKAGES[@]} -eq 0 ]; then
    echo "No packages provided to install."
    exit 0
fi

# Ensure npm is available
if ! command -v npm &> /dev/null; then
    echo "Error: npm not found. Please ensure nodejs is installed."
    exit 1
fi

# npm will use the prefix from ~/.npmrc automatically
# but we can be explicit to be safe
NPM_PREFIX="$HOME/.npm-global"
mkdir -p "$NPM_PREFIX"

echo "User NPM Install started at $(date)"
echo "Packages: ${PACKAGES[*]}"

for pkg in "${PACKAGES[@]}"; do
    echo "Processing $pkg..."
    if npm install -g "$pkg"; then
        echo "Successfully installed/updated $pkg"
    else
        echo "Failed to install $pkg"
    fi
done

echo "User NPM Install finished at $(date)"
