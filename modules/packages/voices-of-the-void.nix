# Voices of the Void (Windows only) on Proton-GE via umu-launcher
#
# `voices-of-the-void` and a menu entry. The game is not in nixpkgs and only
# ships as a Windows build on itch.io (https://mrdrnose.itch.io/votv), so the
# launcher runs it with umu-run and the Proton-GE build from nixpkgs in its
# own prefix.
#
# The game is downloaded at run time, not by Nix: new versions come out
# often and replace the old ones on itch.io (a pinned URL and hash would
# break within weeks), and anything in the closure would end up in the
# public Cachix cache with the hosts' builds; the game must not be
# redistributed there.
#
# Every start asks itch.io for the current build (the upload named
# "[RECENT] ...", or the first one if none is) and, if it differs from the
# installed one, downloads the 7z archive (~2 GB) and replaces the game
# with it. Without network the installed version starts as is. Flags:
#   --preview     use the "[EARLY PREVIEW]" build instead (and keep it)
#   --stable      go back to the "[RECENT]" build
#   --no-update   skip the check for this start
#
# ~/.local/share/voices-of-the-void holds the game, the Proton prefix
# (saves: prefix/drive_c/users/steamuser/AppData/Local/VotV/Saved, so an
# update keeps them) and the menu icon; ~/.local/share/umu holds the Steam
# Linux Runtime umu-run downloads on the first start.
{
  config,
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: let
  pname = "voices-of-the-void";
  inherit (config.users.users.${user}) home;

  launcher = pkgs.writeShellApplication {
    name = pname;
    runtimeInputs = [
      pkgs.umu-launcher
      pkgs._7zz
      pkgs.coreutils
      pkgs.curl
      pkgs.findutils
      pkgs.gnugrep
      pkgs.gnused
      pkgs.icoutils
      pkgs.libnotify
    ];
    text = ''
      game_url="https://mrdrnose.itch.io/votv"
      base="''${XDG_DATA_HOME:-$HOME/.local/share}/${pname}"
      gamedir="$base/game"
      mkdir -p "$base/prefix"

      notify() {
        echo "${pname}: $1" >&2
        notify-send --app-name="Voices of the Void" --icon="$base/icon.png" "Voices of the Void" "$1" 2>/dev/null || true
      }

      update=1
      channel=$(cat "$base/channel" 2>/dev/null || echo stable)
      args=()
      for arg in "$@"; do
        case "$arg" in
          --preview) channel=preview ;;
          --stable) channel=stable ;;
          --no-update) update=0 ;;
          *) args+=("$arg") ;;
        esac
      done
      echo "$channel" >"$base/channel"
      if [ "$channel" = preview ]; then marker="[EARLY PREVIEW]"; else marker="[RECENT]"; fi

      # Prints "<upload id> <name>" of the build to install. itch.io's free
      # download flow: the game page's CSRF token gets a download page that
      # lists the uploads (id, then name, in page order).
      latest_upload() {
        local page csrf dl uploads
        page=$(curl -fsSL -c "$cookies" -b "$cookies" "$game_url") || return 1
        csrf=$(grep -oE 'name="csrf_token" value="[^"]+"' <<<"$page" | head -n 1 | sed 's/.*value="//; s/"$//')
        [ -n "$csrf" ] || return 1
        dl=$(curl -fsS -c "$cookies" -b "$cookies" --data-urlencode "csrf_token=$csrf" "$game_url/download_url" |
          grep -oE '"url":"[^"]+"' | sed 's/^"url":"//; s/"$//; s#\\/#/#g') || return 1
        uploads=$(curl -fsSL -c "$cookies" -b "$cookies" "$dl" |
          grep -oE 'data-upload_id="[0-9]+"|<strong[^>]*class="name"[^>]*>' |
          sed -E 's/^data-upload_id="([0-9]+)"$/\1/; s/^<strong.* title="([^"]*)".*$/\1/' |
          paste -d' ' - -) || return 1
        { grep -F " $marker" <<<"$uploads" || head -n 1 <<<"$uploads"; } | head -n 1
      }

      install_upload() {
        local id=$1 name=$2 page csrf cdn archive
        page=$(curl -fsSL -c "$cookies" -b "$cookies" "$game_url") || return 1
        csrf=$(grep -oE 'name="csrf_token" value="[^"]+"' <<<"$page" | head -n 1 | sed 's/.*value="//; s/"$//')
        cdn=$(curl -fsS -c "$cookies" -b "$cookies" --data-urlencode "csrf_token=$csrf" \
          "$game_url/file/$id?after_download_lightbox=true" |
          grep -oE '"url":"[^"]+"' | head -n 1 | sed 's/^"url":"//; s/"$//; s#\\/#/#g') || return 1
        [ -n "$cdn" ] || return 1

        notify "Downloading $name (about 2 GB) ..."
        archive="$base/download.7z"
        rm -rf "$archive" "$base/game.new"
        curl -fL --progress-bar --output "$archive" "$cdn" || return 1
        7zz x -y -bso0 -bsp0 -o"$base/game.new" "$archive" || return 1
        rm -f "$archive"
        rm -rf "$gamedir"
        mv "$base/game.new" "$gamedir"
        echo "$id $name" >"$base/installed"
        rm -f "$base/icon.png"
        notify "Installed $name."
      }

      if [ "$update" = 1 ]; then
        cookies=$(mktemp)
        trap 'rm -f "$cookies"' EXIT
        if latest=$(latest_upload) && [ -n "$latest" ]; then
          if [ "$latest" != "$(cat "$base/installed" 2>/dev/null)" ]; then
            if ! install_upload "''${latest%% *}" "''${latest#* }"; then
              rm -rf "$base/download.7z" "$base/game.new"
              notify "Downloading ''${latest#* } failed."
            fi
          fi
        else
          echo "${pname}: could not check itch.io for updates" >&2
        fi
      fi

      exe=$(find "$gamedir" -type f -name VotV.exe 2>/dev/null | head -n 1)
      if [ -z "$exe" ]; then
        notify "The game is not installed and could not be downloaded from $game_url."
        exit 1
      fi

      # Menu icon from the game's executable
      icon="$base/icon.png"
      if [ ! -s "$icon" ]; then
        ico=$(mktemp --suffix=.ico)
        if ! wrestool --extract --type=14 "$exe" >"$ico" 2>/dev/null ||
          ! icotool --extract --index=1 --output="$icon" "$ico" 2>/dev/null; then
          rm -f "$icon"
        fi
        rm -f "$ico"
      fi

      export WINEPREFIX="$base/prefix"
      export PROTONPATH="${pkgs.proton-ge-bin.steamcompattool}"
      export GAMEID="umu-default"
      export STORE="itchio"

      cd "$(dirname "$exe")"
      exec umu-run "$exe" "''${args[@]}"
    '';
  };

  desktopItem = pkgs.makeDesktopItem {
    name = pname;
    desktopName = "Voices of the Void";
    comment = "Signal-hunting horror game";
    exec = pname;
    icon = "${home}/.local/share/${pname}/icon.png";
    categories = ["Game"];
    startupWMClass = "votv-win64-shipping.exe";
  };
in {
  environment.systemPackages = [launcher desktopItem];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [
      ".local/share/${pname}"
      ".local/share/umu"
    ];
  };
}
