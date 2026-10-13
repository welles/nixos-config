# Boot Configuration (UEFI guest)
#
# systemd-boot on the VM's EFI partition. The firmware is libvirt's OVMF;
# bootctl also installs the fallback loader (EFI/BOOT/BOOTX64.EFI), so the
# VM boots even if its EFI variables are reset, and the variables are never
# touched.
#
# The serial console makes the VM reachable via `virsh console
# nico-devbox-nixos` on the server when neither SSH nor RDP work.
_: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };

    kernelParams = [
      "console=ttyS0,115200"
      "console=tty0"
    ];

    initrd.supportedFilesystems = ["zfs"];
    supportedFilesystems = ["zfs"];
    zfs = {
      devNodes = "/dev/disk/by-id";
      forceImportRoot = false;
      forceImportAll = false;
    };
  };
}
