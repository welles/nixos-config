# Token for YouTrack's MCP server as `YOUTRACK_MCP_TOKEN` in every login
# shell. The host provides the sops secret youtrack-mcp-token in its sops
# file. The value is read from the decrypted secret at shell start, so it
# never ends up in the Nix store.
{
  config,
  user,
  ...
}: let
  token = config.sops.secrets."youtrack-mcp-token".path;
in {
  sops.secrets."youtrack-mcp-token" = {
    owner = user;
    mode = "0400";
  };

  environment.extraInit = ''
    if [ -r ${token} ]; then
      YOUTRACK_MCP_TOKEN="$(cat ${token})"
      export YOUTRACK_MCP_TOKEN
    fi
  '';
}
