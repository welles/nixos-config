# Playwright MCP for Claude Code
#
# Registers Playwright MCP from nixpkgs as a user-scope MCP server of
# Claude Code, headless and with its own Nix-built Chromium, independent of
# nix-ld and of the browsers a project downloads. ~/.claude.json is mutable
# state (persisted by modules/packages/claude-code.nix), so the entry is
# (re)written on every boot and deploy instead of linking a file; nothing
# happens before the first `claude` login has created it.
{
  lib,
  pkgs,
  user,
  ...
}: let
  home = "/home/${user}";
  server = {
    type = "stdio";
    command = lib.getExe pkgs.playwright-mcp;
    args = ["--headless"];
  };
in {
  systemd.services.claude-mcp-playwright = {
    description = "Register Playwright MCP for Claude Code";
    wantedBy = ["multi-user.target"];
    path = [pkgs.jq];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      User = user;
    };
    # Edited in place: on impermanence hosts, ~/.claude.json is a link into
    # the persistent storage, so it can't be replaced by mv
    script = ''
      if [ -f ${home}/.claude.json ]; then
        json=$(jq --argjson server ${lib.escapeShellArg (builtins.toJSON server)} \
          '.mcpServers.playwright = $server' ${home}/.claude.json)
        printf '%s\n' "$json" > ${home}/.claude.json
      fi
    '';
  };
}
