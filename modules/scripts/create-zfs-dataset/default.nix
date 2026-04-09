{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "create-zfs-dataset" ''
      export PATH=${pkgs.lib.makeBinPath [pkgs.zfs pkgs.coreutils]}:$PATH
      ${builtins.readFile ./create-zfs-dataset.sh}
    '')
  ];
}
