# Hibernate when the battery runs low: when idle below 20 % and at 5 %
# (critical), instead of plasma-power-battery.nix's sleep and shutdown.
# Needs a swap device at least as large as the RAM, and on ZFS hosts
# boot.zfs.unsafeAllowHibernation.
_: {
  home-manager.sharedModules = [
    {
      programs.plasma.powerdevil = {
        batteryLevels.criticalAction = "hibernate";
        lowBattery.autoSuspend.action = "hibernate";
      };
    }
  ];
}
