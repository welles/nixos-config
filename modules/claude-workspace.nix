# Claude Code Remote Control, one session per repository
#
# The repositories of `claudeWorkspaceRepos` ("owner/repo") are cloned into
# ~/workspace (persisted on impermanence hosts), and each of them gets its
# own permanent `claude remote-control` session working in the clone, so the
# session knows its repository from the start. Sessions are only started from
# claude.ai/code (--no-create-session-in-dir), each in a Git worktree of its
# own (--spawn worktree).
#
#   - GitHub access without 1Password: the SSH key github-ssh-key from sops
#     (the host sets its sopsFile, unless it is in the default one), used for
#     every repository in ~/workspace through core.sshCommand. Commits there
#     are not signed, as the signing key lives in 1Password.
#   - Existing clones are never touched (no pull, no reset); a repository
#     removed from the list keeps its clone, only its session goes away.
#   - Each session runs in a tmux server of its own, with its socket at
#     /run/claude-remote-control/<repo>/tmux:
#       claude-attach <repo>
#   - The Claude Code Remote tools the sessions need for pull requests
#     (attaching a repository, watching a PR) are allowed in the user's
#     ~/.claude/settings.json, so auto mode does not deny them.
#
# One-time setup after the first deploy: run `claude` once and sign in, then
# `sudo systemctl restart claude-workspace-clone 'claude-remote-control-*'`.
{
  config,
  lib,
  pkgs,
  user,
  persistRoot,
  claudeWorkspaceRepos,
  ...
}: let
  repos = claudeWorkspaceRepos;

  home = "/home/${user}";
  workspace = "${home}/workspace";
  repoName = repo: lib.last (lib.splitString "/" repo);
  sshKey = config.sops.secrets."github-ssh-key".path;
  sshCommand = "ssh -i ${sshKey} -o IdentitiesOnly=yes -o IdentityAgent=none";
  runtimeDir = name: "claude-remote-control/${name}";
  trustFilters =
    lib.concatMapStrings (repo: " | .projects[\"${workspace}/${repoName repo}\"].hasTrustDialogAccepted = true")
    repos;

  settings = "${home}/.claude/settings.json";
  allowedTools = [
    "mcp__claude-code-remote__add_repo"
    "mcp__claude-code-remote__subscribe_pr_activity"
    "mcp__claude-code-remote__unsubscribe_pr_activity"
  ];

  # Everything the sessions may need: system and Home Manager packages
  sessionPath = [
    pkgs.tmux
    "/run/current-system/sw"
    "/etc/profiles/per-user/${user}"
  ];
in {
  imports = [./github-known-host.nix];

  sops.secrets."github-ssh-key" = {
    owner = user;
    mode = "0400";
  };

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = ["workspace"];
  };

  # Attach to the tmux server of a session
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "claude-attach" ''
      if [ -z "$1" ]; then
        echo "Usage: claude-attach <${lib.concatMapStringsSep "|" repoName repos}>" >&2
        exit 1
      fi
      exec ${pkgs.tmux}/bin/tmux -S "/run/claude-remote-control/$1/tmux" attach -t claude
    '')
  ];

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
        # After the MCP servers are registered (modules/playwright-mcp.nix), as
        # both edit ~/.claude.json
        after = ["network-online.target" "sops-install-secrets.service" "claude-mcp-playwright.service"];
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
          '')
          repos
          + ''
            # remote-control has no terminal to ask on: trust the folders and
            # accept its one-time "Enable Remote Control?" dialog.
            # ~/.claude.json is mutable state, so it is edited in place (it is
            # a link into /persist, so it can't be replaced by mv)
            if [ -f ${home}/.claude.json ]; then
              json=$(jq '.remoteDialogSeen = true${trustFilters}' ${home}/.claude.json)
              printf '%s\n' "$json" > ${home}/.claude.json
            fi

            # ~/.claude/settings.json is mutable too (Claude Code writes the
            # theme there), so the allowed tools are merged into it
            mkdir -p ${home}/.claude
            [ -f ${settings} ] || echo '{}' > ${settings}
            json=$(jq --argjson allow ${lib.escapeShellArg (builtins.toJSON allowedTools)} \
              '.permissions.allow = ((.permissions.allow // []) + $allow | unique)' ${settings})
            printf '%s\n' "$json" > ${settings}
          '';
      };
    }
    // lib.listToAttrs (map (repo: let
      name = repoName repo;
      dir = "${workspace}/${name}";
      tmux = "${pkgs.tmux}/bin/tmux -S /run/${runtimeDir name}/tmux";
      # Stop with Ctrl+C, so remote-control can sign off from claude.ai: after
      # killing it, starts failed for ~3 minutes with "This folder is already
      # served by a terminal `claude remote-control` on this device"
      stop = pkgs.writeShellScript "claude-remote-control-${name}-stop" ''
        for _ in 1 2; do
          ${tmux} send-keys -t claude C-c 2>/dev/null || exit 0
          for _ in $(seq 10); do
            ${tmux} has-session -t claude 2>/dev/null || exit 0
            sleep 0.5
          done
        done
        ${tmux} kill-server 2>/dev/null || true
      '';
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
          # unit would own the server process. The socket has a fixed path
          # (claude-attach), as the service has no XDG_RUNTIME_DIR.
          RuntimeDirectory = runtimeDir name;
          Type = "forking";
          ExecStart = "${tmux} new-session -d -s claude claude remote-control --name ${name} --spawn worktree --no-create-session-in-dir --chrome";
          ExecStop = stop;
          Restart = "always";
          RestartSec = "30s";
        };
      })
    repos);
}
