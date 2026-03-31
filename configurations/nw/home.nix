# NW Home Manager Configuration
#
# Development environment for WSL. Imports shared shell, CLI tools,
# and Git modules. Overrides the Git email to use the work identity.
{...}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/cli-tools.nix
    ../../modules/home/git.nix
  ];

  # Override default git email with work identity
  programs.git.settings.user.email = "welles@mentz.net";
}
