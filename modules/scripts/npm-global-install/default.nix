{pkgs, ...}: let
  installScript = pkgs.writeShellScriptBin "npm-global-install" ''
    export PATH=${pkgs.lib.makeBinPath [pkgs.nodejs pkgs.bash pkgs.coreutils pkgs.gnugrep pkgs.jq]}:$PATH
    ${builtins.readFile ./npm-global-install.sh}
  '';
in {
  home.packages = [installScript];

  systemd.user.services.npm-install-globals = {
    Unit = {
      Description = "Update user global npm packages";
      After = ["network-online.target"];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${installScript}/bin/npm-global-install";
    };
    Install = {
      WantedBy = ["default.target"];
    };
  };
}
