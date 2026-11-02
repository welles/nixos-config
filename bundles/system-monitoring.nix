# Watching processes, resources and systemd units.
{
  imports = [
    ../modules/packages/mission-center.nix
    ../modules/packages/systemctl-tui.nix
  ];
}
