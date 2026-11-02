# Token for TeamCity's API as `TEAMCITY_TOKEN` in every login shell. The
# host provides the sops secret teamcity-token in its sops file. The value
# is read from the decrypted secret at shell start, so it never ends up in
# the Nix store.
{
  config,
  user,
  ...
}: let
  token = config.sops.secrets."teamcity-token".path;
in {
  sops.secrets."teamcity-token" = {
    owner = user;
    mode = "0400";
  };

  environment.extraInit = ''
    if [ -r ${token} ]; then
      TEAMCITY_TOKEN="$(cat ${token})"
      export TEAMCITY_TOKEN
    fi
  '';
}
