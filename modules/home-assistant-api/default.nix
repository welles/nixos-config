# Access to the home Home Assistant instance's REST and WebSocket APIs
# from every login shell, mainly so Claude Code can change its
# configuration (dashboards, automations, helpers, …).
#
# Exports `HASS_SERVER` and `HASS_TOKEN`, which `hass-cli` picks up on its
# own, e.g. `hass-cli raw get /api/config` for REST or
# `hass-cli raw ws lovelace/config --json '{"url_path":"dashboard-zuhause"}'`
# for WebSocket commands. The long-lived access token is the same on every
# host and lives in this module's secrets.yaml; it is read from the
# decrypted secret at shell start, so it never ends up in the Nix store.
{
  config,
  user,
  ...
}: let
  token = config.sops.secrets."home-assistant-token".path;
in {
  imports = [../packages/home-assistant-cli.nix];

  sops.secrets."home-assistant-token" = {
    sopsFile = ./secrets.yaml;
    owner = user;
    mode = "0400";
  };

  environment.extraInit = ''
    if [ -r ${token} ]; then
      HASS_SERVER="https://homeassistant.welles.app"
      HASS_TOKEN="$(cat ${token})"
      export HASS_SERVER HASS_TOKEN
    fi
  '';
}
