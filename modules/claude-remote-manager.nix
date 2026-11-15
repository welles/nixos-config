# Claude Remote Manager
#
# The self-hosted web frontend for Claude Code sessions
# (github:welles/claude-remote-manager, flake input `claude-remote-manager`),
# run by the app's own NixOS module: the API as the system user
# claude-remote-manager, the sessions as the login user `user`
# (`sessionUser.create = false`), signed in through Cloudflare Access.
# Listens on loopback; claude-remote-manager-lan-tunnel.nix opens it to a
# tunnel on another machine.
#
# `claudeRemoteManager` holds the host's values: `hostName` (the app's public
# host name), `previewUrl` (base of the preview host names of dev servers, or
# `null` for no previews), the Cloudflare Access `accessTeamDomain`,
# `accessAudience` (app) and `previewAccessAudience` (previews, their own
# Access application; only with `previewUrl`),
# `accessAllowedEmails`, the GitHub App's `githubAppId`, the `ntfyTopic` on
# the ntfy server `ntfyUrl`, and `instructions` (Markdown for the sessions'
# managed CLAUDE.md: what the machine and its network are). A value still
# `null` stops the evaluation with a list of what is missing.
#
# Secrets (root-only; the service gets them as systemd credentials), in the
# host's sops file: claude-remote-manager/github-app-key (the GitHub App's
# private key, PEM), claude-remote-manager/github-webhook-secret (the App's
# webhook secret), claude-remote-manager/ntfy-token (an ntfy token allowed to
# publish to the topic).
#
# State: the data directory /var/lib/claude-remote-manager (database,
# mirrors and session clones, the sessions' Claude login in claude/) as one
# persisted directory, so clones keep hardlinking the mirrors' objects.
#
# Inside the service (and so in every session) these stay out of reach:
# sops-nix's secrets and age key (also its copy under `persistRoot`), the SSH
# host keys, the Docker socket (Docker would make sessions root), the
# 1Password SSH agent, and the user's own Claude Code configuration and
# GitHub CLI login, so sessions neither change the interactive Claude Code
# nor reach GitHub past the app's approved pushes. The rest of the user's
# home is writable, the rest of the file system read-only.
{
  config,
  lib,
  inputs,
  user,
  persistRoot,
  ntfyUrl,
  claudeRemoteManager,
  ...
}: let
  cfg = claudeRemoteManager;
  home = config.users.users.${user}.home;
  dataDir = "/var/lib/claude-remote-manager";

  secretNames = ["github-app-key" "github-webhook-secret" "ntfy-token"];
  secret = name: config.sops.secrets."claude-remote-manager/${name}".path;

  # The user's own credentials and Claude Code configuration, relative to
  # the home directory, hidden from sessions (and their persistent copies).
  privateHomePaths = [
    ".claude"
    ".claude.json"
    ".config/gh"
    ".1password"
  ];

  required =
    [
      "hostName"
      "accessTeamDomain"
      "accessAudience"
      "accessAllowedEmails"
      "githubAppId"
      "ntfyTopic"
      "instructions"
    ]
    ++ lib.optional (cfg.previewUrl != null) "previewAccessAudience";
  missing = lib.filter (name: (cfg.${name} or null) == null) required;
in {
  imports = [inputs.claude-remote-manager.nixosModules.default];

  assertions = [
    {
      assertion = missing == [];
      message = "claude-remote-manager.nix: set ${lib.concatStringsSep ", " missing} in the host's claudeRemoteManager module argument.";
    }
  ];

  services.claude-remote-manager = {
    enable = true;
    inherit dataDir;
    listenAddress = lib.mkDefault "127.0.0.1";
    port = 8080;

    sessionUser = {
      name = user;
      create = false;
    };

    auth = {
      mode = "cloudflare-access";
      teamDomain = cfg.accessTeamDomain;
      audiences = lib.optional (cfg.accessAudience != null) cfg.accessAudience;
      allowedEmails = lib.optionals (cfg.accessAllowedEmails != null) cfg.accessAllowedEmails;
    };
    allowedHosts = lib.optional (cfg.hostName != null) cfg.hostName;
    publicUrl = lib.mkIf (cfg.hostName != null) "https://${cfg.hostName}";
    preview = lib.mkIf (cfg.previewUrl != null) {
      url = cfg.previewUrl;
      accessAudiences = lib.optional ((cfg.previewAccessAudience or null) != null) cfg.previewAccessAudience;
    };

    github = {
      appId = cfg.githubAppId;
      privateKeyFile = secret "github-app-key";
      webhookSecretFile = secret "github-webhook-secret";
    };
    ntfy = {
      url = ntfyUrl;
      topic = cfg.ntfyTopic;
      tokenFile = secret "ntfy-token";
    };

    hiddenPaths =
      lib.concatMap (p: ["${home}/${p}"] ++ lib.optional (persistRoot != null) "${persistRoot}${home}/${p}") privateHomePaths
      ++ lib.optionals (persistRoot != null) (
        ["${persistRoot}/var/lib/sops-nix"]
        ++ map (key: "${persistRoot}${key.path}") config.services.openssh.hostKeys
      )
      ++ lib.optionals config.virtualisation.docker.enable ["/run/docker.sock"];

    extraInstructions = lib.mkIf (cfg.instructions != null) cfg.instructions;
  };

  # Hidden paths must exist when the service starts. The 1Password agent
  # creates its directory only when it runs, possibly after the service.
  systemd.tmpfiles.settings."10-claude-remote-manager-hidden"."${home}/.1password".d = {
    inherit user;
    group = config.users.users.${user}.group;
    mode = "0700";
  };

  # /run/docker.sock is hidden by a mount on the file, which exists only from
  # docker.socket on. Restarting docker.socket recreates the file and so
  # drops the mount inside the namespace: stop the service with docker.socket
  # and start it again with it.
  systemd.services.claude-remote-manager = lib.mkIf config.virtualisation.docker.enable {
    after = ["docker.socket"];
    partOf = ["docker.socket"];
    wantedBy = ["docker.socket"];
  };

  sops.secrets = lib.genAttrs (map (name: "claude-remote-manager/${name}") secretNames) (_: {
    restartUnits = ["claude-remote-manager.service"];
  });

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.directories = [dataDir];
  };
}
