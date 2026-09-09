{hostname, ...}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/yazi.nix
    ../../modules/home/konsole.nix
    ./hardware-configuration.nix
    ../../modules/profile-icon
    ./disk-configuration.nix
    ./impermanence.nix
    ../../modules/ai-agents.nix
    ../../modules/kde-plasma.nix
    ../../modules/fonts.nix
    ../../modules/pipewire.nix
    ./networking.nix
    ./packages.nix
    ./services.nix
    ./nvidia-gpu.nix
    ../../modules/tmux.nix
    ../../modules/occt
    ../../modules/scripts/check-persist
    ../../modules/scripts/toggle-screens
    ../../modules/scripts/search-tmdb
    ../../modules/locale-de.nix
    ../../modules/keyboard.nix
    ../../modules/nix-settings.nix
    ./boot.nix
    ./sops.nix
    ./users.nix
    ../../modules/home-manager-user.nix
    ../../modules/nixos-tools.nix
    ../../modules/bluetooth.nix
    ../../modules/1password.nix
    ../../modules/bottles.nix
    ../../modules/virt-manager-client.nix
    ../../modules/nix-ld.nix
    ../../modules/logitech-wheel.nix
    ../../modules/streamdeck.nix
  ];

  networking.hostName = hostname;
  networking.hostId = "7e6301e4";
  system.stateVersion = "26.05";
  _module.args = {
    user = "nico";
    homeModules = [
      ./plasma.nix
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
