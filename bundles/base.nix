# What every host gets: user account, Home Manager, shell, locale, Nix
# settings and the basic command-line tools.
{
  imports = [
    ../modules/cli-tools.nix
    ../modules/home-manager-user.nix
    ../modules/keyboard.nix
    ../modules/locale-de.nix
    ../modules/nix-settings.nix
    ../modules/nixos-tools.nix
    ../modules/packages/git.nix
    ../modules/packages/tmux.nix
    ../modules/shell.nix
    ../modules/sudo.nix
    ../modules/user-account.nix
  ];
}
