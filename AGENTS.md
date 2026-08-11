# Repository Instructions

## After changing `.nix` files

Ensure every modified `.nix` file is formatted and linted:

1. Run `alejandra <file>` to apply consistent formatting.
2. Run `deadnix --edit <file>` to remove unused code and fix common issues.
3. Run `statix fix <file>` to apply automated linting fixes.
4. Run `statix check <file>` and fix any remaining linting errors manually.

## After implementing changes

1. Infer the hostname of the NixOS flake configuration being worked on. It may
   differ from the machine running Codex; check the `nixosConfigurations`
   attribute names in `flake.nix`.
2. Build the configuration to check for errors without modifying the host:

   ```sh
   nix build .#nixosConfigurations.<hostname>.config.system.build.toplevel --no-link
   ```

3. If the build fails, fix the errors and rebuild until it succeeds.

## Building new files

Nix flakes backed by Git ignore untracked files. Before building a configuration
that imports a new file, add the file to Git so Nix includes it in the flake
source.
