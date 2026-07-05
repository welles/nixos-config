# Shared libvirt/KVM Virtualization Configuration
#
# Enables libvirtd with the KVM/QEMU backend for hosting VMs (e.g. a
# Windows Server guest attached to the LAN via macvtap). Adds swtpm
# for emulated TPM 2.0 (required by Windows 11/Server 2025 guests) and
# OVMF UEFI firmware (with secure-boot vars) via qemu's verbatimConfig,
# since NixOS has no dedicated `virtualisation.libvirtd.qemu.ovmf` option.
# virt-manager is enabled for remote GUI management over SSH.
{
  user,
  pkgs,
  ...
}: {
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true;
      verbatimConfig = ''
        nvram = ["${pkgs.OVMFFull.fd}/FV/OVMF_CODE.fd:${pkgs.OVMFFull.fd}/FV/OVMF_VARS.fd"]
      '';
    };
  };

  programs.virt-manager.enable = true;

  users.users.${user}.extraGroups = ["libvirtd"];

  environment.systemPackages = with pkgs; [
    virtio-win
    virt-viewer
  ];
}
