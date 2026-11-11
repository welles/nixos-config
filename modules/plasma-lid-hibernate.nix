# Closing the lid hibernates on battery. Combine with
# plasma-lid-ignore-on-ac.nix for AC power and external monitors.
_: {
  home-manager.sharedModules = [
    {
      programs.plasma.powerdevil = {
        battery.whenLaptopLidClosed = "hibernate";
        lowBattery.whenLaptopLidClosed = "hibernate";
      };
    }
  ];
}
