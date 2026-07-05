#!/usr/bin/env bash

if [ "$#" -lt 2 ]; then
	echo "Usage: check-persist.sh <configured_paths_file> <persist_root>"
	exit 1
fi

PATHS_FILE="$1"
PERSIST_ROOT="$2"

if [[ ! -d "$PERSIST_ROOT" ]]; then
	echo "$PERSIST_ROOT directory does not exist."
	exit 0
fi

# Read configured paths into an array
mapfile -t CONFIGURED_PATHS <"$PATHS_FILE"

# Function to check if a path is covered
# Returns:
# 0: fully_covered (exact match or descendant of configured path)
# 1: needs_search (ancestor of configured path)
# 2: not_covered
check_path() {
	local p="$1"
	local needs_search=2

	for c_path in "${CONFIGURED_PATHS[@]}"; do
		if [[ "$p" == "$c_path" ]]; then
			return 0
		fi

		# p is a descendant of c_path
		if [[ "$p" == "$c_path"/* ]]; then
			return 0
		fi

		# p is an ancestor of c_path
		if [[ "$c_path" == "$p"/* ]]; then
			needs_search=1
		fi
	done

	return $needs_search
}

walk_dir() {
	local dir="$1"

	# Read directory contents
	local items
	# Using find to list immediate children safely
	mapfile -t items < <(find "$dir" -mindepth 1 -maxdepth 1)

	for item in "${items[@]}"; do
		check_path "$item"
		local status=$?

		if [[ $status -eq 2 ]]; then
			echo "$item"
		elif [[ $status -eq 1 ]]; then
			if [[ -d "$item" ]]; then
				walk_dir "$item"
			else
				echo "$item"
			fi
		fi
		# If status -eq 0, fully covered, do nothing (prune)
	done
}

LEFTOVERS=$(walk_dir "$PERSIST_ROOT")

if [[ -n "$LEFTOVERS" ]]; then
	echo "Found leftover files/directories in $PERSIST_ROOT:"
	# Sort the leftovers alphabetically
	echo "$LEFTOVERS" | sort
	exit 1
else
	echo "No leftover files found in $PERSIST_ROOT."
	exit 0
fi
