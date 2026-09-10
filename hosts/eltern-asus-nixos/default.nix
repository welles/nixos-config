{hostname, ...}: {
  imports = [
    # Hardware & boot
    ./boot.nix
    ./disk-configuration.nix
    ./hardware-configuration.nix

    # Networking
    ../../modules/avahi.nix
    ../../modules/networkmanager.nix

    # Desktop environment
    ./desktop.nix

    # Home Manager
    ../../modules/shell.nix

    # User & identity
    ./home-manager.nix
    ../../modules/user-account.nix

    # System
    ./auto-upgrade.nix
    ../../modules/keyboard.nix
    ../../modules/locale-de.nix
    ../../modules/nix-settings.nix
    ../../modules/nixos-tools.nix
    ../../modules/packages/tmux.nix

    # Packages
    ../../modules/packages/firefox.nix
    ../../modules/packages/google-chrome.nix
    ../../modules/packages/jellyfin-desktop.nix
  ];

  networking.hostName = hostname;
  system.stateVersion = "25.11";
  _module.args = {
    user = "eltern";
    userDescription = "Moni & Gerri";
    persistRoot = null;
    passwordConfig = {initialPassword = "passwort";};
    extraGroups = ["wheel"];
  };
}
