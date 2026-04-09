{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.programs.npm-packages;
  installScript = pkgs.writeShellScriptBin "npm-global-install" ''
    export PATH=${pkgs.lib.makeBinPath [pkgs.nodejs pkgs.bash pkgs.coreutils pkgs.gnugrep]}:$PATH
    ${builtins.readFile ../scripts/npm-global-install/npm-global-install.sh}
  '';
in {
  options.programs.npm-packages = {
    packages = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [
        "@google/gemini-cli"
        "@anthropic-ai/claude-code"
        "@angular/cli"
        "@google/clasp"
        "@azure/static-web-apps-cli"
        "npm-check-updates"
        "npm"
      ];
      description = "List of npm packages to install globally in user home (~/.npm-global)";
    };
  };

  config = {
    home.packages = [installScript];

    systemd.user.services.npm-install-globals = {
      Unit = {
        Description = "Install/Update user global npm packages";
        After = ["network-online.target"];
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${installScript}/bin/npm-global-install ${lib.escapeShellArgs cfg.packages}";
        ExecStopPost = "${pkgs.bash}/bin/bash -c 'if [ \"$SERVICE_RESULT\" != \"success\" ]; then ${pkgs.libnotify}/bin/notify-send \"NPM Global Install Failed\" \"Check systemctl --user status npm-install-globals for details\" --urgency=critical; fi'";
      };
      Install = {
        WantedBy = ["default.target"];
      };
    };
  };
}
