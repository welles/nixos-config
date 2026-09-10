# ZFS Impermanence Rollback
#
# Rolls the `<pool>/root` dataset back to its `@blank` snapshot every boot,
# in initrd before the root filesystem is mounted - the actual "erase your
# darlings" mechanism. Requires `_module.args.pool` to be set to the ZFS
# pool name; the snapshot itself must already exist (created once at
# install time: `zfs snapshot <pool>/root@blank`).
{
  pkgs,
  pool ? (builtins.throw "zfs-rollback.nix: set `_module.args.pool` to the ZFS pool name"),
  ...
}: {
  boot.initrd.systemd.services.rollback-root = {
    description = "Rollback ZFS root dataset to a blank snapshot";
    wantedBy = ["initrd.target"];
    after = ["zfs-import-${pool}.service"];
    before = ["sysroot.mount"];
    path = [pkgs.zfs];
    unitConfig.DefaultDependencies = "no";
    serviceConfig.Type = "oneshot";
    script = ''
      if zfs rollback -r ${pool}/root@blank; then
        echo "${pool}/root rolled back to @blank"
      else
        echo "no blank snapshot found for ${pool}/root"
      fi
    '';
  };
}
