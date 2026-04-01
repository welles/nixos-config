# Global Configuration
#
# Shared settings applied to every NixOS system in this flake:
# hostname, state version, timezone (Europe/Berlin), German locale,
# Nix flakes support, Zsh, and home-manager integration. Each
# system's user-specific home.nix is loaded
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

  nixpkgs.hostPlatform = "x86_64-linux";
  nixpkgs.config.allowUnfree = true;
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Every system uses Zsh
  programs.zsh.enable = true;

  environment.shellAliases = {
    nixos-switch = "sudo nixos-rebuild switch --flake github:welles/nixos-config#${hostname} --refresh";
    nixos-boot = "sudo nixos-rebuild boot --flake github:welles/nixos-config#${hostname} --refresh";
  };

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
