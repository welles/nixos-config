# Access to the Home Assistant instance at `homeAssistantUrl` through its
# REST and WebSocket APIs from every login shell, mainly so Claude Code can
# change its configuration (dashboards, automations, helpers, …).
#
# Exports `HASS_SERVER` and `HASS_TOKEN` and installs two clients that read
# them: `hass-cli` for REST (`hass-cli raw get /api/config`) and `ha-ws`
# for WebSocket commands
# (`ha-ws lovelace/config '{"url_path":"dashboard-zuhause"}'`).
#
# Workaround: ha-ws only exists because hass-cli's own `raw ws` fails on
# Python 3.14. Drop it once `hass-cli raw ws get_config` works again (see
# CURRENT_WORKAROUNDS.md).
#
# The long-lived access token is the same on every host and lives in this
# module's secrets.yaml; it is read from the decrypted secret at shell
# start, so it never ends up in the Nix store.
{
  config,
  lib,
  pkgs,
  user,
  homeAssistantUrl,
  ...
}: let
  token = config.sops.secrets."home-assistant-token".path;
  ha-ws = pkgs.writers.writePython3Bin "ha-ws" {
    libraries = ps: [ps.websockets];
    flakeIgnore = ["E501"];
  } (builtins.readFile ./ha-ws.py);
in {
  imports = [../packages/home-assistant-cli.nix];

  environment.systemPackages = [ha-ws];

  sops.secrets."home-assistant-token" = {
    sopsFile = ./secrets.yaml;
    owner = user;
    mode = "0400";
  };

  environment.extraInit = ''
    if [ -r ${token} ]; then
      HASS_SERVER=${lib.escapeShellArg homeAssistantUrl}
      HASS_TOKEN="$(cat ${token})"
      export HASS_SERVER HASS_TOKEN
    fi
  '';
}
