{
  lib,
  user,
  persistRoot,
  ...
}: {
  # Run EasyEffects as a background user service, so the effects are active
  # from login on and not only while the window is open.
  home-manager.sharedModules = [
    {
      services.easyeffects.enable = true;
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
