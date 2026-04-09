{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "zfs-manual-snapshot" ''
      export PATH=${pkgs.lib.makeBinPath [pkgs.zfs pkgs.coreutils pkgs.gawk]}:$PATH
      ${builtins.readFile ./zfs-manual-snapshot.sh}
    '')
  ];
}
