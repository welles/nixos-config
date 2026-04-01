# Virtualisation Configuration
#
# Enables libvirtd with virt-manager for KVM virtual machines.
# Also defines a VM testing variant for `nixos-rebuild build-vm`
# with 8GB RAM and virtio GPU acceleration.
{...}: {
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  virtualisation.vmVariant = {
    virtualisation.useBootLoader = true;
    virtualisation.useEFIBoot = true;
    boot.loader.timeout = 30;
    virtualisation = {
      memorySize = 8192;
      cores = 4;
      qemu.options = ["-vga virtio" "-display gtk,gl=on"];
    };
  };
}
