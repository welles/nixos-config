{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "toggle-screens" ''
      export PATH=${pkgs.lib.makeBinPath [pkgs.kdePackages.libkscreen pkgs.libnotify pkgs.gnugrep pkgs.coreutils]}:$PATH
      ${builtins.readFile ./toggle-screens.sh}
    '')
  ];
}
