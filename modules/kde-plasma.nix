{
  pkgs,
  lib,
  user,
  persistRoot ? null,
  ...
}: {
  programs.dconf.enable = true;

  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    power-profiles-daemon.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
    config.common.default = "kde";
  };

  # plasma-manager's `overrideConfig` wipes kxkbrc on every activation, so the
  # layout must be declared here rather than set once via System Settings.
  home-manager.sharedModules = [
    {
      programs.plasma.input.keyboard = {
        numlockOnStartup = "on";
        layouts = [{layout = "de";}];
      };
    }
  ];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user} = {
      directories = [
        ".config/kde.org"
        ".local/share/dolphin"
        ".local/share/kscreen"
        ".local/share/kwalletd"
      ];
      files = [
        ".config/kwinoutputconfig.json"
        ".config/mimeapps.list"
      ];
    };
  };
}
