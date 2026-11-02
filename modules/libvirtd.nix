# libvirt/KVM
#
# libvirtd with QEMU (unprivileged) and virtiofsd for shared directories.
# Guests are not started by libvirt itself but by their own services (see
# libvirt-vm.nix), and shut down (instead of suspended to disk) when the host
# goes down. The user may use virsh and virt-manager (qemu+ssh://) without
# root.
{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: {
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      runAsRoot = false;
      # virtiofsd for <filesystem> devices of the domains
      vhostUserPackages = [pkgs.virtiofsd];
    };
    onBoot = "ignore";
    onShutdown = "shutdown";
  };

  users.users.${user}.extraGroups = ["libvirtd"];

  # libvirt's tap devices of bridged guests
  networking.networkmanager.unmanaged = ["interface-name:vnet*"];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot} = {
      # NVRAM (EFI variables) of the guests and libvirt's own state
      directories = ["/var/lib/libvirt"];
      # systemd's host key for encrypted credentials: libvirtd loads its
      # secrets-encryption-key (in /var/lib/libvirt/secrets) with
      # LoadCredentialEncrypted, which fails once the key it was encrypted
      # with is gone. Must exist on the persist dataset before it is first
      # bound here, impermanence links missing files only.
      files = ["/var/lib/systemd/credential.secret"];
    };
  };
}
