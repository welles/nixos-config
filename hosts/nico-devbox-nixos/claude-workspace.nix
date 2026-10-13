# Claude Code Remote Control, one session per repository
#
# The repositories below are cloned into ~/workspace (persisted, see
# impermanence.nix), and each of them gets its own permanent
# `claude remote-control` session working in the clone, so the session
# knows its repository from the start. Sessions started on demand from
# claude.ai/code get a Git worktree of their own (--spawn worktree).
#
#   - GitHub access without 1Password: the SSH key github-ssh-key from sops
#     (the same key as the microvm devbox's devbox-github-ssh-key), used for
#     every repository in ~/workspace through core.sshCommand. Commits there
#     are not signed, as the signing key lives in 1Password.
#   - Existing clones are never touched (no pull, no reset); a repository
#     removed from the list keeps its clone, only its session goes away.
#   - Each session runs in a tmux server of its own:
#       tmux -L claude-<repo> attach
#
# One-time setup after the first deploy: run `claude` once and sign in, then
# `sudo systemctl restart claude-workspace-clone 'claude-remote-control-*'`.
{
  config,
  lib,
  pkgs,
  user,
  ...
}: let
  repos = [
    "welles/nixos-config"
    "stamm-phoenix/website-astro"
  ];

  home = "/home/${user}";
  workspace = "${home}/workspace";
  repoName = repo: lib.last (lib.splitString "/" repo);
  sshKey = config.sops.secrets."github-ssh-key".path;
  sshCommand = "ssh -i ${sshKey} -o IdentitiesOnly=yes -o IdentityAgent=none";

  # Everything the sessions may need: system and Home Manager packages
  sessionPath = [
    pkgs.tmux
    "/run/current-system/sw"
    "/etc/profiles/per-user/${user}"
  ];
in {
  sops.secrets."github-ssh-key" = {
    sopsFile = ./secrets.yaml;
    owner = user;
    mode = "0400";
  };

  programs.ssh.knownHosts.github = {
    hostNames = ["github.com"];
    publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
  };

  home-manager.users.${user}.programs.git.includes = [
    {
      condition = "gitdir:${workspace}/";
      contents = {
        core.sshCommand = sshCommand;
        commit.gpgSign = false;
        tag.gpgSign = false;
      };
    }
  ];

  systemd.services =
    {
      claude-workspace-clone = {
        description = "Clone the repositories of the Claude Remote Control sessions";
        wantedBy = ["multi-user.target"];
        wants = ["network-online.target"];
        after = ["network-online.target" "sops-install-secrets.service"];
        path = [pkgs.git pkgs.openssh pkgs.jq];
        environment.GIT_SSH_COMMAND = sshCommand;
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          User = user;
        };
        script =
          ''
            mkdir -p ${workspace}
          ''
          + lib.concatMapStrings (repo: let
            dir = "${workspace}/${repoName repo}";
          in ''
            if [ ! -d ${dir}/.git ]; then
              git clone git@github.com:${repo}.git ${dir} \
                || echo "Cloning ${repo} failed" >&2
            fi
            # Trust the folder, as remote-control has no terminal to ask on;
            # ~/.claude.json is mutable state, so it is edited in place (it is
            # a bind mount from /persist, so it can't be replaced by mv)
            if [ -d ${dir}/.git ] && [ -f ${home}/.claude.json ]; then
              json=$(jq '.projects["${dir}"].hasTrustDialogAccepted = true' ${home}/.claude.json)
              printf '%s\n' "$json" > ${home}/.claude.json
            fi
          '')
          repos;
      };
    }
    // lib.listToAttrs (map (repo: let
      name = repoName repo;
      dir = "${workspace}/${name}";
      tmux = "${pkgs.tmux}/bin/tmux -L claude-${name}";
    in
      lib.nameValuePair "claude-remote-control-${name}" {
        description = "Claude Code Remote Control session for ${repo}";
        wantedBy = ["multi-user.target"];
        wants = ["network-online.target" "claude-workspace-clone.service"];
        after = ["network-online.target" "claude-workspace-clone.service"];
        unitConfig.ConditionPathExists = "${dir}/.git";
        path = sessionPath;
        environment.DISABLE_AUTOUPDATER = "1";
        serviceConfig = {
          User = user;
          WorkingDirectory = dir;
          # A tmux server per session: with a shared one, only the first
          # unit would own the server process
          Type = "forking";
          ExecStart = "${tmux} new-session -d -s claude claude remote-control --name ${name} --spawn worktree --chrome";
          ExecStop = "${tmux} kill-server";
          Restart = "always";
          RestartSec = "30s";
        };
      })
    repos);
}
