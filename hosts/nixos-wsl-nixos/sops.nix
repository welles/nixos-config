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
  user,
  ...
}: let
  envFile = config.sops.templates."tokens.env".path;
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
  '';
}
