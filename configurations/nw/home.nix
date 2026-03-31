# NW Home Manager Configuration
#
# Development environment for WSL. Imports shared shell, CLI tools,
# and Git modules. Overrides the Git email to use the work identity.
{lib, config, ...}: {
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
  ];

  # Override default git email with work identity
  programs.git.settings.user.email = lib.mkForce "welles@mentz.net";
  programs.git.settings.core.sshCommand = "/mnt/c/Windows/System32/OpenSSH/ssh.exe";
}
