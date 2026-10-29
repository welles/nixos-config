{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: let
  plasmaManagerAutostart = "app-plasma\\x2dmanager\\x2dautostart@autostart.service";

  # Gives up after 30 s, so a theme never keeps the effects from starting.
  waitForPlasmaTheme = pkgs.writeShellScript "easyeffects-wait-for-plasma-theme" ''
    for _ in {1..150}; do
      ${pkgs.systemd}/bin/systemctl --user is-active --quiet '${plasmaManagerAutostart}' || exit 0
      sleep 0.2
    done
  '';
in {
  # Run EasyEffects as a background user service, so the effects are active
  # from login on and not only while the window is open.
  home-manager.sharedModules = [
    {
      services.easyeffects.enable = true;

      # The UI reads its colors from kdeglobals once, when the service starts.
      # At login, plasma-manager's autostart applies the theme from scratch
      # (`overrideConfig`), and an EasyEffects started in parallel picked up
      # the light defaults. The autostart unit is `Type=exec`, so ordering
      # alone does not wait for the theme to be written.
      systemd.user.services.easyeffects = {
        Unit.After = [plasmaManagerAutostart];
        Service.ExecStartPre = "${waitForPlasmaTheme}";
      };
    }
  ];

  # `.config/easyeffects` holds the current plugin settings and the selected
  # devices. User-saved presets in `.local/share/easyeffects` are not
  # persisted on purpose: presets are declared in Nix (see
  # `modules/easyeffects-voice-mic.nix`).
  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".config/easyeffects"];
  };
}
