# Disables Energy Efficient Ethernet (EEE) on Intel I225/I226 network cards
# (driver igc).
#
# EEE on these cards is known to cause transmit timeouts ("NETDEV WATCHDOG:
# transmit queue timed out") and adapter resets that can hang the kernel.
{pkgs, ...}: {
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="net", DRIVERS=="igc", RUN+="${pkgs.ethtool}/bin/ethtool --set-eee %k eee off"
  '';
}
