#!/usr/bin/env bash

# ZFS Dataset Creation Helper
# Usage: create-zfs-dataset <pool> <name>

POOL_NAME=$1
DATASET_NAME=$2

# 1. Check if both arguments were provided
if [ -z "$POOL_NAME" ] || [ -z "$DATASET_NAME" ]; then
	echo "Error: Missing arguments."
	echo "Usage: $(basename "$0") <pool> <name>"
	echo "Example: $(basename "$0") tank nextcloud"
	exit 1
fi

# 2. Validate pool name
if [[ "$POOL_NAME" != "tank" && "$POOL_NAME" != "bucket" ]]; then
	echo "Error: Invalid pool '$POOL_NAME'. Must be 'tank' or 'bucket'."
	exit 1
fi

FULL_PATH="$POOL_NAME/$DATASET_NAME"

# 3. Check if dataset already exists
if zfs list "$FULL_PATH" >/dev/null 2>&1; then
	echo "Error: Dataset '$FULL_PATH' already exists."
	exit 1
fi

# 4. Create the dataset with required options
echo "Creating ZFS dataset: $FULL_PATH..."
if sudo zfs create -o mountpoint=legacy -o com.sun:auto-snapshot=true "$FULL_PATH"; then
	echo "Successfully created $FULL_PATH"
else
	echo "Error: Failed to create dataset '$FULL_PATH'."
	exit 1
fi
