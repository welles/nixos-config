{hostname, ...}: {
  imports = [
    ../../modules/home/shell.nix
    ./hardware-configuration.nix
    ../../modules/profile-icon
    ./disk-configuration.nix
    ./impermanence.nix
    ../../modules/kde-plasma.nix
    ../../modules/pipewire.nix
    ./networking.nix
    ./packages.nix
    ./services.nix
    ./nvidia-gpu.nix
    ../../modules/tmux.nix
    ../../modules/occt
    ../../modules/locale-de.nix
    ../../modules/nix-settings.nix
    ./boot.nix
    ./sops.nix
    ./users.nix
    ../../modules/home-manager-user.nix
    ../../modules/nixos-tools.nix
    ../../modules/bluetooth.nix
    ../../modules/1password.nix
    ../../modules/virt-manager-client.nix
    ../../modules/nix-ld.nix
    ../../modules/logitech-wheel.nix
  ];

  networking.hostName = hostname;
  networking.hostId = "7e6301e4";
  system.stateVersion = "26.05";
  _module.args = {
    user = "nico";
    homeFile = ./home.nix;
    persistRoot = "/persist";
    userDescription = "Nico Welles";
    userEmail = "nico@welles.email";
  };
}
