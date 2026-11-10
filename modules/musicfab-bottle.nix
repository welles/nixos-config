# MusicFab in its Bottles bottle (named "MusicFab")
#
# The bottle itself (runner, installed program, login) is set up by hand in
# Bottles; bottle.yml belongs to Bottles, which rewrites it whenever a setting
# changes. Every activation therefore sets only the keys below and leaves the
# rest alone. Without the bottle (not created yet), nothing happens.
#
# - tabtip.exe disabled: the runner's Proton tabtip.exe (Steam Deck on-screen
#   keyboard) registers for UI Automation focus events. MusicFab's Chromium
#   then builds UIA nodes that pile up in Wine's Global Interface Table and
#   stub manager lists, which are searched linearly: opening a Spotify
#   playlist froze the app at >100 % CPU (combase/ole32 in perf).
# - --in-process-gpu: Chromium's GPU process drew into MusicFab's window from
#   another process, which Wine does not retain; after the converter dialog
#   closed or the window was covered, the page stayed blank until something
#   in it changed. The argument goes into a Bottles program entry, which
#   replaces the one Bottles discovers from the Start Menu shortcut; MusicFab
#   started any other way (shortcut inside the bottle, its updater) misses it.
# - fsync instead of wineserver sync: less wineserver load.
#
# See CURRENT_WORKAROUNDS.md for the first two.
{pkgs, ...}: {
  imports = [./packages/bottles.nix];

  home-manager.sharedModules = [
    ({
      config,
      lib,
      ...
    }: {
      home.activation.musicfabBottle = lib.hm.dag.entryAfter ["writeBoundary"] ''
        bottle="${config.xdg.dataHome}/bottles/bottles/MusicFab/bottle.yml"
        if [ -f "$bottle" ]; then
          # Fixed id, so the program entry is updated instead of duplicated
          run env \
            ID=e021c367-3e85-4ffb-9537-229ffa51a491 \
            DIR='C:\MusicFab' \
            EXE='C:\MusicFab\musicfab64.exe' \
            ${lib.getExe pkgs.yq-go} -i '
              .DLL_Overrides["tabtip.exe"] = "d" |
              .Parameters.sync = "fsync" |
              .External_Programs[strenv(ID)] = {
                "arguments": "--in-process-gpu",
                "arguments_enabled": true,
                "executable": "musicfab64.exe",
                "folder": strenv(DIR),
                "id": strenv(ID),
                "name": "MusicFab",
                "path": strenv(EXE)
              }' "$bottle"
        fi
      '';
    })
  ];
}
