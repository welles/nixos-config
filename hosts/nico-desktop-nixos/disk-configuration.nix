# Disk layout for nico-desktop-nixos.
# TODO: Replace with actual disko configuration once the disk layout is decided.
# See machines/nico-thinkpad-nixos/disk-configuration.nix for a ZFS reference.
_: {
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
