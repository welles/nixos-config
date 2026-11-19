# Claude Remote Manager
#
# The self-hosted web frontend for Claude Code sessions
# (github:welles/claude-remote-manager, flake input `claude-remote-manager`),
# run by the app's own NixOS module as the login user `user`, signed in
# through Cloudflare Access. No sandbox: sessions are Claude Code of `user`
# like a terminal session, with the user's ~/.claude (login, skills,
# plugins, MCP servers), the whole file system, Docker and the user's
# credentials. Listens on loopback, for a Cloudflare Tunnel of the same host
# (cloudflared.nix).
#
# `claudeRemoteManager` holds the host's values: `hostName` (the app's public
# host name), `previewUrl` (base of the preview host names of dev servers, or
# `null` for no previews), the Cloudflare Access `accessTeamDomain`,
# `accessAudience` (app) and `previewAccessAudience` (previews, their own
# Access application; only with `previewUrl`),
# `accessAllowedEmails`, the GitHub App's `githubAppId`, the optional
# `githubTrustedBots` (logins of reviewer bots whose reviews and comments the
# PR automation treats like those of people with write access; only pure
# reviewer apps, never github-actions[bot]), the `ntfyTopic` on
# the ntfy server `ntfyUrl`, and `instructions` (Markdown appended to the
# sessions' system prompt: what the machine and its network are). A value
# still `null` stops the evaluation with a list of what is missing.
#
# Secrets (root-only; the service gets them as systemd credentials), in the
# host's sops file: claude-remote-manager/github-app-key (the GitHub App's
# private key, PEM), claude-remote-manager/github-webhook-secret (the App's
# webhook secret), claude-remote-manager/ntfy-token (an ntfy token allowed to
# publish to the topic).
#
# Git in the session clones (under the data directory) works like in
# ~/workspace (workspace-git.nix): GitHub over SSH with the sops key
# github-ssh-key instead of the 1Password agent, which nobody unlocks while
# a session pushes, and unsigned commits. The clones' `origin` is GitHub's
# HTTPS URL, so pushes are rewritten to SSH.
#
# State: the data directory /var/lib/claude-remote-manager (database,
# mirrors and session clones) as one persisted directory, so clones keep
# hardlinking the mirrors' objects, and the root-only directory in which
# the app records to whom it gave the data directory
# (/var/lib/claude-remote-manager-owner/<hash of the data directory>; the
# app creates it as root:root 0700 and checks that on every start).
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
  dataDir = "/var/lib/claude-remote-manager";

  secretNames = ["github-app-key" "github-webhook-secret" "ntfy-token"];
  secret = name: config.sops.secrets."claude-remote-manager/${name}".path;

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
  imports = [
    inputs.claude-remote-manager.nixosModules.default
    ./github-ssh-key.nix
  ];

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

    inherit user;

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
      trustedBots = cfg.githubTrustedBots or [];
    };
    ntfy = {
      url = ntfyUrl;
      topic = cfg.ntfyTopic;
      tokenFile = secret "ntfy-token";
    };

    extraInstructions = lib.mkIf (cfg.instructions != null) cfg.instructions;
  };

  # The session clones' git: like ~/workspace (workspace-git.nix), plus
  # pushes to GitHub's HTTPS URLs over SSH.
  home-manager.users.${user}.programs.git.includes = [
    {
      condition = "gitdir:${dataDir}/workspace/";
      contents = {
        core.sshCommand = "ssh -i ${config.sops.secrets."github-ssh-key".path} -o IdentitiesOnly=yes -o IdentityAgent=none";
        url."git@github.com:".pushInsteadOf = "https://github.com/";
        commit.gpgSign = false;
        tag.gpgSign = false;
      };
    }
  ];

  sops.secrets = lib.genAttrs (map (name: "claude-remote-manager/${name}") secretNames) (_: {
    restartUnits = ["claude-remote-manager.service"];
  });

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.directories = [
      dataDir
      # A directory (the app writes its stamp file inside), root's only.
      {
        directory = "/var/lib/claude-remote-manager-owner";
        mode = "0700";
      }
    ];
  };
}
