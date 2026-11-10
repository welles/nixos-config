# MusicFab (DVDFab's music downloader, Windows only) on Wine from nixpkgs,
# without Bottles
#
# `musicfab` runs the program in its own Wine prefix at
# ~/.local/share/musicfab. The first start creates the prefix and opens the
# installer; after that MusicFab updates itself inside the prefix, which also
# keeps the login, the settings and the embedded browser's profile (Spotify
# login, Widevine in Documents/DVDFab/MusicFab/Temp).
#
# The installer is not downloadable under a fixed URL. Add it to the store
# once, from DVDFab's download page:
#
#   nix-store --add-fixed sha256 MusicFab_x64_2001.exe
#
# Any later version works too: the installed program replaces itself with the
# current one, so the pinned installer only matters for a fresh prefix.
#
# Settings the launcher applies on every start:
# - --in-process-gpu: Chromium's GPU process otherwise draws into MusicFab's
#   window from another process, which Wine does not retain; after the
#   converter dialog closes or the window is covered, the page stays blank.
# - Audio driver ALSA instead of PulseAudio: with winepulse, Wine's mmdevapi
#   busy-loops in its MIDI notify thread (winepulse doesn't implement
#   midi_notify_wait) and MusicFab hangs on its splash screen. ALSA's default
#   device goes to PulseAudio anyway.
# - Microsoft core fonts (Arial, Times New Roman, Courier New, Tahoma, ...) in
#   the prefix, as Bottles installs them.
# See CURRENT_WORKAROUNDS.md for the first two.
{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: let
  # stableFull: the plain build has no PulseAudio/ALSA support
  wine = pkgs.wineWow64Packages.stableFull;

  installer = pkgs.requireFile {
    name = "MusicFab_x64_2001.exe";
    sha256 = "0rnj7i1fs2kf3061mzl3yc3pk3lkh44856fmszzk68w2cppq3dni";
    message = ''
      The MusicFab installer is not in the Nix store. Download
      MusicFab_x64_2001.exe from DVDFab and add it with:

        nix-store --add-fixed sha256 MusicFab_x64_2001.exe
    '';
  };

  launcher = pkgs.writeShellApplication {
    name = "musicfab";
    runtimeInputs = [
      wine
      pkgs.coreutils
      pkgs.gnugrep
    ];
    text = ''
      prefix="''${XDG_DATA_HOME:-$HOME/.local/share}/musicfab"
      export WINEPREFIX="$prefix"
      export WINEDEBUG="''${WINEDEBUG:--all}"
      # winemenubuilder would copy the prefix's shortcuts into the menu
      export WINEDLLOVERRIDES="winemenubuilder.exe=d"

      if [ ! -f "$prefix/system.reg" ]; then
        wineboot --init
        wineserver --wait
        # Wine links these to the home directory; MusicFab keeps its data
        # (and the installer a desktop shortcut) there, which belongs in the
        # prefix. Downloads and Music stay linked for imports and exports.
        for dir in Desktop Documents Pictures Videos; do
          link="$prefix/drive_c/users/$USER/$dir"
          if [ -L "$link" ]; then
            rm "$link"
            mkdir "$link"
          fi
        done
      fi

      fonts="$prefix/drive_c/windows/Fonts"
      for font in ${pkgs.corefonts}/share/fonts/truetype/*.ttf; do
        [ -e "$fonts/$(basename "$font")" ] || install -m 644 "$font" "$fonts/"
      done

      if ! grep -q '^"Audio"="alsa"' "$prefix/user.reg"; then
        wine reg add 'HKCU\Software\Wine\Drivers' /v Audio /d alsa /f >/dev/null
        wineserver --wait
      fi

      # The installer's default location, or C:\MusicFab (moved from Bottles)
      find_app() {
        for dir in "Program Files/MusicFab/MusicFab" "MusicFab"; do
          if [ -f "$prefix/drive_c/$dir/musicfab64.exe" ]; then
            echo "$dir"
            return
          fi
        done
      }

      if [ -z "$(find_app)" ]; then
        # The installer hands over to its setup and returns at once; the
        # setup starts MusicFab itself when done (without the arguments
        # below, until the next start through this launcher). Wait for all
        # of it, so the next start doesn't run the installer again.
        wine ${installer}
        wineserver --wait
        exit 0
      fi
      app=$(find_app)

      cd "$prefix/drive_c/$app"
      exec wine "C:\\''${app//\//\\}\\musicfab64.exe" --in-process-gpu "$@"
    '';
  };

  # The installer's own 256 px icon
  icon = pkgs.runCommand "musicfab-icon" {nativeBuildInputs = [pkgs.icoutils];} ''
    mkdir -p $out/share/icons/hicolor/256x256/apps
    wrestool --extract --raw --type=3 --name=1 ${installer} \
      > $out/share/icons/hicolor/256x256/apps/musicfab.png
  '';

  desktopItem = pkgs.makeDesktopItem {
    name = "musicfab";
    desktopName = "MusicFab";
    comment = "Download music from streaming services";
    exec = "musicfab";
    icon = "musicfab";
    categories = ["AudioVideo" "Audio"];
    startupWMClass = "musicfab64.exe";
  };
in {
  imports = [../wine-machine-id.nix];

  environment.systemPackages = [
    launcher
    icon
    desktopItem
  ];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".local/share/musicfab"];
  };
}
