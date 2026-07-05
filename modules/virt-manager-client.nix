# Shared virt-manager Client Configuration
#
# Installs virt-manager for managing VMs on remote libvirt hosts (e.g.
# the schokoladenelch home server) over SSH via qemu+ssh://, adds the
# user to the libvirtd group, and provides a `virt-schokoladenelch`
# shorthand to launch virt-manager already connected to that host.
{
  user,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs.virt-manager
    pkgs.virt-viewer
    (pkgs.writeShellScriptBin "virt-schokoladenelch" ''
      exec ${pkgs.virt-manager}/bin/virt-manager --connect qemu+ssh://schokoladenelch@nico-schokoladenelch-nixos/system "$@"
    '')
  ];

  users.users.${user}.extraGroups = ["libvirtd"];
}
