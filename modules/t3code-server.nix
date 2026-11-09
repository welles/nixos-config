# T3 Code server (pingdotgg/t3code) with its web app
#
# `t3 serve` runs as the user on port 3773 of all interfaces, with
# ~/workspace as the working directory of new sessions. The port is not
# opened in the firewall: the host decides who may reach it (e.g. the
# Cloudflare Tunnel host through `trustedSubnets`).
#
# Every browser has to be paired once on top: open the pairing URL from
# `journalctl -u t3code-server` (printed at startup) or create a fresh one
# with `t3 pair`, replacing its address with the public one. State lives in
# ~/.t3.
#
# The agents come from the system (claude-code, codex, ...), not from the
# package's wrapper: its bundled codex is the unpatched nixpkgs one.
{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: let
  t3code = pkgs.t3code.override {enableCodex = false;};
  home = "/home/${user}";
in {
  environment.systemPackages = [t3code];

  systemd.services.t3code-server = {
    description = "T3 Code server";
    wantedBy = ["multi-user.target"];
    wants = ["network-online.target"];
    after = ["network-online.target"];
    # Everything the agents and terminals may need
    path = ["/run/current-system/sw" "/etc/profiles/per-user/${user}"];
    serviceConfig = {
      User = user;
      WorkingDirectory = home;
      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${home}/workspace";
      ExecStart = "${t3code}/bin/t3 serve --mode web --host 0.0.0.0 --port 3773 --no-browser ${home}/workspace";
      Restart = "always";
      RestartSec = "10s";
    };
  };

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".t3"];
  };
}
