{
  pkgs,
  hostname,
  ...
}: let
  flakeUri = "github:welles/nixos-config";
in {
  environment.systemPackages = [
    pkgs.nix-output-monitor
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
  ];

  environment.shellAliases = {
    nixos-switch = "sudo -v && sudo nixos-rebuild switch --flake ${flakeUri}#${hostname} --refresh |& nom";
    nixos-boot = "sudo -v && sudo nixos-rebuild boot --flake ${flakeUri}#${hostname} --refresh |& nom";
  };
}
