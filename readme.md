# Commands

## Disko

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko --flake ".#$HOSTNAME"
```

## Hardware Configuration

```bash
sudo nixos-generate-config --root /mnt --no-filesystems --show-hardware-config > ./machines/$HOSTNAME/hardware-configuration.nix
```

## Install

```bash
sudo nixos-install --flake ".#$HOSTNAME" --no-root-passwd
```
