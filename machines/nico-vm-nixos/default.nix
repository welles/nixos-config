# Development VM Machine Configuration
#
# Machine-specific settings for a QEMU/KVM virtual machine. Mounts
# NFS shares from the home server (10.0.0.10) for emulation ROMs
# and temporary files, with on-demand automounting and a 10-minute
# idle timeout.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: let
  nfsShares = ["emulation" "temp"];
in {
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
  ];

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
