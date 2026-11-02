# The power button hibernates, in every Plasma power profile.
_: {
  home-manager.sharedModules = [
    {
      programs.plasma.powerdevil = {
        AC.powerButtonAction = "hibernate";
        battery.powerButtonAction = "hibernate";
        lowBattery.powerButtonAction = "hibernate";
      };
    }
  ];
}
