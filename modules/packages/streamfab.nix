# StreamFab (DVDFab's video downloader for streaming services, Windows only)
# on Wine from nixpkgs, without Bottles: `streamfab` and a menu entry. The
# program lives in its own prefix at ~/.local/share/streamfab, set up on the
# first start; see dvdfab/mk-launcher.nix.
#
# The installer comes from DVDFab's download center
# (https://www.dvdfab.cn/mlink/download.php?g=StreamFab_x64 redirects to the
# current version). The launcher downloads it only for a fresh prefix, as
# StreamFab updates itself afterwards (dvdfab/mk-launcher.nix says why
# Nix doesn't fetch it). The Update Local Packages workflow keeps URL and
# hash at the current version, as old ones disappear from the server.
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
      pname = "streamfab";
      inherit (config.users.users.${user}) home;
      desktopName = "StreamFab";
      comment = "Download videos from streaming services";
      categories = ["AudioVideo" "Video"];
      exe = "StreamFab64.exe";
      # C:\StreamFab: the layout of the former Bottles install
      appDirs = ["Program Files/StreamFab/StreamFab" "Program Files/DVDFab/StreamFab" "StreamFab"];
      installer = {
        url = "https://d74.dvdfab.cn/download/49_7057_44344b79/streamfab_x64_7057.exe";
        hash = "sha256-chgLioZ0RYdUo1oYAvchH+D3RpAl2tqh7033rSNMnx8=";
      };
    })
    launcher
    desktopItem
    ;
in {
  imports = [../wine-machine-id.nix];

  environment.systemPackages = [launcher desktopItem];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".local/share/streamfab"];
  };
}
