#!/usr/bin/env bash
# ZFS Manual Snapshot
# Creates a snapshot of the ZFS dataset containing the current directory.
# Usage: zfs-manual-snapshot

set -euo pipefail

# Determine if the current directory is on a ZFS dataset
DATASET=$(df --output=fstype,source . 2>/dev/null | tail -n1 | awk '$1 == "zfs" {print $2}')

if [ -z "$DATASET" ]; then
	echo "Error: '$(pwd)' is not inside a ZFS dataset (or dataset could not be determined)."
	exit 1
fi

# Build snapshot name
TIMESTAMP=$(date +%Y-%m-%d-%Hh%M)
SNAPSHOT="${DATASET}@zfs-manual-snap-${TIMESTAMP}"

echo "Dataset:  $DATASET"
echo "Snapshot: $SNAPSHOT"

if sudo zfs snapshot "$SNAPSHOT"; then
	echo "Snapshot created successfully."
else
	echo "Error: Failed to create snapshot '$SNAPSHOT'."
	exit 1
fi
