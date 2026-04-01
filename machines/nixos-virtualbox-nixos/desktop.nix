# XFCE Desktop Environment
#
# Lightweight desktop for VirtualBox development VM.
# Auto-login enabled since this is a non-production VM.
# XFCE configuration regenerates from defaults on each boot (declarative).
{user, ...}: {
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  services.displayManager.autoLogin = {
    enable = true;
    user = user;
  };
}
