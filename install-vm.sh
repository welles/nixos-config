#!/usr/bin/env bash

# Stop on error
set -e

REPO_URL="https://github.com/welles/nixos-config.git"
FLAKE_ATTR="nico-vm-nixos"

# --- Step 0: Disk Detection ---
# Find the first disk that isn't a loop device or cdrom
DETECTED_DISK=$(lsblk -nd --output NAME,TYPE,TRAN | grep -v "loop" | grep -v "rom" | grep -v "usb" | head -n 1 | awk '{print "/dev/"$1}')

if [ -z "$DETECTED_DISK" ]; then
    echo "Error: No suitable disk detected automatically."
    echo "Available block devices:"
    lsblk
    read -p "Please enter the device path manually (e.g., /dev/vda): " DETECTED_DISK
else
    echo "Detected target disk: $DETECTED_DISK"
    lsblk "$DETECTED_DISK" --output NAME,SIZE,MODEL,TYPE
fi

read -p "Is this the correct disk to wipe and install NixOS on? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborting."
    exit 1
fi

echo "Step 1: Cloning Configuration..."
# Create a safe temporary directory
TEMP_DIR=$(mktemp -d)
# Ensure cleanup on exit
trap "rm -rf $TEMP_DIR" EXIT

# Ensure git is available
if ! command -v git &> /dev/null; then
    nix-env -iA nixos.git
fi

# Clone to the temporary directory
git clone "$REPO_URL" "$TEMP_DIR"
cd "$TEMP_DIR"

# Patch the disk configuration with the selected disk
# We look for the line 'device = "/dev/vda";' (or similar) and replace the path
sed -i "s|device = \"/dev/[a-z0-9]*\";|device = \"$DETECTED_DISK\";|" machines/nico-vm-nixos/disk-config.nix

echo "Step 2: Partitioning & Mounting (via Disko)..."

echo "Step 2: Partitioning & Mounting (via Disko)..."
# Run disko to partition, format, and mount to /mnt
nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko --flake ".#$FLAKE_ATTR"

echo "Step 2.5: Generating Hardware Configuration..."
# Generate hardware config excluding filesystems (managed by Disko)
nixos-generate-config --root /mnt --no-filesystems --show-hardware-config > machines/nico-vm-nixos/hardware-configuration.nix

echo "Step 3: Installing..."
# Install using the cloned flake
nixos-install --flake ".#$FLAKE_ATTR" --no-root-passwd

echo "Installation complete! You can now reboot."
