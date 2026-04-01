# NixOS Dev Home Manager Configuration
#
# Shared home manager setup for the nixos user across WSL and VirtualBox.
# Configures shell, CLI tools, Git with work identity, and npm prefix.
{
  lib,
  config,
  ...
}: {
  imports = [
    ./shell.nix
    ./cli-tools.nix
    ./git.nix
  ];

  home.file.".npmrc".text = ''
    prefix=${config.home.homeDirectory}/.npm-global
    save-exact=true
    save-prefix=
  '';

  home.sessionPath = ["${config.home.homeDirectory}/.npm-global/bin"];

  programs.git.settings.user.email = lib.mkForce "welles@mentz.net";
}
