# Opens every installed Chrome web app (PWA) when the desktop session
# starts. The apps aren't listed here: Chrome creates a launcher
# chrome-<app id>-<profile>.desktop in ~/.local/share/applications for each
# installed app, and every launcher found there at login is started like a
# click in the menu, so apps installed or removed later (in any profile)
# follow without a rebuild. The first app starts Chrome itself; the others
# follow a few seconds later, when Chrome is up and opens them in the same
# process.
{pkgs, ...}: let
  startWebApps = pkgs.writeShellScript "chrome-pwa-autostart" ''
    shopt -s nullglob
    first=1
    for launcher in "''${XDG_DATA_HOME:-$HOME/.local/share}"/applications/chrome-*-*.desktop; do
      ${pkgs.gtk3}/bin/gtk-launch "$(basename "$launcher")"
      if [ "$first" = 1 ]; then
        first=0
        sleep 5
      else
        sleep 1
      fi
    done
  '';
in {
  imports = [./packages/google-chrome.nix];

  environment.etc."xdg/autostart/chrome-pwa-autostart.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Chrome web apps
    Exec=${startWebApps}
    StartupNotify=false
    Terminal=false
  '';
}
