{hostname, ...}: {
  imports = [
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
    ./locale.nix
    ./nix.nix
    ./boot.nix
    ./sops.nix
    ./users.nix
    ./home-manager.nix
    ./nixos-tools.nix
  ];

  networking.hostName = hostname;
  networking.hostId = "7e6301e4";
  system.stateVersion = "26.05";
}
