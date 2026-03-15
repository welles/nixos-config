#!/usr/bin/env bash

# MKV Integrity Check Helper
# Usage: check-mkv <directory>

TARGET_DIR=$1

if [ -z "$TARGET_DIR" ]; then
    echo "Error: No directory provided."
    echo "Usage: $(basename "$0") <directory>"
    exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' not found."
    exit 1
fi

# Check for ffmpeg/ffprobe
if ! command -v ffmpeg &> /dev/null || ! command -v ffprobe &> /dev/null; then
    echo "Error: ffmpeg/ffprobe not found. Please ensure they are installed."
    exit 1
fi

BROKEN_FILES=()
TOTAL=0
PROCESSED=0

# Find all mkv files recursively
mapfile -d $'\0' MKV_FILES < <(find "$TARGET_DIR" -type f -name "*.mkv" -print0)
TOTAL=${#MKV_FILES[@]}

if [ "$TOTAL" -eq 0 ]; then
    echo "No .mkv files found in $TARGET_DIR."
    exit 0
fi

echo "Scanning $TOTAL MKV files for errors..."
echo "------------------------------------------------"

for file in "${MKV_FILES[@]}"; do
    ((PROCESSED++))
    # Print progress with a truncated filename for a compact report
    printf "[%d/%d] %-60.60s " "$PROCESSED" "$TOTAL" "$(basename "$file")"
    
    # 1. ffprobe checks if headers are readable and streams are valid
    # 2. ffmpeg attempts a quick decode of the first 5 seconds to ensure playback starts
    if ffprobe -v error -i "$file" &>/dev/null && \
       ffmpeg -v error -t 5 -i "$file" -f null - &>/dev/null; then
        echo -e "\e[32m[PASS]\e[0m"
    else
        echo -e "\e[31m[FAIL]\e[0m"
        BROKEN_FILES+=("$file")
    fi
done

echo "------------------------------------------------"
echo "Scan complete."
echo "Total files processed: $TOTAL"
echo "Broken files found: ${#BROKEN_FILES[@]}"

if [ ${#BROKEN_FILES[@]} -ne 0 ]; then
    echo -e "\n\e[31mSummary of Broken Files:\e[0m"
    for broken in "${BROKEN_FILES[@]}"; do
        echo " - $broken"
    done
    exit 1
fi

exit 0
