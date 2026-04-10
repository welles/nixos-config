# Lenovo ThinkPad Machine Configuration
#
# Hardware-specific settings for the ThinkPad convertible laptop.
# Uses ZFS with impermanence: main/root is rolled back to a blank
# snapshot on every boot; only data explicitly listed in impermanence.nix
# survives via bind-mounts from main/persist.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./impermanence.nix
    ./fritzbox-wireguard.nix
    ./mobile-network.nix
  ];

  # Required by ZFS — must be unique across all machines in the pool.
  networking.hostId = "0aea17fa";

  # ZFS boot: load ZFS in initrd, import the pool, and roll back the
  # ephemeral root dataset to blank before the rest of the system mounts.
  boot.initrd.supportedFilesystems = ["zfs"];
  boot.supportedFilesystems = ["zfs" "exfat"];
  boot.zfs.devNodes = "/dev/disk/by-id";
  boot.zfs.forceImportAll = true;

  boot.initrd.postDeviceCommands = lib.mkAfter ''
    udevadm settle
    zpool import -d /dev/disk/by-id -N -f main || true
    zfs rollback -r main/root@blank && echo -e "\e[32m  rolled back to blank root\e[0m" || echo -e "\e[31m  no blank root snapshot found, skipping rollback\e[0m"
  '';

  # Add ZFS support to the GRUB bootloader (configured in configurations/nico/boot.nix).
  # efiSysMountPoint must match disko's mountpoint for the ESP partition.
  boot.loader.grub.zfsSupport = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  hardware.bluetooth.enable = true;
  hardware.sensor.iio.enable = true;

  environment.systemPackages = with pkgs; [
    libinput
    iio-sensor-proxy
    maliit-keyboard
  ];

  # services.fprintd.enable = true;

  networking.firewall.enable = true;
}
