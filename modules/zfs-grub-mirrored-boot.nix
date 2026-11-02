# Mirrored GRUB boot partitions
#
# Installs GRUB to a second EFI system partition at /boot-fallback in
# addition to /boot, so the machine still boots when one of the boot disks
# fails. Builds on zfs-grub-boot.nix; the disk layout must provide both
# partitions.
{lib, ...}: {
  imports = [./zfs-grub-boot.nix];

  # The mirrored boots replace the single device of zfs-grub-boot.nix, which
  # would otherwise add a third, duplicate entry for /boot.
  boot.loader.grub.device = lib.mkForce "";
  boot.loader.grub.mirroredBoots = [
    {
      path = "/boot";
      devices = ["nodev"];
    }
    {
      path = "/boot-fallback";
      devices = ["nodev"];
    }
  ];
}
