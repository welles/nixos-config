# Shared virt-manager Client Configuration
#
# Installs virt-manager for managing VMs on a remote libvirt host over SSH
# via qemu+ssh://, adds the user to the libvirtd group, and provides a
# `virt-connect-remote` shorthand to launch virt-manager already connected
# to that host.
{
  user,
  pkgs,
  remoteHost,
  remoteUser,
  ...
}: {
  environment.systemPackages = [
    pkgs.virt-manager
    pkgs.virt-viewer
    (pkgs.writeShellScriptBin "virt-connect-remote" ''
      exec ${pkgs.virt-manager}/bin/virt-manager --connect qemu+ssh://${remoteUser}@${remoteHost}/system "$@"
    '')
  ];

  users.users.${user}.extraGroups = ["libvirtd"];
}
