# Erase-your-darlings on ZFS: the root dataset is rolled back to @blank on
# every boot and only what is persisted under `persistRoot` survives.
{
  imports = [
    ../modules/impermanence-base.nix
    ../modules/scripts/check-persist
    ../modules/scripts/persist-audit
    ../modules/sops-zfs-persist.nix
    ../modules/zfs-rollback.nix
  ];
}
