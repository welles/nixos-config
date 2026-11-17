# Disables Energy Efficient Ethernet (EEE) on Intel I225/I226 network cards
# (driver igc).
#
# EEE on these cards is known to cause transmit timeouts ("NETDEV WATCHDOG:
# transmit queue timed out") and adapter resets that can hang the kernel.
# Workaround (see CURRENT_WORKAROUNDS.md): drop it once the server runs stable
# without it, or the hang turns out to have another cause.
{pkgs, ...}: {
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="net", DRIVERS=="igc", RUN+="${pkgs.ethtool}/bin/ethtool --set-eee $name eee off"
  '';
}
