{
  lib,
  sopsAgeKeyFile ? (builtins.throw "sops-zfs-persist.nix: set `_module.args.sopsAgeKeyFile` to the sops age key file"),
  ...
}: {
  # The age key lives on the persist dataset so it survives reboots.
  # The direct path bypasses the /var/lib/sops-nix bind mount, which
  # is set up by systemd after the stage-2 activation where sops reads
  # the key — so the bind mount would be too late on first boot.
  sops.age.keyFile = lib.mkForce sopsAgeKeyFile;
}
