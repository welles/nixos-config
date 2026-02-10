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

## Disko

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko --flake ".#$HOSTNAME"
```

## Install

```bash
sudo nixos-install --flake ".#$HOSTNAME" --no-root-passwd
```

## Update

```bash
sudo nixos-rebuild switch --flake .#$HOSTNAME --refresh

```