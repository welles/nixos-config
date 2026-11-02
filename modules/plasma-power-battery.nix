# Plasma power profiles on battery: balanced, dimming after 5 minutes and
# sleep when idle; below 20 % power saving with hibernate when idle, and
# hibernate at 5 %.
_: {
  home-manager.sharedModules = [
    {
      programs.plasma.powerdevil = {
        batteryLevels = {
          criticalLevel = 5;
          lowLevel = 20;
          criticalAction = "hibernate";
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
          autoSuspend.action = "hibernate";
          powerProfile = "powerSaving";
        };
      };
    }
  ];
}
