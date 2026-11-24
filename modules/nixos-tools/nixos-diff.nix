# The `nixos-diff` command (nixos-diff.sh) for a flake reference; shared by
# this module and modules/nixos-control. Not a module: call it with
# `import ./nixos-diff.nix {inherit pkgs; flake = "...#host";}`.
{
  pkgs,
  flake,
}:
pkgs.writeShellApplication {
  name = "nixos-diff";
  runtimeInputs = [pkgs.nh pkgs.nix-output-monitor pkgs.jq pkgs.diffutils];
  runtimeEnv.DEFAULT_FLAKE = flake;
  text = builtins.readFile ./nixos-diff.sh;
}
