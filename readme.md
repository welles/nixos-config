# Commands

## Set Host Name

```bash
export HOSTNAME=...
```

## Clone Repository

```bash
nix-shell --packages git --run "git clone https://github.com/welles/nixos-config ~/nixos" && cd ~/nixos
```

## Hardware Configuration

```bash
sudo nixos-generate-config --root /mnt --no-filesystems --show-hardware-config > ./machines/$HOSTNAME/hardware-configuration.nix
```

## Zero Out Existing Disk
```bash
sudo sgdisk --zap-all /dev/nvme0n1
sudo wipefs -a /dev/nvme0n1
sudo blkdiscard -f /dev/nvme0n1 # SSD only

```

## Disko

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko --flake ".#$HOSTNAME"
```

## Impermanence
```bash
sudo zfs snapshot bucket/root@blank
```

## Increase Live USB Disk Size
```bash
sudo swapon /dev/... # Enable swap on disk
sudo mount -o remount,size=20G,noatime / # Increase tmpfs of live USB to RAM+Swap-20% gigabytes
```

## Install

```bash
sudo nixos-install --flake ".#$HOSTNAME" --no-root-passwd
```

## Update

```bash
sudo nixos-rebuild switch --flake .#$HOSTNAME --refresh

```