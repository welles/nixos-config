# Claude Instructions

## After changing .nix files
Run `alejandra` on any modified `.nix` files to ensure consistent formatting:
```
alejandra <file>
```

## After implementing instructions
1. Infer the hostname of the NixOS flake configuration being worked on (it may differ from the machine Claude is running on — check `flake.nix` for the `nixosConfigurations` attribute names).
2. Dry-run build the configuration to check for errors:
   ```
   nixos-rebuild dry-build --flake .#<hostname>
   ```
3. If any errors are found, fix them automatically and rebuild until it succeeds.
