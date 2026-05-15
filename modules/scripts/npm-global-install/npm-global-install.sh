#!/usr/bin/env bash

# User NPM Package Updater
# Updates globally installed npm packages in ~/.npm-global

# Ensure npm is available
if ! command -v npm &>/dev/null; then
	echo "Error: npm not found. Please ensure nodejs is installed."
	exit 1
fi

# Ensure jq is available
if ! command -v jq &>/dev/null; then
	echo "Error: jq not found. Please ensure it is installed."
	exit 1
fi

echo "User NPM Global Update started at $(date)"

# Get the list of currently installed global packages
mapfile -t PACKAGES < <(npm ls -g --depth=0 --json | jq -r '(.dependencies // {}) | keys[]')

if [ ${#PACKAGES[@]} -eq 0 ] || [ -z "${PACKAGES[0]}" ]; then
	echo "No globally installed packages found to update."
	echo "User NPM Global Update finished at $(date)"
	exit 0
fi

echo "Packages to update: ${PACKAGES[*]}"

for pkg in "${PACKAGES[@]}"; do
	echo "Updating $pkg..."
	if npm install -g "$pkg@latest"; then
		echo "Successfully updated $pkg"
	else
		echo "Failed to update $pkg"
	fi
done

echo "User NPM Global Update finished at $(date)"
