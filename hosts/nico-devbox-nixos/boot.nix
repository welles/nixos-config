# Boot Configuration (UEFI guest)
#
# systemd-boot with ZFS (modules/zfs-systemd-boot.nix) on the VM's EFI
# partition; the firmware is libvirt's OVMF.
#
# The serial console makes the VM reachable via `virsh console
# nico-devbox-nixos` on the server when neither SSH nor RDP work.
_: {
  boot.kernelParams = [
    "console=ttyS0,115200"
    "console=tty0"
  ];
}
