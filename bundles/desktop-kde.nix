# KDE Plasma desktop with sound, Bluetooth, theming and the Fira fonts the
# Plasma font settings refer to.
{
  imports = [
    ../modules/bluetooth.nix
    ../modules/fonts.nix
    ../modules/kde-plasma.nix
    ../modules/kde-theming.nix
    ../modules/packages/fira-code-nerd-font.nix
    ../modules/packages/fira-sans.nix
    ../modules/packages/konsole.nix
    ../modules/pipewire.nix
    ../modules/profile-icon
    ../modules/user-dirs.nix
  ];
}
