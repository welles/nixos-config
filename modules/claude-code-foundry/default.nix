# Claude Code on Microsoft Foundry (Azure)
#
# `claude` keeps using the own Claude account (subscription sign-in), while
# `claude-foundry` starts the same Claude Code against a Claude deployment
# in Microsoft Foundry, authenticated with the resource's API key. Both share
# ~/.claude, so settings, history and `claude --resume` work across both.
# The app menu gets a "Claude Code (Microsoft Foundry)" entry that opens
# `claude-foundry` in a terminal.
#
# The resource name and the API key (Foundry portal: the resource's
# "Endpoints and keys") live in ./secrets.yaml:
#   sops modules/claude-code-foundry/secrets.yaml
# They are read from the decrypted secrets when `claude-foundry` starts, so
# they never end up in the Nix store or in the login environment. They do
# reach the processes Claude Code starts (Bash commands, hooks, MCP servers),
# as Claude Code takes them from its own environment.
#
# The deployments in Foundry must be named after the model IDs below (or the
# names below changed to the deployment names). `/status` inside
# `claude-foundry` shows "Microsoft Foundry" as the API provider.
{
  config,
  pkgs,
  user,
  ...
}: let
  resourceFile = config.sops.secrets."claude-foundry-resource".path;
  apiKeyFile = config.sops.secrets."claude-foundry-api-key".path;

  # Foundry deployment names behind Claude Code's model aliases
  models = {
    opus = "claude-opus-4-8";
    sonnet = "claude-sonnet-5";
    haiku = "claude-haiku-4-5";
  };

  claude-foundry = pkgs.writeShellApplication {
    name = "claude-foundry";
    runtimeInputs = [pkgs.coreutils];
    text = ''
      for secret in ${resourceFile} ${apiKeyFile}; do
        if [ ! -r "$secret" ]; then
          echo "claude-foundry: cannot read $secret (sops secret missing?)" >&2
          exit 1
        fi
        if [ "$(cat "$secret")" = CHANGE-ME ]; then
          echo "claude-foundry: $secret is still a placeholder;" \
            "set it with: sops modules/claude-code-foundry/secrets.yaml" >&2
          exit 1
        fi
      done

      CLAUDE_CODE_USE_FOUNDRY=1
      ANTHROPIC_FOUNDRY_RESOURCE="$(cat ${resourceFile})"
      ANTHROPIC_FOUNDRY_API_KEY="$(cat ${apiKeyFile})"
      ANTHROPIC_DEFAULT_OPUS_MODEL=${models.opus}
      ANTHROPIC_DEFAULT_SONNET_MODEL=${models.sonnet}
      ANTHROPIC_DEFAULT_HAIKU_MODEL=${models.haiku}
      export CLAUDE_CODE_USE_FOUNDRY ANTHROPIC_FOUNDRY_RESOURCE \
        ANTHROPIC_FOUNDRY_API_KEY ANTHROPIC_DEFAULT_OPUS_MODEL \
        ANTHROPIC_DEFAULT_SONNET_MODEL ANTHROPIC_DEFAULT_HAIKU_MODEL

      exec claude "$@"
    '';
  };

  desktopItem = pkgs.makeDesktopItem {
    name = "claude-foundry";
    desktopName = "Claude Code (Microsoft Foundry)";
    comment = "Claude Code with the Claude deployment in Microsoft Foundry";
    exec = "claude-foundry";
    icon = "utilities-terminal";
    terminal = true;
    categories = ["Development"];
  };
in {
  # Persistence of ~/.claude and ~/.claude.json comes with the CLI module.
  imports = [../packages/claude-code.nix];

  sops.secrets = {
    "claude-foundry-resource" = {
      sopsFile = ./secrets.yaml;
      owner = user;
      mode = "0400";
    };
    "claude-foundry-api-key" = {
      sopsFile = ./secrets.yaml;
      owner = user;
      mode = "0400";
    };
  };

  environment.systemPackages = [
    claude-foundry
    desktopItem
  ];
}
