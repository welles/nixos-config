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

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    lazygit
    lazydocker
    k9s
    k0sctl
    kubeseal
    kubelogin
    jetbrains.rider
    dotnet-sdk_10
    nodejs
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_10}";
  };

  environment.shellAliases = {
    ssh = "ssh.exe";
    ssh-add = "ssh-add.exe";
  };

  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "NW";
    extraGroups = ["wheel" "docker"];
    shell = pkgs.zsh;
  };

  users.users.nixos = {
    isNormalUser = true;
    description = "NixOS";
    shell = pkgs.shadow; 
  };
}
