# Plasma power profiles on battery: balanced, dimming after 5 minutes and
# sleep when idle; below 20 % power saving and sleep when idle sooner, shut
# down at 5 %.
# plasma-battery-hibernate.nix hibernates instead when the battery runs low.
{lib, ...}: {
  home-manager.sharedModules = [
    {
      programs.plasma.powerdevil = {
        batteryLevels = {
          criticalLevel = 5;
          lowLevel = 20;
          criticalAction = lib.mkDefault "shutDown";
        };

        battery = {
          turnOffDisplay = {
            idleTimeout = 900;
            idleTimeoutWhenLocked = 60;
          };
          dimDisplay = {
            enable = true;
            idleTimeout = 300;
          };
          autoSuspend.action = "sleep";
          powerProfile = "balanced";
        };

        lowBattery = {
          turnOffDisplay = {
            idleTimeout = 180;
            idleTimeoutWhenLocked = 60;
          };
          dimDisplay = {
            enable = true;
            idleTimeout = 60;
          };
          autoSuspend.action = lib.mkDefault "sleep";
          powerProfile = "powerSaving";
        };
      };
    }
  ];
}
