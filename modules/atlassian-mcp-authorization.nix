# Basic auth header for Atlassian's MCP server as
# `ATLASSIAN_MCP_AUTHORIZATION` in every login shell, from the sops secrets
# atlassian-mcp-email and atlassian-mcp-token, which the host provides in its
# sops file. sops templates only substitute values, so the Base64 encoding
# of "email:token" is computed at shell start; the values never end up in
# the Nix store.
{
  config,
  pkgs,
  user,
  ...
}: let
  email = config.sops.secrets."atlassian-mcp-email".path;
  token = config.sops.secrets."atlassian-mcp-token".path;
in {
  sops.secrets = {
    "atlassian-mcp-email".owner = user;
    "atlassian-mcp-token".owner = user;
  };

  environment.extraInit = ''
    if [ -r ${email} ] && [ -r ${token} ]; then
      ATLASSIAN_MCP_AUTHORIZATION="Basic $(printf '%s:%s' "$(cat ${email})" "$(cat ${token})" | ${pkgs.coreutils}/bin/base64 -w0)"
      export ATLASSIAN_MCP_AUTHORIZATION
    fi
  '';
}
