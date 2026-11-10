# MusicFab (DVDFab's music downloader, Windows only) on Wine from nixpkgs,
# without Bottles: `musicfab` and a menu entry. The program lives in its own
# prefix at ~/.local/share/musicfab, set up on the first start; see
# dvdfab/mk-launcher.nix.
#
# The installer comes from DVDFab's download center
# (https://www.dvdfab.cn/mlink/download.php?g=MusicFab_x64 redirects to the
# current version). It is only used for a fresh prefix, as MusicFab updates
# itself afterwards; old versions may disappear from the server, then bump
# URL and hash to what the redirect points to.
{
  config,
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: let
  inherit
    (import ./dvdfab/mk-launcher.nix {
      inherit pkgs;
      pname = "musicfab";
      inherit (config.users.users.${user}) home;
      desktopName = "MusicFab";
      comment = "Download music from streaming services";
      categories = ["AudioVideo" "Audio"];
      exe = "musicfab64.exe";
      # C:\MusicFab: the layout of the former Bottles install
      appDirs = ["Program Files/MusicFab/MusicFab" "MusicFab"];
      # Without it the page stays blank after the converter dialog closes or
      # the window was covered: Chromium's GPU process draws into the window
      # from another process, which Wine does not retain
      args = ["--in-process-gpu"];
      installer = pkgs.fetchurl {
        url = "https://d145.dvdfab.cn/download/70_2003_cc69dde7/MusicFab_x64_2003.exe";
        hash = "sha256-ABxf6GM4sL8BBf5kBVfa9iL8YDeeuNuo+MhMpzqsQJI=";
      };
    })
    launcher
    desktopItem
    ;
in {
  imports = [../wine-machine-id.nix];

  environment.systemPackages = [launcher desktopItem];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".local/share/musicfab"];
  };
}
