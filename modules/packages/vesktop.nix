{
  lib,
  user,
  persistRoot,
  ...
}: {
  home-manager.sharedModules = [
    {
      programs.vesktop = {
        enable = true;

        # Vesktop keeps its own copy of Vencord and updates it itself
        # (`vencord.useSystem` stays off), so plugins that break with a Discord
        # update get fixed without waiting for nixpkgs.

        # Settings below are merged into the writable settings files, so
        # changes made in the app are kept.
        mutableSettings = true;
        vencord.mutableSettings = true;

        settings = {
          discordBranch = "stable";
          tray = true;
          minimizeToTray = true;
          # Rich presence ("Playing …") for games and other local apps.
          arRPC = true;
        };
      };
    }
  ];

  # Login session, settings and the downloaded Vencord build.
  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".config/vesktop"];
  };
}
