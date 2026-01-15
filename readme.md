# Commands

## Disko

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko --flake "github:welles/nixos-config#$HOSTNAME"
```

## Hardware Configuration

```bash
sudo nixos-generate-config --root /mnt --no-filesystems --show-hardware-config > ./hardware-configuration.nix
```

## Install

```bash
sudo nixos-install --flake "github:welles/nixos-config#$HOSTNAME" --no-root-passwd
```

## Update

```bash
sudo nixos-rebuild switch --flake github:welles/nixos-config#$HOSTNAME --refresh

```