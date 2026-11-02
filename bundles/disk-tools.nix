# Partitioning disks and formatting them with the common file systems.
{
  imports = [
    ../modules/packages/exfatprogs.nix
    ../modules/packages/gparted.nix
    ../modules/packages/kdePackages-partitionmanager.nix
    ../modules/packages/xfsprogs.nix
  ];
}
