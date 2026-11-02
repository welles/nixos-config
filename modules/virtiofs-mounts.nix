# virtiofs mounts
#
# Mounts the virtiofs devices the hypervisor passes through (e.g.
# libvirt-vm.nix's `virtiofsShares`): `virtiofsMounts` maps each mount
# point to the device's tag. nofail: a missing share (VM started without it,
# or an older domain definition) must not drop the VM into emergency mode.
{
  lib,
  virtiofsMounts,
  ...
}: {
  fileSystems =
    lib.mapAttrs (_mountPoint: tag: {
      device = tag;
      fsType = "virtiofs";
      options = ["nofail"];
    })
    virtiofsMounts;
}
