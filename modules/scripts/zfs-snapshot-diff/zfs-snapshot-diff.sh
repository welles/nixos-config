#!/usr/bin/env bash
# ZFS Snapshot Diff
# Shows the diff between the current state of the ZFS dataset containing the
# current directory and its most recent snapshot.
# Usage: zfs-snapshot-diff

set -euo pipefail

# Determine if the current directory is on a ZFS dataset
DATASET=$(df --output=fstype,source . 2>/dev/null | tail -n1 | awk '$1 == "zfs" {print $2}')

if [ -z "$DATASET" ]; then
    echo "Error: '$(pwd)' is not inside a ZFS dataset (or dataset could not be determined)."
    exit 1
fi

# Find the latest snapshot of the dataset (-S creation = descending by creation time)
LATEST_SNAPSHOT=$(zfs list -t snapshot -H -S creation -d 1 -o name "$DATASET" 2>/dev/null | head -n1)

if [ -z "$LATEST_SNAPSHOT" ]; then
    echo "Error: No snapshots found for dataset '$DATASET'."
    exit 1
fi

echo "Dataset:         $DATASET"
echo "Latest snapshot: $LATEST_SNAPSHOT"
echo ""

sudo zfs diff "$LATEST_SNAPSHOT" "$DATASET"
