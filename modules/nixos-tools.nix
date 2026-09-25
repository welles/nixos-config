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
    (pkgs.writeShellScriptBin "nixos-diff" ''
      TMPDIR=$(mktemp -d)
      trap 'rm -rf "$TMPDIR"' EXIT
      RESULT="$TMPDIR/result"

      echo "Building new configuration..."
      (cd "$TMPDIR" && nixos-rebuild build \
        --flake ${flakeUri}#${hostname} \
        --refresh) || exit 1

      echo ""
      echo "=== Package changes ==="
      ${pkgs.nvd}/bin/nvd diff /run/current-system "$RESULT"

      echo ""
      echo "=== Service changes ==="
      sudo "$RESULT/bin/switch-to-configuration" dry-activate
    '')
    (nhWithSudo "nh-switch" "switch")
    (nhWithSudo "nh-boot" "boot")
  ];

  environment.shellAliases = {
    nixos-switch = "sudo -v && sudo nixos-rebuild switch --flake ${flakeUri}#${hostname} --refresh |& nom";
    nixos-boot = "sudo -v && sudo nixos-rebuild boot --flake ${flakeUri}#${hostname} --refresh |& nom";
  };
}
