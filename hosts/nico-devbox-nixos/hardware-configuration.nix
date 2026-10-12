# Virtual hardware of the libvirt/KVM guest (q35, virtio devices)
{modulesPath, ...}: {
  imports = [(modulesPath + "/profiles/qemu-guest.nix")];

  boot.initrd.availableKernelModules = ["ahci" "sr_mod" "virtio_blk" "virtio_pci" "xhci_pci"];

  services = {
    # Lets the server shut the VM down cleanly and freeze its file systems
    qemuGuest.enable = true;
    # Clipboard and display resizing in the SPICE console (virt-manager)
    spice-vdagentd.enable = true;
  };
}
