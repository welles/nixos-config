# VirtualBox Guest
#
# Guest additions with drag and drop between host and guest, and the
# VirtualBox video driver (modesetting as fallback).
_: {
  virtualisation.virtualbox.guest = {
    enable = true;
    dragAndDrop = true;
  };

  services.xserver.videoDrivers = ["virtualbox" "modesetting"];
}
