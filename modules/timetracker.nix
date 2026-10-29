# Time tracker with MARIProject transfer (github.com/welles/mari-time-tracker)
#
# A Blazor app on http://localhost:5180, run as the primary user. Nix sets
# up how it runs; Git decides which version runs:
#
#   - timetracker.service runs the newest build from
#     ~/.local/state/timetracker/current, with its data (database, the
#     MARIProject browser profile, the Google token) in
#     ~/.local/share/timetracker. It does not depend on a working copy.
#   - timetracker-deploy.service fetches `main` from GitHub (SSH key
#     github-ssh-key), so only pushed commits roll out. It builds the
#     newest one into its own clone and build directory, switches `current`
#     over and restarts the app; a failed build leaves the running version
#     alone.
#   - It runs at boot and every 2 minutes (timetracker-deploy.timer, for
#     pushes from anywhere), and right after a push from the working copy
#     `timetrackerDevRepo` (timetracker-deploy.path, on its origin/main).
#   - The MARIProject login and the Google OAuth client come from sops and
#     reach the app as systemd credentials, one file per configuration key.
#
# The host provides the secrets in its sops file: timetracker-mari-url,
# timetracker-mari-username, timetracker-mari-password,
# timetracker-google-client-id and timetracker-google-client-secret, and
# github-ssh-key (modules/github-ssh-key.nix).
# The Google sign-in is mutable state: connect once in the app.
#
#   journalctl -u timetracker -u timetracker-deploy
#   sudo systemctl start timetracker-deploy   # roll out by hand
{
  config,
  lib,
  pkgs,
  user,
  persistRoot,
  timetrackerDevRepo,
  ...
}: let
  home = "/home/${user}";
  dataDir = "${home}/.local/share/timetracker";
  stateDir = "${home}/.local/state/timetracker";
  port = 5180;
  dotnet = pkgs.dotnet-sdk_10;

  # Configuration key (file name in $CREDENTIALS_DIRECTORY) → sops secret
  credentials = {
    "Mari__Url" = "timetracker-mari-url";
    "Mari__Username" = "timetracker-mari-username";
    "Mari__Password" = "timetracker-mari-password";
    "Calendar__ClientId" = "timetracker-google-client-id";
    "Calendar__ClientSecret" = "timetracker-google-client-secret";
  };

  fetchSource = ''
    git -C "$src" fetch --quiet git@github.com:welles/mari-time-tracker.git main
  '';

  restartIfDeployed = pkgs.writeShellScript "timetracker-restart" ''
    if [ -e ${stateDir}/restart-pending ]; then
      rm ${stateDir}/restart-pending
      ${pkgs.systemd}/bin/systemctl restart timetracker.service
    fi
  '';
