# Token for ntfy's API as `NTFY_API_TOKEN` in every login shell. The host
# provides the sops secret ntfy-api-token in its sops file. The value is
# read from the decrypted secret at shell start, so it never ends up in the
# Nix store.
{
  config,
  user,
  ...
}: let
  token = config.sops.secrets."ntfy-api-token".path;
in {
  sops.secrets."ntfy-api-token" = {
    owner = user;
    mode = "0400";
  };

  environment.extraInit = ''
    if [ -r ${token} ]; then
      NTFY_API_TOKEN="$(cat ${token})"
      export NTFY_API_TOKEN
    fi
  '';
}
