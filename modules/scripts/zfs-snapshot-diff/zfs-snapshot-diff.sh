#!/usr/bin/env bash
# ZFS Snapshot Diff
# Shows the diff between the current state of the ZFS dataset containing the
# current directory and its most recent snapshot.
# Usage: zfs-snapshot-diff [-m|--manual-only]

set -euo pipefail

MANUAL_ONLY=0

usage() {
	echo "Usage: zfs-snapshot-diff [-m|--manual-only]"
	echo ""
	echo "  -m, --manual-only   Compare against the latest snapshot not created by"
	echo "                      the auto-snapshot feature (i.e. exclude snapshots"
	echo "                      whose name starts with 'zfs-auto-snap_')."
	exit 1
}

while [[ $# -gt 0 ]]; do
	case "$1" in
	-m | --manual-only)
		MANUAL_ONLY=1
		shift
		;;
	-h | --help) usage ;;
	*)
		echo "Unknown option: $1"
		usage
		;;
	esac
done

# Determine if the current directory is on a ZFS dataset
DATASET=$(df --output=fstype,source . 2>/dev/null | tail -n1 | awk '$1 == "zfs" {print $2}')

if [ -z "$DATASET" ]; then
	echo "Error: '$(pwd)' is not inside a ZFS dataset (or dataset could not be determined)."
	exit 1
fi

# Find the latest snapshot of the dataset (-S creation = descending by creation time)
if [[ $MANUAL_ONLY -eq 1 ]]; then
	LATEST_SNAPSHOT=$(zfs list -t snapshot -H -S creation -d 1 -o name "$DATASET" 2>/dev/null |
		awk -F'@' '$2 !~ /^zfs-auto-snap_/' | head -n1)
else
	LATEST_SNAPSHOT=$(zfs list -t snapshot -H -S creation -d 1 -o name "$DATASET" 2>/dev/null | head -n1)
fi

if [ -z "$LATEST_SNAPSHOT" ]; then
	if [[ $MANUAL_ONLY -eq 1 ]]; then
		echo "Error: No manual snapshots found for dataset '$DATASET'."
	else
		echo "Error: No snapshots found for dataset '$DATASET'."
	fi
	exit 1
fi

echo "Dataset:         $DATASET"
echo "Latest snapshot: $LATEST_SNAPSHOT"
echo ""

sudo zfs diff "$LATEST_SNAPSHOT" "$DATASET"
