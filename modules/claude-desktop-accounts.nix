# Several Claude accounts side by side in Claude Desktop, one app instance
# per account (CLI side: claude-code-accounts.nix).
#
# The first entry of `claudeAccounts` uses the app's default data folder
# (~/.config/Claude) and Claude Code's default config, so its sign-in stays.
# Every further account runs its own instance with --user-data-dir
# ~/.config/Claude-<id> (own sign-in, own single-instance lock) and
# CLAUDE_CONFIG_DIR ~/.claude-<id> for its Claude Code sessions.
#
# Each account gets a menu entry "Claude (<name>)" and a command
# `claude-desktop-<id>`. All instances share the Wayland app_id
# com.anthropic.Claude, so the task manager groups their windows together.
#
# Sign-in, "Open in Claude" and file opens come back as claude:// links or
# files through the system's handler, which cannot tell the instances
# apart. `claude-desktop-open` routes them: to the only running instance,
# otherwise it asks which account to use.
#
# Cowork talks to its VM through a fixed socket
# ($XDG_RUNTIME_DIR/claude-cowork-vm.sock) that does not depend on the data
# folder, so use Cowork in only one instance at a time.
{
  lib,
  pkgs,
  user,
  persistRoot,
  claudeAccounts,
  ...
}: let
  primary =
    if claudeAccounts == []
    then throw "claudeAccounts must list at least one account"
    else lib.head claudeAccounts;
  additional = lib.tail claudeAccounts;

  userDataDir = account:
    if account == primary
    then "$HOME/.config/Claude"
    else "$HOME/.config/Claude-${account.id}";

  launcher = account:
    pkgs.writeShellScriptBin "claude-desktop-${account.id}" (
      if account == primary
      then ''
        unset CLAUDE_CONFIG_DIR
        exec claude-desktop "$@"
      ''
      else ''
        export CLAUDE_CONFIG_DIR="$HOME/.claude-${account.id}"
        exec claude-desktop --user-data-dir="${userDataDir account}" "$@"
      ''
    );

  # claude-desktop-open <id> [URL or file …]
  # Without arguments, starts (or focuses) the instance of account <id>.
  # With arguments, hands them to the only running instance, or asks; the
  # most recently started instance comes first in the dialog (a sign-in
  # usually answers the instance that was just opened).
  open = pkgs.writeShellApplication {
    name = "claude-desktop-open";
    runtimeInputs = [pkgs.kdePackages.kdialog pkgs.coreutils];
    text = ''
      account="''${1:?usage: claude-desktop-open <account> [URL or file …]}"
      shift
      if [ "$#" -eq 0 ]; then
        exec "claude-desktop-$account" "$@"
      fi

      ids=(${lib.concatMapStringsSep " " (account: lib.escapeShellArg account.id) claudeAccounts})
      names=(${lib.concatMapStringsSep " " (account: lib.escapeShellArg account.name) claudeAccounts})
      dirs=(${lib.concatMapStringsSep " " (account: ''"${userDataDir account}"'') claudeAccounts})

      # Chromium's single-instance lock is a symlink "<hostname>-<pid>",
      # created when the instance starts. It survives a crash, so the PID
      # must still belong to Claude Desktop. Prints the start time.
      started() {
        local lock="$1/SingletonLock" target pid exe
        target=$(readlink "$lock" 2>/dev/null) || return 1
        [ "''${target%-*}" = "$(uname -n)" ] || return 1
        pid="''${target##*-}"
        exe=$(tr '\0' '\n' <"/proc/$pid/cmdline" 2>/dev/null | head -n1) || return 1
        [ "$(basename -- "$exe")" = claude-desktop ] || return 1
        stat -c %Y "$lock"
      }

      running=()
      newest=-1
      first="$account"
      for i in "''${!ids[@]}"; do
        if ts=$(started "''${dirs[$i]}"); then
          running+=("''${ids[$i]}")
          if [ "$ts" -gt "$newest" ]; then
            newest="$ts"
            first="''${ids[$i]}"
          fi
        fi
      done

      if [ "''${#running[@]}" -eq 1 ]; then
        target="''${running[0]}"
      else
        # The first entry is preselected.
        menu=()
        for i in "''${!ids[@]}"; do
          if [ "''${ids[$i]}" = "$first" ]; then menu=("''${ids[$i]}" "''${names[$i]}" "''${menu[@]}"); fi
        done
        for i in "''${!ids[@]}"; do
          if [ "''${ids[$i]}" != "$first" ]; then menu+=("''${ids[$i]}" "''${names[$i]}"); fi
        done
        target=$(kdialog --title Claude --menu "Mit welchem Claude-Konto öffnen?" "''${menu[@]}") || exit 0
      fi
      exec "claude-desktop-$target" "$@"
    '';
  };

  desktopEntry = account: {
    name = "Claude (${account.name})";
    genericName = "AI Assistant";
    comment = "Desktop application for Claude.ai";
    exec = "claude-desktop-open ${account.id} %U";
    icon = "claude-desktop";
    type = "Application";
    categories = ["Utility" "Development"];
    mimeType = [
      "x-scheme-handler/claude"
      "application/vnd.anthropic.mcpb"
      "application/vnd.anthropic.skill"
    ];
    startupNotify = true;
    settings = {
      Keywords = "AI;Chat;Assistant;Claude;Code;LLM;${account.name};";
      StartupWMClass = "com.anthropic.Claude";
      SingleMainWindow = "true";
    };
    actions = {
      NewChat = {
        name = "New Chat";
        exec = ''claude-desktop-${account.id} "claude://claude.ai/new?surface=chat&source=desktop_action"'';
      };
      NewCode = {
        name = "New Claude Code Session";
        exec = ''claude-desktop-${account.id} "claude://code/new?source=desktop_action"'';
      };
    };
  };
in {
  imports = [
    ./claude-code-accounts.nix
    ./packages/claude-desktop.nix
  ];

  environment.systemPackages = [open] ++ map launcher claudeAccounts;

  home-manager.sharedModules = [
    {
      # The primary account's entry keeps the app's own desktop file id, so
      # it replaces the package's "Claude" entry and stays the claude://
      # handler the app registers.
      xdg.desktopEntries = lib.listToAttrs (map (account: {
          name =
            if account == primary
            then "com.anthropic.Claude"
            else "claude-desktop-${account.id}";
          value = desktopEntry account;
        })
        claudeAccounts);
    }
  ];

  environment.persistence = lib.mkIf (persistRoot != null && additional != []) {
    ${persistRoot}.users.${user}.directories = map (account: ".config/Claude-${account.id}") additional;
  };
}
