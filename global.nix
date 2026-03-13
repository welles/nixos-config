# Global Configuration
#
# Shared settings applied to every NixOS system in this flake:
# hostname, state version, timezone (Europe/Berlin), German locale,
# Nix flakes support, NetworkManager, Zsh, and home-manager
# integration. Each system's user-specific home.nix is loaded
# automatically based on the configuration name passed via the
# `user` argument.
{
  inputs,
  hostname,
  user,
  stateVersion,
  ...
}: {
  networking.hostName = hostname;
  system.stateVersion = stateVersion;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "de_DE.UTF-8";
  console.keyMap = "de";

  nixpkgs.config.allowUnfree = true;
  nix.settings.auto-optimise-store = true;

  # Every system uses NetworkManager and Zsh
  networking.networkmanager.enable = true;
  programs.zsh.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs user stateVersion;};
    users.${user} = import ./configurations/${user}/home.nix;
    backupFileExtension = "backup";
    sharedModules = [
      {
        home.username = user;
        home.homeDirectory = "/home/${user}";
        home.stateVersion = stateVersion;
        programs.home-manager.enable = true;
      }
    ];
  };
}
