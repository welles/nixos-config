# KDE Plasma desktop with sound, Bluetooth, theming and fonts.
{
  imports = [
    ../modules/bluetooth.nix
    ../modules/fonts.nix
    ../modules/kde-plasma.nix
    ../modules/kde-theming.nix
    ../modules/packages/kdePackages-konsole.nix
    ../modules/pipewire.nix
    ../modules/profile-icon
    ../modules/user-dirs.nix
  ];
}
