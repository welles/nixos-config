# NixOS Home Manager Configuration
#
# Development environment for WSL. Imports shared shell, CLI tools,
# and Git modules. Overrides the Git email to use the work identity.
{
  lib,
  config,
  ...
}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/cli-tools.nix
    ../../modules/home/git.nix
  ];

  # NPM Settings
  home.file.".npmrc".text = ''
    prefix=${config.home.homeDirectory}/.npm-global
    save-exact=true
    save-prefix=
  '';

  home.sessionPath = [
    "${config.home.homeDirectory}/.npm-global/bin"
    "${config.home.homeDirectory}/.dotnet/tools"
  ];

  # Auto-attach to (or create) the "main" tmux session on every new console.
  # mkBefore ensures this runs before fastfetch so the greeting only appears
  # inside the tmux session, not in the brief outer shell.
  programs.zsh.initContent = lib.mkBefore ''
    if [ -z "$TMUX" ]; then
      tmux new-session -A -s main
    fi
  '';

  # Override default git email with work identity
  programs.git.settings.user.email = lib.mkForce "welles@mentz.net";
}
