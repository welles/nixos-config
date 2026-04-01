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
    vscode
    firefox-devedition
    google-chrome
    microsoft-edge
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_10}";
  };

  environment.shellAliases = {
    ssh = "/mnt/c/Windows/System32/OpenSSH/ssh.exe";
    ssh-add = "/mnt/c/Windows/System32/OpenSSH/ssh-add.exe";
  };

  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "NixOS";
    extraGroups = ["wheel" "docker"];
    shell = pkgs.zsh;
  };
}
