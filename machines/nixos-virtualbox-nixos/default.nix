{lib, ...}: {
  imports = [
    ./disk-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # VirtualBox Guest Additions: shared clipboard, folder sharing,
  # mouse integration, and automatic screen resize.
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;

  # Display driver order suited for VirtualBox virtual GPU.
  services.xserver.videoDrivers = ["virtualbox" "vmware" "modesetting"];

  # DHCP for VirtualBox NAT networking.
  networking.useDHCP = lib.mkDefault true;
}
