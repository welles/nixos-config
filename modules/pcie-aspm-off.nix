# Disables PCIe Active State Power Management (ASPM) for all devices.
#
# Some PCIe devices (e.g. Intel I225/I226 network cards, driver igc) lose
# their link or hang when the link changes power states.
# Workaround (see CURRENT_WORKAROUNDS.md): drop it once the server runs stable
# without it, or the hang turns out to have another cause.
_: {
  boot.kernelParams = ["pcie_aspm=off"];
}
