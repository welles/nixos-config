# VS Code Remote Tunnel
#
# A permanent `code tunnel` (official Microsoft relay) named after the host
# makes the VM reachable from vscode.dev or a local VS Code ("Remote -
# Tunnels") after signing in with GitHub. The tunnel downloads the matching
# VS Code server into ~/.vscode (persisted by modules/packages/vscode.nix,
# like the tunnel's login), which runs via nix-ld.
#
# One-time setup: `code tunnel user login --provider github`, then
# `sudo systemctl restart vscode-tunnel`.
{
  hostname,
  pkgs,
  user,
  ...
}: {
  systemd.services.vscode-tunnel = {
    description = "VS Code Remote Tunnel";
    wantedBy = ["multi-user.target"];
    wants = ["network-online.target"];
    after = ["network-online.target"];
    # Everything the remote terminals and extensions may need
    path = ["/run/current-system/sw" "/etc/profiles/per-user/${user}"];
    serviceConfig = {
      User = user;
      WorkingDirectory = "/home/${user}/workspace";
      ExecStart = "${pkgs.vscode}/bin/code tunnel --accept-server-license-terms --name ${hostname}";
      Restart = "always";
      RestartSec = "30s";
    };
  };
}
