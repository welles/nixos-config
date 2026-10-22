# Secrets of this host. secrets.yaml is encrypted with the same master key
# as the other hosts; the age key is copied to /var/lib/sops-nix/key.txt
# by hand.
#
# The tokens are exported as environment variables in every login shell.
# They are read from the decrypted env file at shell start, so the values
# never end up in the Nix store.
{
  config,
  sopsAgeKeyFile,
  pkgs,
  user,
  ...
}: let
  envFile = config.sops.templates."tokens.env".path;
  atlassianToken = config.sops.secrets."atlassian-mcp-token".path;
  atlassianEmail = config.sops.secrets."atlassian-mcp-email".path;
in {
  sops = {
    defaultSopsFile = ./secrets.yaml;
    age = {
      keyFile = sopsAgeKeyFile;
      sshKeyPaths = [];
    };
    secrets = {
      "youtrack-mcp-token" = {};
      "teamcity-token" = {};
      "atlassian-mcp-token".owner = user;
      "atlassian-mcp-email".owner = user;
    };
    templates."tokens.env" = {
      owner = user;
      mode = "0400";
      content = ''
        YOUTRACK_MCP_TOKEN=${config.sops.placeholder."youtrack-mcp-token"}
        TEAMCITY_TOKEN=${config.sops.placeholder."teamcity-token"}
      '';
    };
  };

  environment.extraInit = ''
    if [ -r ${envFile} ]; then
      set -a
      . ${envFile}
      set +a
    fi

    # sops templates only substitute values, so the Base64 encoding of
    # "email:token" for the Basic auth header is computed at shell start.
    if [ -r ${atlassianEmail} ] && [ -r ${atlassianToken} ]; then
      ATLASSIAN_MCP_AUTHORIZATION="Basic $(printf '%s:%s' "$(cat ${atlassianEmail})" "$(cat ${atlassianToken})" | ${pkgs.coreutils}/bin/base64 -w0)"
      export ATLASSIAN_MCP_AUTHORIZATION
    fi
  '';
}
