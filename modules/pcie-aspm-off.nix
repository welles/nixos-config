# Disables PCIe Active State Power Management (ASPM) for all devices.
#
# Some PCIe devices (e.g. Intel I225/I226 network cards, driver igc) lose
# their link or hang when the link changes power states.
_: {
  boot.kernelParams = ["pcie_aspm=off"];
}
