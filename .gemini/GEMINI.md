# Gemini CLI Instructions

## After changing .nix files
Ensure all modified `.nix` files are formatted and linted:
1. Run `alejandra <file>` to ensure consistent formatting.
2. Run `deadnix --edit <file>` to remove unused code and fix common issues.
3. Run `statix fix <file>` to apply automated linting fixes.
4. Run `statix check <file>` to identify any remaining linting errors and fix them manually.

## After implementing instructions
1. Infer the hostname of the NixOS flake configuration being worked on (it may differ from the machine Gemini CLI is running on — check `flake.nix` for the `nixosConfigurations` attribute names).
2. Dry-run build the configuration to check for errors:
   ```
   nixos-rebuild dry-build --flake .#<hostname>
   ```
3. If any errors are found, fix them automatically and rebuild until it succeeds.
