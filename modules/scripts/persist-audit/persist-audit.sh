#!/usr/bin/env bash

if [ "$#" -lt 3 ]; then
	echo "Usage: persist-audit.sh <configured_dirs_file> <configured_files_file> <persist_root> [--clean]"
	exit 1
fi

DIRS_FILE="$1"
FILES_FILE="$2"
PERSIST_ROOT="$3"
shift 3

CLEAN=0
for arg in "$@"; do
	case "$arg" in
	--clean) CLEAN=1 ;;
	*)
		echo "Unknown option: $arg" >&2
		exit 1
		;;
	esac
done

if [[ ! -d "$PERSIST_ROOT" ]]; then
	echo "$PERSIST_ROOT directory does not exist."
	exit 0
fi

# Read configured paths into arrays
mapfile -t CONFIGURED_DIRS <"$DIRS_FILE"
mapfile -t CONFIGURED_FILES <"$FILES_FILE"

CONFIGURED_PATHS=()
for p in "${CONFIGURED_DIRS[@]}" "${CONFIGURED_FILES[@]}"; do
	[[ -n "$p" ]] && CONFIGURED_PATHS+=("$p")
done

# Function to check if a path is covered by a configured directory/file
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

# Walk the persist root, pruning covered subtrees, and print paths that
# aren't covered by any configured directory/file
walk_dir() {
	local dir="$1"

	local items
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

dir_status() {
	local p="$1"
	if [[ ! -e "$p" ]]; then
		echo "MISSING"
		return
	fi
	local count
	count=$(find "$p" -mindepth 1 -maxdepth 1 | wc -l)
	if [[ "$count" -eq 0 ]]; then
		echo "EMPTY"
	else
		echo "HAS DATA ($count items)"
	fi
}

file_status() {
	local p="$1"
	if [[ ! -e "$p" ]]; then
		echo "MISSING"
		return
	fi
	local size
	size=$(stat -c%s "$p")
	if [[ "$size" -eq 0 ]]; then
		echo "EMPTY"
	else
		echo "HAS DATA ($size bytes)"
	fi
}

mapfile -t UNCOVERED < <(walk_dir "$PERSIST_ROOT" | sort)

# Build one merged path -> status map: configured directories, configured
# files, and uncovered paths found on disk all live in the same list.
declare -A STATUS
for p in "${CONFIGURED_DIRS[@]}"; do
	[[ -n "$p" ]] && STATUS["$p"]="$(dir_status "$p")"
done
for p in "${CONFIGURED_FILES[@]}"; do
	[[ -n "$p" ]] && STATUS["$p"]="$(file_status "$p")"
done
for p in "${UNCOVERED[@]}"; do
	STATUS["$p"]="UNCOVERED"
done

if [[ ${#STATUS[@]} -eq 0 ]]; then
	echo "No configured persistence paths found for $PERSIST_ROOT."
else
	echo "Persist audit for $PERSIST_ROOT:"
	while IFS= read -r p; do
		printf '  %-22s %s\n' "${STATUS[$p]}" "$p"
	done < <(printf '%s\n' "${!STATUS[@]}" | sort)
fi

if [[ "$CLEAN" -eq 1 && ${#UNCOVERED[@]} -gt 0 ]]; then
	echo
	echo "Cleaning uncovered paths under $PERSIST_ROOT:"
	for item in "${UNCOVERED[@]}"; do
		read -r -p "Delete $item? [y/N] " answer </dev/tty
		if [[ "$answer" =~ ^[Yy]([Ee][Ss])?$ ]]; then
			if rm -rf -- "$item"; then
				echo "Deleted $item"
			else
				echo "Failed to delete $item" >&2
			fi
		else
			echo "Kept $item"
		fi
	done
fi

mapfile -t REMAINING < <(walk_dir "$PERSIST_ROOT" | sort)
if [[ ${#REMAINING[@]} -gt 0 ]]; then
	echo
	echo "Uncovered paths remaining under $PERSIST_ROOT:"
	printf '  %s\n' "${REMAINING[@]}"
	if [[ "$CLEAN" -eq 0 ]]; then
		echo "Run with --clean to interactively delete them."
	fi
	exit 1
fi

exit 0
