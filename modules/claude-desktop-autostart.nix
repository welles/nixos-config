# Opens Claude Desktop (packages/claude-desktop.nix) when the desktop session
# starts, so the machine is ready for Remote Control sessions from
# claude.ai without opening the app by hand. On hosts used only over RDP,
# combine with xrdp-boot-session.nix, which starts the session at boot.
_: {
  imports = [./packages/claude-desktop.nix];

  environment.etc."xdg/autostart/claude-desktop.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Claude
    Exec=claude-desktop
    StartupNotify=false
    Terminal=false
  '';
}
