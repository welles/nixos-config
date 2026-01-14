#!/usr/bin/env bash

set -e

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root (use sudo)"
   exit 1
fi

REPO_URL="https://github.com/welles/nixos-config.git"
FLAKE_ATTR="nico-vm-nixos"

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

TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

if ! command -v git &> /dev/null; then
    nix-env -iA nixos.git
fi

git clone "$REPO_URL" "$TEMP_DIR"
cd "$TEMP_DIR"

sed -i "s|device = \"/dev/[a-z0-9]*\";|device = \"$DETECTED_DISK\";|" machines/nico-vm-nixos/disk-config.nix

sed -i "s|\"INSTALL_DEVICE_PLACEHOLDER\"|\"$DETECTED_DISK\"|" machines/nico-vm-nixos/configuration.nix

nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko --flake ".#$FLAKE_ATTR"

nixos-generate-config --root /mnt --no-filesystems --show-hardware-config > machines/nico-vm-nixos/hardware-configuration.nix

nixos-install --flake ".#$FLAKE_ATTR" --no-root-passwd

echo "Installation complete! You can now reboot."
