{hostname, ...}: {
  imports = [
    # "global.nix"-style: tmux before the body
    ../../modules/tmux.nix

    # "configurations/nico"-style imports (no systemPackages)
    ../../modules/1password.nix
    ../../modules/docker.nix
    ../../modules/kde-plasma.nix
    ../../modules/networkmanager.nix
    ../../modules/profile-icon
    ../../modules/wifi-welles-intern
    ../../modules/pipewire.nix
    ../../modules/services-laptop.nix

    # "configurations/nico"-style systemPackages imports (order matters for hash)
    ../../modules/packages-nico.nix # first sp-import → last in reversed Phase 1
    ../../modules/rclone # second sp-import → 4th in reversed Phase 1

    # "configurations/nico"-style settings
    ../../modules/user-nico.nix
    ../../modules/locale-de.nix
    ../../modules/nix-settings.nix
    ../../modules/sops-zfs-persist.nix
    ../../modules/home-manager-user.nix

    # "machines/thinkbook"-style imports (no systemPackages)
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./impermanence.nix
    ./nvidia-gpu.nix
    ../../modules/wifi-welles-starlink
    ../../modules/xone-dongle.nix

    # "machines/thinkbook"-style systemPackages imports (order matters for hash)
    ../../modules/eden.nix # third sp-import → 3rd in reversed Phase 1
    ../../modules/occt # fourth sp-import → 2nd in reversed Phase 1
    ../../modules/scripts/check-persist # last sp-import → 1st in reversed Phase 1

    ../../modules/zfs-laptop-boot.nix

    ../../modules/nix-ld.nix
    ../../modules/logitech-wheel.nix
    ../../modules/nixos-tools.nix
    ../../modules/bluetooth.nix
    ./networking.nix
    ./sunshine.nix
    ./gaming.nix
  ];

  networking.hostName = hostname;
  networking.hostId = "54af8977";
  system.stateVersion = "25.11";
  _module.args.user = "nico";
  _module.args.homeFile = ../../modules/home/nico-laptop.nix;
}
