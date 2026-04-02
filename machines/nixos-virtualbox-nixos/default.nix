{lib, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./boot.nix
    ./desktop.nix
    ./persistence.nix
  ];

  # VirtualBox Guest Additions: shared clipboard, folder sharing,
  # mouse integration, and automatic screen resize.
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;

  # Display driver order suited for VirtualBox virtual GPU.
  services.xserver.videoDrivers = ["virtualbox" "modesetting"];

  # DHCP for VirtualBox NAT networking.
  networking.useDHCP = lib.mkDefault true;
}