in {
  # nix-ld runs the Node driver Playwright ships with
  imports = [./github-ssh-key.nix ./nix-ld.nix];

  sops.secrets = lib.genAttrs (lib.attrValues credentials) (_: {});

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [
      ".local/share/timetracker"
      ".local/state/timetracker"
    ];
  };

  systemd = {
    services = {
      timetracker = {
        description = "Time tracker with MARIProject transfer";
        wantedBy = ["multi-user.target"];
        wants = ["network-online.target"];
        after = ["network-online.target" "sops-install-secrets.service"];
        # Nothing to run before the first deploy; the deploy starts it then
        unitConfig.ConditionPathExists = "${stateDir}/current/TimeTracker.Web.dll";
        environment = {
          ASPNETCORE_URLS = "http://localhost:${toString port}";
          ASPNETCORE_ENVIRONMENT = "Production";
          DOTNET_ROOT = "${dotnet}/share/dotnet";
          # NixOS has no /usr/share/zoneinfo; the session's TZDIR does not reach services
          TZDIR = "${pkgs.tzdata}/share/zoneinfo";
          TimeTracker__DataDirectory = dataDir;
          Mari__Mode = "Playwright";
          Mari__ChromePath = lib.getExe pkgs.google-chrome;
        };
        serviceConfig = {
          User = user;
          # Resolved at start, so a restart picks up the new build
          WorkingDirectory = "${stateDir}/current";
          ExecStart = "${dotnet}/bin/dotnet ${stateDir}/current/TimeTracker.Web.dll";
          LoadCredential = lib.mapAttrsToList (key: secret: "${key}:${config.sops.secrets.${secret}.path}") credentials;
          Restart = "always";
          RestartSec = "5s";
        };
      };

      # Started by its timer at boot and by its path unit, not by
      # multi-user.target: boot and `nixos-rebuild switch` must not wait for
      # a build, nor fail with it
      timetracker-deploy = {
        description = "Build and roll out the newest time tracker commit";
        wants = ["network-online.target"];
        after = ["network-online.target" "sops-install-secrets.service"];
        # bash for `sh`, which MSBuild's Exec task runs (Playwright's build targets)
        path = [dotnet pkgs.bash pkgs.git pkgs.openssh pkgs.gnutar pkgs.coreutils];
        environment = {
          DOTNET_ROOT = "${dotnet}/share/dotnet";
          DOTNET_CLI_TELEMETRY_OPTOUT = "1";
          DOTNET_NOLOGO = "1";
          # NuGet cache in ~/.nuget
          HOME = home;
        };
        serviceConfig = {
          Type = "oneshot";
          User = user;
          # "+": as root, to restart the app service. ExecStopPost also runs
          # when a later build of the same run failed, so an earlier
          # successful one still rolls out
          ExecStopPost = "+${restartIfDeployed}";
          TimeoutStartSec = "15min";
          Nice = 10;
        };
        script = ''
          set -euo pipefail
          state=${stateDir}
          src="$state/src"
          builds="$state/builds"
          mkdir -p "$builds" ${dataDir}
          [ -d "$src" ] || git init --quiet --bare "$src"
          export GIT_SSH_COMMAND="ssh -i ${config.sops.secrets."github-ssh-key".path} -o IdentitiesOnly=yes -o IdentityAgent=none"

          # The path unit does not watch while this runs, so fetch again after
          # each build until no newer commit has arrived in the meantime
          while true; do
            ${fetchSource}
            rev=$(git -C "$src" rev-parse FETCH_HEAD)
            # The running revision is the target of `current` itself, so no
            # second record can disagree with it
            if [ -e "$state/current" ] && [ "$(readlink "$state/current")" = "builds/$rev" ]; then
              echo "$rev is the newest build"
              break
            fi

            echo "Building $rev"
            work=$(mktemp -d "$state/work.XXXXXX")
            trap 'rm -rf "$work"' EXIT
            git -C "$src" archive "$rev" | tar -x -C "$work"
            dotnet publish "$work/src/TimeTracker.Web" -c Release -o "$work/out"
            # `current` does not point here (checked above), so an old build
            # of the same revision can go
            rm -rf "$builds/$rev"
            mv "$work/out" "$builds/$rev"
            rm -rf "$work"

            ln -sfn "builds/$rev" "$state/current.new"
            mv -T "$state/current.new" "$state/current"
            touch "$state/restart-pending"
          done

          # Keep the three newest builds to go back to
          ls -1t "$builds" | tail -n +4 | while read -r old; do rm -rf "''${builds:?}/$old"; done
        '';
      };
    };

    # GitHub cannot reach this host, so it asks: after boot, then 2 minutes
    # after each run. Without a new commit a run is a single fetch
    timers.timetracker-deploy = {
      description = "Roll out pushed time tracker commits";
      wantedBy = ["timers.target"];
      timerConfig = {
        OnBootSec = "1min";
        OnUnitInactiveSec = "2min";
      };
    };

    paths.timetracker-deploy = lib.mkIf (timetrackerDevRepo != null) {
      description = "Roll out the time tracker right after a push";
      wantedBy = ["multi-user.target"];
      pathConfig = {
        # A push updates origin/main of the working copy, which appends a
        # line to its reflog. Not the ref file itself: Git writes a .lock
        # file and renames it over the ref, which PathChanged does not notice
        PathChanged = "${timetrackerDevRepo}/.git/logs/refs/remotes/origin/main";
        Unit = "timetracker-deploy.service";
      };
    };
  };
}
