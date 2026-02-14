{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: let
  nfsShares = ["emulation" "temp"];
in {
  fileSystems = lib.genAttrs (map (share: "/mnt/user/${share}") nfsShares) (mountPoint: {
    device = "10.0.0.10:${mountPoint}";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" "soft" "intr"];
  });

  systemd.tmpfiles.rules = [
    "d /mnt/user 0755 root root -"
    "d /mnt/disks 0755 root root -"
  ];
}
