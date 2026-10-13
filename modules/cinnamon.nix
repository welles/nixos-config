# Cinnamon Desktop
#
# Cinnamon on X11 with LightDM. Cinnamon keeps logins (VS Code, Chrome, gh
# etc.) in the GNOME keyring, persisted on impermanence hosts.
{
  lib,
  user,
  persistRoot ? null,
  ...
}: {
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.cinnamon.enable = true;
  };

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".local/share/keyrings"];
  };
}
