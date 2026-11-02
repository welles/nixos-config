# Plasma power profile on AC power: full performance, no dimming and no
# suspend; the display turns off after 8 hours (1 minute when locked).
_: {
  home-manager.sharedModules = [
    {
      programs.plasma.powerdevil.AC = {
        turnOffDisplay = {
          idleTimeout = 28800;
          idleTimeoutWhenLocked = 60;
        };
        dimDisplay.enable = false;
        autoSuspend.action = "nothing";
        powerProfile = "performance";
      };
    }
  ];
}
