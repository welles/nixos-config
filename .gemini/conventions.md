# Project Conventions

- **Formatting:** After modifying any `.nix` file, always run `alejandra <file_path>` on it to ensure consistent formatting.
- **Verification:** After finishing implementing changes, always check the current hostname and perform a dry-run build of the flake for that hostname (e.g., `nix build .#nixosConfigurations.<hostname>.config.system.build.toplevel --dry-run`) to verify the configuration remains valid.
