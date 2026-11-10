# Launcher for a DVDFab program (MusicFab, StreamFab) on Wine from nixpkgs
#
# Not a module: musicfab.nix and streamfab.nix call it. It returns the
# launcher command and its desktop entry. The command runs the program in its
# own Wine prefix at ~/.local/share/<pname>; the first start creates the
# prefix and runs the installer, after which the program updates itself
# inside the prefix (which also keeps the login, settings and the embedded
# browser's profile).
#
# What every start does:
# - Audio driver ALSA instead of PulseAudio: with winepulse, Wine's mmdevapi
#   busy-loops in its MIDI notify thread (winepulse doesn't implement
#   midi_notify_wait) and the programs hang on their splash screen. ALSA's
#   default device goes to PulseAudio anyway.
# - XVidMode off: the X server of an xrdp session rejects gamma changes
#   (XF86VidModeSetGamma: BadValue), and Xlib then kills the whole process
#   (StreamFab died on start).
# - Microsoft core fonts in the prefix, as Bottles installs them.
# - The program's own `args` (MusicFab: --in-process-gpu).
# The first two are listed in CURRENT_WORKAROUNDS.md.
{
  pkgs,
  # Command and prefix directory (~/.local/share/<pname>)
  pname,
  # The user's home directory, for the menu entry's icon in the prefix
  home,
  desktopName,
  comment,
  categories,
  # Program file in the prefix, and the directories (relative to C:\) to
  # look for it in: the installer's default first
  exe,
  appDirs,
  installer,
  # Arguments the program always starts with
  args ? [],
}: let
  # stableFull: the plain build has no PulseAudio/ALSA support
  wine = pkgs.wineWow64Packages.stableFull;

  launcher = pkgs.writeShellApplication {
    name = pname;
    runtimeInputs = [
      wine
      pkgs.coreutils
      pkgs.gnugrep
      pkgs.icoutils
    ];
    text = ''
      prefix="''${XDG_DATA_HOME:-$HOME/.local/share}/${pname}"
      export WINEPREFIX="$prefix"
      export WINEDEBUG="''${WINEDEBUG:--all}"
      # winemenubuilder would copy the prefix's shortcuts into the menu
      export WINEDLLOVERRIDES="winemenubuilder.exe=d"

      if [ ! -f "$prefix/system.reg" ]; then
        wineboot --init
        wineserver --wait
        # Wine links these to the home directory; the programs keep their
        # data (and the installer a desktop shortcut) there, which belongs
        # in the prefix. Downloads, Music and Videos stay linked for imports
        # and exports.
        for dir in Desktop Documents Pictures; do
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

      if ! grep -q '^"UseXVidMode"="N"' "$prefix/user.reg"; then
        wine reg add 'HKCU\Software\Wine\X11 Driver' /v UseXVidMode /d N /f >/dev/null
        wineserver --wait
      fi

      find_app() {
        for dir in ${pkgs.lib.escapeShellArgs appDirs}; do
          if [ -f "$prefix/drive_c/$dir/${exe}" ]; then
            echo "$dir"
            return
          fi
        done
      }

      if [ -z "$(find_app)" ]; then
        # The installer hands over to its setup and returns at once; the
        # setup starts the program itself when done (without the arguments
        # below, until the next start through this launcher). Wait for all
        # of it, so the next start doesn't run the installer again.
        wine ${installer}
        wineserver --wait
        exit 0
      fi
      app=$(find_app)

      # Menu icon: the 256 px image from the program's icon group
      icon="$prefix/icon.png"
      if [ ! -s "$icon" ]; then
        ico=$(mktemp --suffix=.ico)
        if ! wrestool --extract --type=14 "$prefix/drive_c/$app/${exe}" >"$ico" 2>/dev/null ||
          ! icotool --extract --width=256 --output="$icon" "$ico" 2>/dev/null; then
          rm -f "$icon"
        fi
        rm -f "$ico"
      fi

      cd "$prefix/drive_c/$app"
      exec wine "C:\\''${app//\//\\}\\${exe}" ${pkgs.lib.escapeShellArgs args} "$@"
    '';
  };

  desktopItem = pkgs.makeDesktopItem {
    name = pname;
    inherit desktopName comment categories;
    exec = pname;
    icon = "${home}/.local/share/${pname}/icon.png";
    startupWMClass = pkgs.lib.toLower exe;
  };
in {
  inherit launcher desktopItem;
}
