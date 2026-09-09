{hostname, ...}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/yazi.nix
    ../../modules/home/konsole.nix
    # "global.nix"-style: tmux before the body
    ../../modules/tmux.nix

    # "configurations/nico"-style imports (no systemPackages)
    ../../modules/1password.nix
    ../../modules/docker.nix
    ../../modules/virt-manager-client.nix
    ../../modules/kde-plasma.nix
    ../../modules/fonts.nix
    ../../modules/networkmanager.nix
    ../../modules/profile-icon
    ../../modules/wifi-welles-intern
    ../../modules/pipewire.nix
    ../../modules/services-laptop.nix

    # "configurations/nico"-style systemPackages imports (order matters for hash)
    ../../modules/packages-nico.nix # first sp-import → last in reversed Phase 1
    ../../modules/rclone # second sp-import → 2nd in reversed Phase 1

    # "configurations/nico"-style settings
    ../../modules/user-nico.nix
    ../../modules/locale-de.nix
    ../../modules/keyboard.nix
    ../../modules/nix-settings.nix
    ../../modules/sops-zfs-persist.nix
    ../../modules/home-manager-user.nix

    # "machines/thinkpad"-style imports (no systemPackages)
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./impermanence.nix
    ../../modules/ai-agents.nix
    ./fritzbox-wireguard.nix
    ./mobile-network.nix
    ../../modules/wifi-welles-starlink

    # last sp-import → 1st in reversed Phase 1
    ../../modules/scripts/check-persist

    ../../modules/zfs-laptop-boot.nix

    ../../modules/nix-ld.nix
    ../../modules/nixos-tools.nix
    ../../modules/bluetooth.nix
    ./networking.nix
    ./tablet.nix
  ];

  networking.hostName = hostname;
  networking.hostId = "0aea17fa";
  system.stateVersion = "25.11";
  _module.args = {
    user = "nico";
    homeModules = [
      ../../modules/home/nico-laptop-plasma.nix
      ../../modules/home/fonts.nix
      ../../modules/home/cli-tools.nix
      ../../modules/home/git.nix
      ../../modules/home/git-signing.nix
      ../../modules/home/npm.nix
      ../../modules/home/kde-theming.nix
      ../../modules/home/1password-ssh-agent.nix
      ../../modules/home/1password-autostart.nix
      ../../modules/home/sops-env.nix
      ../../modules/home/xdg-user-dirs.nix
      ../../modules/home/lazygit.nix
    ];
    persistRoot = "/persist";
    userDescription = "Nico Welles";
    userEmail = "nico@welles.email";
  };
}
