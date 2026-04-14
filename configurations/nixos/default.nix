# NixOS User Configuration
#
# System configuration for the NixOS user profile, intended for use in
# Windows WSL. Provides Docker for containerised development and
# lazygit for a terminal-based Git workflow.
{
  pkgs,
  user,
  ...
}: {
  imports = [
    ../../modules/docker.nix
    ../../modules/headlamp.nix
    ../../modules/tmux.nix
  ];

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    lazygit
    lazydocker
    k9s
    k0sctl
    kdePackages.dolphin
    kubeseal
    kubelogin
    jetbrains.rider
    dotnet-sdk_10
    mercurial
    nodejs
    vscode
    firefox-devedition
    google-chrome
    microsoft-edge
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
  };

  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "NixOS";
    extraGroups = ["wheel"];
    shell = pkgs.zsh;
    linger = true;
  };
}
