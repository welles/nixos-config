{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables.SSH_AUTH_SOCK = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";

  xdg.configFile."autostart/bitwarden.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Bitwarden
    Comment=Bitwarden startup script
    Exec=${pkgs.bitwarden-desktop}/bin/bitwarden
    StartupNotify=false
    Terminal=false
  '';
}
