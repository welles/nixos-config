# NW User Configuration
#
# System configuration for the NW user profile, intended for use in
# Windows WSL. Provides Docker for containerised development and
# lazygit for a terminal-based Git workflow.
{
  pkgs,
  user,
  ...
}: {
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    lazygit
  ];

  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "NW";
    extraGroups = ["wheel" "docker"];
    shell = pkgs.zsh;
  };
}
