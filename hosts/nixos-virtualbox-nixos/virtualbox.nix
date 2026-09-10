_: {
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;

  services.xserver.videoDrivers = ["virtualbox" "modesetting"];
}
