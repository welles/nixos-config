{
  pkgs,
  hostname,
  ...
}: let
  flakeUri = "github:welles/nixos-config";
in {
  environment.systemPackages = [
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
    nixos-switch = "sudo nixos-rebuild switch --flake ${flakeUri}#${hostname} --refresh";
    nixos-boot = "sudo nixos-rebuild boot --flake ${flakeUri}#${hostname} --refresh";
  };
}
