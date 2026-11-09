# CloudCLI UI (formerly Claude Code UI, siteboon/claudecodeui)
#
# Web UI for the user's Claude Code, Codex and Cursor sessions, running as
# the user on port 3001. The firewall lets only the addresses in
# `webUiSources` (e.g. the Cloudflare Tunnel host) reach that port.
#
# Its own login comes on top: the first visitor creates the only account,
# so do that right after the first deploy. Data (account database, uploads)
# lives in ~/.cloudcli.
{
  lib,
  pkgs,
  user,
  persistRoot,
  webUiSources,
  ...
}: let
  cloudcli = pkgs.callPackage ./package.nix {};
  port = 3001;
in {
  imports = [../nftables.nix];

  systemd.services.cloudcli = {
    description = "CloudCLI UI";
    wantedBy = ["multi-user.target"];
    wants = ["network-online.target"];
    after = ["network-online.target"];
    # Everything the agents and the integrated terminal may need
    path = ["/run/current-system/sw" "/etc/profiles/per-user/${user}"];
    environment = {
      HOST = "0.0.0.0";
      SERVER_PORT = toString port;
      NODE_ENV = "production";
    };
    serviceConfig = {
      User = user;
      WorkingDirectory = "/home/${user}";
      ExecStart = lib.getExe cloudcli;
      Restart = "always";
      RestartSec = "10s";
    };
  };

  networking.firewall.extraInputRules =
    lib.concatMapStrings (source: ''
      ip saddr ${source} tcp dport ${toString port} accept
    '')
    webUiSources;

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".cloudcli"];
  };
}
