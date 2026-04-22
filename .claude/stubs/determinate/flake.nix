{
  # Stub for the `determinate` flake input, used only during web-session
  # evaluation (CLAUDE_CODE_REMOTE=true).  api.flakehub.com and
  # install.determinate.systems are outside the egress allowlist, so the real
  # input cannot be fetched.  This stub provides an empty NixOS module so the
  # rest of the configuration can still be evaluated with `nix build --dry-run`.
  #
  # Usage (see CLAUDE.md):
  #   nix build --dry-run \
  #     --override-input determinate path:$CLAUDE_PROJECT_DIR/.claude/stubs/determinate \
  #     .#nixosConfigurations."<hostname>".config.system.build.toplevel
  description = "determinate stub (web evaluation only)";
  inputs = {};
  outputs = _: {
    nixosModules.default = {};
  };
}
