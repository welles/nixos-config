{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellScriptBin "npm-global-install" ''
      export PATH=${pkgs.lib.makeBinPath [pkgs.nodejs pkgs.bash pkgs.coreutils pkgs.gnugrep]}:$PATH
      ${builtins.readFile ./npm-global-install.sh}
    '')
  ];
}
