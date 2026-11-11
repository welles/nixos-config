{
  pkgs,
  lib,
  user,
  persistRoot,
  ...
}: {
  programs.dconf.enable = true;

  services = {
    xserver.enable = true;
    # Hosts only used remotely (xrdp.nix) may turn it off
    displayManager.sddm.enable = lib.mkDefault true;
    desktopManager.plasma6.enable = true;
    power-profiles-daemon.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
    config.common.default = "kde";
  };

  # Plasma's settings are declared by the plasma-*.nix modules. plasma-manager's
  # `overrideConfig` resets everything else on every activation, so settings
  # made in System Settings don't survive. It also wipes kxkbrc, so the layout
  # must be declared here rather than set once via System Settings.
  #
  # kglobalshortcutsrc is exempt: apps such as 1Password or the Claude desktop
  # app register their global shortcuts through the xdg-desktop-portal, and
  # KDE asks for confirmation whenever the entry is missing. Resetting the
  # file brings that dialog back after every activation.
  home-manager.sharedModules = [
    {
      programs.plasma = {
        enable = true;
        overrideConfig = true;
        resetFilesExclude = ["kglobalshortcutsrc"];

        input.keyboard = {
          numlockOnStartup = "on";
          layouts = [{layout = "de";}];
        };
      };
    }
  ];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user} = {
      directories = [
        ".config/kde.org"
        ".local/share/applications"
        ".local/share/dolphin"
        ".local/share/kscreen"
        ".local/share/kwalletd"
      ];
      files = [
        ".config/kglobalshortcutsrc"
        ".config/kwinoutputconfig.json"
        ".config/mimeapps.list"
      ];
    };
  };
}
