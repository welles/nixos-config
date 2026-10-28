# Time tracker with MARIProject transfer (github.com/welles/mari-time-tracker)
#
# A Blazor app on http://localhost:5180, run as the primary user. Nix sets
# up how it runs; Git decides which version runs:
#
#   - timetracker.service runs the newest build from
#     ~/.local/state/timetracker/current, with its data (database, the
#     MARIProject browser profile, the Google token) in
#     ~/.local/share/timetracker. It does not depend on a working copy.
#   - timetracker-deploy.service builds the newest commit of `main` into
#     its own clone and build directory, switches `current` over and
#     restarts the app; a failed build leaves the running version alone.
#     It fetches from the working copy `timetrackerDevRepo` when that
#     exists, so commits roll out without a push, and from GitHub with the
#     deploy key `timetracker-deploy-key` otherwise (e.g. on a fresh host).
#     It runs at boot and, through timetracker-deploy.path, whenever `main`
#     of the working copy changes.
#   - The MARIProject login and the Google OAuth client come from sops and
#     reach the app as systemd credentials, one file per configuration key.
#
# The host provides the secrets in its sops file: timetracker-mari-url,
# timetracker-mari-username, timetracker-mari-password,
# timetracker-google-client-id, timetracker-google-client-secret and
# timetracker-deploy-key (private key of a read-only deploy key).
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

  fetchSource =
    if timetrackerDevRepo != null
    then ''
      # The working copy first: its commits roll out without a push
      if [ -d ${timetrackerDevRepo}/.git ]; then
        git -C "$src" fetch --quiet ${timetrackerDevRepo} main
      else
        git -C "$src" fetch --quiet git@github.com:welles/mari-time-tracker.git main
      fi
    ''
    else ''
      git -C "$src" fetch --quiet git@github.com:welles/mari-time-tracker.git main
    '';

  restartIfDeployed = pkgs.writeShellScript "timetracker-restart" ''
    if [ -e ${stateDir}/restart-pending ]; then
      rm ${stateDir}/restart-pending
      ${pkgs.systemd}/bin/systemctl restart timetracker.service
    fi
  '';
in {
  imports = [./github-known-host.nix];

  sops.secrets =
    lib.genAttrs (lib.attrValues credentials) (_: {})
    // {"timetracker-deploy-key" = {};};

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

      timetracker-deploy = {
        description = "Build and roll out the newest time tracker commit";
        wantedBy = ["multi-user.target"];
        wants = ["network-online.target"];
        after = ["network-online.target" "sops-install-secrets.service"];
        path = [dotnet pkgs.git pkgs.openssh pkgs.gnutar pkgs.coreutils];
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
          LoadCredential = "deploy-key:${config.sops.secrets."timetracker-deploy-key".path}";
          # "+": as root, to restart the app service
          ExecStartPost = "+${restartIfDeployed}";
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
          export GIT_SSH_COMMAND="ssh -i $CREDENTIALS_DIRECTORY/deploy-key -o IdentitiesOnly=yes -o IdentityAgent=none"

          ${fetchSource}
          rev=$(git -C "$src" rev-parse FETCH_HEAD)
          if [ -e "$state/current" ] && [ "$(cat "$state/current.rev" 2>/dev/null)" = "$rev" ]; then
            echo "$rev is already running"
            exit 0
          fi

          echo "Building $rev"
          work=$(mktemp -d "$state/work.XXXXXX")
          trap 'rm -rf "$work"' EXIT
          git -C "$src" archive "$rev" | tar -x -C "$work"
          rm -rf "$builds/$rev"
          dotnet publish "$work/src/TimeTracker.Web" -c Release -o "$work/out"
          mv "$work/out" "$builds/$rev"

          ln -sfn "builds/$rev" "$state/current.new"
          mv -T "$state/current.new" "$state/current"
          echo "$rev" > "$state/current.rev"
          touch "$state/restart-pending"

          # Keep the three newest builds to go back to
          ls -1t "$builds" | tail -n +4 | while read -r old; do rm -rf "''${builds:?}/$old"; done
        '';
      };
    };

    paths.timetracker-deploy = lib.mkIf (timetrackerDevRepo != null) {
      description = "Roll out the time tracker on commits to main";
      wantedBy = ["multi-user.target"];
      pathConfig = {
        # Git replaces the ref file on every commit; packed-refs after a gc
        PathChanged = [
          "${timetrackerDevRepo}/.git/refs/heads/main"
          "${timetrackerDevRepo}/.git/packed-refs"
        ];
        Unit = "timetracker-deploy.service";
      };
    };
  };
}
