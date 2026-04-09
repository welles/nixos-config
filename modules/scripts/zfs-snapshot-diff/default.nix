{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "zfs-snapshot-diff" ''
      export PATH=${pkgs.lib.makeBinPath [pkgs.zfs pkgs.coreutils pkgs.gawk]}:$PATH
      ${builtins.readFile ./zfs-snapshot-diff.sh}
    '')
  ];
}
