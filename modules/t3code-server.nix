# T3 Code server (pingdotgg/t3code) with its web app
#
# `t3 serve` runs as the user on port 3773, with ~/workspace as the working
# directory of new sessions. The firewall lets only the addresses in
# `webUiSources` (e.g. the Cloudflare Tunnel host) reach that port.
#
# Every browser has to be paired once on top: open the pairing URL from
# `journalctl -u t3code-server` (printed at startup) or create a fresh one
# with `t3 pair`, replacing its address with the public one. State lives in
# ~/.t3.
#
# The agents come from the system (claude-code, codex, ...), not from the
# package's wrapper.
{
  lib,
  pkgs,
  user,
  persistRoot,
  webUiSources,
  ...
}: let
  # Workaround (see CURRENT_WORKAROUNDS.md): the wrapper's bundled codex is
  # the nixpkgs one, which does not build. Drop `enableCodex = false` once
  # pkgs.codex builds unpatched again.
  t3code = pkgs.t3code.override {enableCodex = false;};
  home = "/home/${user}";
  port = 3773;
in {
  imports = [./nftables.nix];

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
      ExecStart = "${t3code}/bin/t3 serve --mode web --host 0.0.0.0 --port ${toString port} --no-browser ${home}/workspace";
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
    ${persistRoot}.users.${user}.directories = [".t3"];
  };
}
