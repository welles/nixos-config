{
  pkgs,
  hostname,
  ...
}: let
  flakeUri = "github:welles/nixos-config";

  # nh builds as the user and only elevates at the end, so prompt for sudo up
  # front and keep the credentials fresh until nh exits.
  nhWithSudo = name: action:
    pkgs.writeShellScriptBin name ''
      sudo -v || exit 1
      while sleep 60; do sudo -n -v || exit; done 2>/dev/null &
      KEEPALIVE=$!
      trap 'kill "$KEEPALIVE" 2>/dev/null' EXIT

      nh os ${action} ${flakeUri}#${hostname} "$@" -- --refresh
    '';
in {
  environment.systemPackages = [
    pkgs.nix-output-monitor
    pkgs.nh
    # Shows what a switch would change and recommends `switch` or `boot`.
    (pkgs.writeShellApplication {
      name = "nixos-diff";
      runtimeInputs = [pkgs.nh pkgs.nix-output-monitor pkgs.jq pkgs.diffutils];
      runtimeEnv.DEFAULT_FLAKE = "${flakeUri}#${hostname}";
      text = builtins.readFile ./nixos-diff.sh;
    })
    (nhWithSudo "nh-switch" "switch")
    (nhWithSudo "nh-boot" "boot")
  ];

  environment.shellAliases = {
    nixos-switch = "sudo -v && sudo nixos-rebuild switch --flake ${flakeUri}#${hostname} --refresh |& nom";
    nixos-boot = "sudo -v && sudo nixos-rebuild boot --flake ${flakeUri}#${hostname} --refresh |& nom";
  };
}
