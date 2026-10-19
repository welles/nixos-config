# Wallpaper Engine as Plasma Wallpaper
#
# Live wallpapers from Wallpaper Engine (Steam) on the Plasma desktop, through
# the wallpaper-engine-kde-plugin. It plays the wallpapers of the Steam
# library: those subscribed to in the Steam Workshop and Wallpaper Engine's
# own. Wallpaper Engine has to be bought and installed in Steam (it doesn't
# need to run, Windows-only as it is); the plugin takes its assets from the
# installation. Video wallpapers play best, scene wallpapers mostly work, web
# wallpapers only partly.
#
# plasma-manager rewrites the desktop's configuration on every login (its
# panel script deletes plasma-org.kde.plasma.desktop-appletsrc), so a
# wallpaper chosen in the desktop settings only lasts until the next login.
# To keep one, choose it there (right click on the desktop > Configure
# Desktop and Wallpaper), look up its two entries with
#   grep -E '^Wallpaper(WorkShopId|Source)=' ~/.config/plasma-org.kde.plasma.desktop-appletsrc
# and set them in programs.plasma.workspace.wallpaperCustomPlugin.config.General
# of the host.
{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = [pkgs.kdePackages.wallpaper-engine-plugin];

  home-manager.sharedModules = [
    ({config, ...}: {
      programs.plasma.workspace.wallpaperCustomPlugin = {
        plugin = "com.github.catsout.wallpaperEngineKde";
        config.General = {
          SteamLibraryPath = "file://${config.home.homeDirectory}/.local/share/Steam";
          # Smoother than the plugin's 15 fps for scene wallpapers
          Fps = lib.mkDefault 30;
        };
      };
    })
  ];
}
