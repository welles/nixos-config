# NixOS Home Manager Configuration
#
# Development environment for WSL. Imports shared shell, CLI tools,
# and Git modules. Overrides the Git email to use the work identity.
{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/cli-tools.nix
    ../../modules/home/git.nix
    ../../modules/scripts/npm-global-install
  ];

  home = {
    # NPM Settings
    file.".npmrc".text = ''
      prefix=${config.home.homeDirectory}/.npm-global
      save-exact=true
      save-prefix=
    '';

    sessionPath = [
      "${config.home.homeDirectory}/.npm-global/bin"
      "${config.home.homeDirectory}/.dotnet/tools"
    ];
  };

  # Override default git email with work identity
  programs.git.settings.user.email = lib.mkForce "welles@mentz.net";
}
