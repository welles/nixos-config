# Several Claude accounts side by side in Claude Code (CLI).
#
# The first entry of `claudeAccounts` uses Claude Code's default locations
# (~/.claude, ~/.claude.json), so plain `claude` keeps its sign-in and stays
# that account. Every further account gets its own config directory
# ~/.claude-<id> through CLAUDE_CONFIG_DIR, which holds its sign-in
# (.credentials.json), .claude.json, settings, sessions and plugins.
#
# Every account gets a command `claude-<id>`, e.g. `claude-stamm-phoenix`.
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
  claude = lib.getExe pkgs.claude-code;

  launcher = account:
    pkgs.writeShellScriptBin "claude-${account.id}" (
      if account == primary
      then ''
        unset CLAUDE_CONFIG_DIR
        exec ${claude} "$@"
      ''
      else ''
        export CLAUDE_CONFIG_DIR="$HOME/.claude-${account.id}"
        exec ${claude} "$@"
      ''
    );
in {
  imports = [./packages/claude-code.nix];

  environment.systemPackages = map launcher claudeAccounts;

  environment.persistence = lib.mkIf (persistRoot != null && additional != []) {
    ${persistRoot}.users.${user}.directories = map (account: ".claude-${account.id}") additional;
  };
}
