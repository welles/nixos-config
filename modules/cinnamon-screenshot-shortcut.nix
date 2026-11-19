# Super+Shift+S takes a screenshot of a selected area and copies it to the
# clipboard, as in Windows. Cinnamon's own area-to-clipboard shortcut
# (Ctrl+Shift+Print, done by gnome-screenshot) gets the extra binding; the
# Print shortcuts stay as they are. Set in dconf by Home Manager on every
# activation.
{
  imports = [./cinnamon.nix];

  home-manager.sharedModules = [
    {
      dconf.settings."org/cinnamon/desktop/keybindings/media-keys".area-screenshot-clip = [
        "<Control><Shift>Print"
        "<Super><Shift>s"
      ];
    }
  ];
}
