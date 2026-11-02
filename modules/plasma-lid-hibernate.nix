# Closing the lid hibernates on battery and does nothing on AC power, and
# nothing either while an external monitor is connected.
_: {
  home-manager.sharedModules = [
    {
      programs.plasma.powerdevil = {
        AC = {
          whenLaptopLidClosed = "doNothing";
          inhibitLidActionWhenExternalMonitorConnected = true;
        };
        battery = {
          whenLaptopLidClosed = "hibernate";
          inhibitLidActionWhenExternalMonitorConnected = true;
        };
        lowBattery = {
          whenLaptopLidClosed = "hibernate";
          inhibitLidActionWhenExternalMonitorConnected = true;
        };
      };
    }
  ];
}
