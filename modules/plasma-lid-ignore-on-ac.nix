# Closing the lid does nothing on AC power, and nothing in any power profile
# while an external monitor is connected. On battery, Plasma's default
# (sleep) or plasma-lid-hibernate.nix applies.
_: {
  home-manager.sharedModules = [
    {
      programs.plasma.powerdevil = {
        AC = {
          whenLaptopLidClosed = "doNothing";
          inhibitLidActionWhenExternalMonitorConnected = true;
        };
        battery.inhibitLidActionWhenExternalMonitorConnected = true;
        lowBattery.inhibitLidActionWhenExternalMonitorConnected = true;
      };
    }
  ];
}
