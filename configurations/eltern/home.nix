# Eltern (Parents) Home Manager Configuration
#
# Minimal configuration — only enables home-manager itself.
# No custom shell or tooling needed for this user profile.
{pkgs, ...}: {
  programs.home-manager.enable = true;
}
