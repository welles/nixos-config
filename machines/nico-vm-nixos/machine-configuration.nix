{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  fileSystems."/mnt/user/emulation" = {
    device = "10.0.0.10:/mnt/user/emulation";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" "soft" "intr"];
  };

  fileSystems."/mnt/disks/TRANSFER" = {
    device = "10.0.0.10:/mnt/disks/TRANSFER";
    fsType = "nfs";
    options = ["x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" "soft" "intr"];
  };

  systemd.tmpfiles.rules = [
    "d /mnt/user 0755 root root -"
    "d /mnt/disks 0755 root root -"
  ];
}
