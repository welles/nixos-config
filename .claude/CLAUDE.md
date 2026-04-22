# Claude Instructions

## After changing .nix files
Ensure all modified `.nix` files are formatted and linted:
1. Run `alejandra <file>` to ensure consistent formatting.
2. Run `deadnix --edit <file>` to remove unused code and fix common issues.
3. Run `statix fix <file>` to apply automated linting fixes.
4. Run `statix check <file>` to identify any remaining linting errors and fix them manually.

## After implementing instructions
1. Infer the hostname of the NixOS flake configuration being worked on (it may differ from the machine Claude is running on — check `flake.nix` for the `nixosConfigurations` attribute names).
2. Stage any newly created `.nix` files with `git add`. Nix flakes only see
   git-tracked files, so untracked files are silently ignored by the build.
3. Dry-run build the configuration to check for errors.

   **Local session:**
   ```
   nixos-rebuild dry-build --flake .#<hostname>
   ```

   **Claude Code on the web (`CLAUDE_CODE_REMOTE=true`):** `api.flakehub.com`
   and `install.determinate.systems` are outside the egress allowlist, so the
   real `determinate` input cannot be fetched. Use the local stub at
   `.claude/stubs/determinate` — it replaces `determinate` with an empty NixOS
   module so the rest of the configuration evaluates normally:
   ```
   nix build --dry-run \
     --override-input determinate path:$CLAUDE_PROJECT_DIR/.claude/stubs/determinate \
     .#nixosConfigurations."<hostname>".config.system.build.toplevel
   ```

4. If any errors are found, fix them automatically and rebuild until it succeeds.
