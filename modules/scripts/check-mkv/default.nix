{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "check-mkv" ''
      export PATH=${pkgs.lib.makeBinPath [pkgs.ffmpeg pkgs.findutils pkgs.coreutils]}:$PATH
      ${builtins.readFile ./check-mkv.sh}
    '')
  ];
}
