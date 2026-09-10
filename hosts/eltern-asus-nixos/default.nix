{hostname, ...}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/nixos-tools.nix
    ../../modules/packages/firefox.nix
    ../../modules/packages/jellyfin-desktop.nix
    ../../modules/packages/google-chrome.nix
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ../../modules/tmux.nix
    ../../modules/networkmanager.nix
    ../../modules/avahi.nix
    ../../modules/locale-de.nix
    ../../modules/keyboard.nix
    ../../modules/nix-settings.nix
    ./home-manager.nix
    ./boot.nix
    ./desktop.nix
    ../../modules/user-account.nix
    ./auto-upgrade.nix
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
