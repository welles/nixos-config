{
  hostname,
  inputs,
  ...
}: {
  imports = [
    # Hardware & boot
    ./hardware-configuration.nix

    # Desktop environment
    ./desktop.nix

    # Home Manager
    ../../modules/home/konsole.nix
    ../../modules/home/shell.nix
    ../../modules/home/yazi.nix

    # User & identity
    ../../modules/home-manager-user.nix
    ../../modules/user-account.nix

    # System
    ../../modules/dotnet-sdk-env.nix
    ../../modules/keyboard.nix
    ../../modules/locale-de.nix
    ../../modules/nix-ld-dev-libraries.nix
    ../../modules/nix-settings.nix
    ../../modules/nixos-tools.nix
    ../../modules/tmux.nix

    # Services & hardware
    ../../modules/docker.nix
    inputs.nixos-wsl.nixosModules.default
    ./wsl.nix

    # Packages
    ../../modules/packages/bruno.nix
    ../../modules/packages/dotnet-sdk_10.nix
    ../../modules/packages/firefox-devedition.nix
    ../../modules/packages/google-chrome.nix
    ../../modules/packages/headlamp.nix
    ../../modules/packages/hoppscotch.nix
    ../../modules/packages/jetbrains-rider.nix
    ../../modules/packages/jq.nix
    ../../modules/packages/k0sctl.nix
    ../../modules/packages/k9s.nix
    ../../modules/packages/kdePackages-dolphin.nix
    ../../modules/packages/keeper.nix
    ../../modules/packages/kind.nix
    ../../modules/packages/kubectl.nix
    ../../modules/packages/kubelogin-oidc.nix
    ../../modules/packages/kubernetes-helm.nix
    ../../modules/packages/kubeseal.nix
    ../../modules/packages/lazydocker.nix
    ../../modules/packages/lazygit.nix
    ../../modules/packages/mercurial.nix
    ../../modules/packages/microsoft-edge.nix
    ../../modules/packages/nodejs.nix
    ../../modules/packages/nuke.nix
    ../../modules/packages/openssl.nix
    ../../modules/packages/perl.nix
    ../../modules/packages/python3.nix
    ../../modules/packages/solidtime-desktop.nix
    ../../modules/packages/sourcegit.nix
    ../../modules/packages/vscode.nix
  ];

  networking.hostName = hostname;
  system.stateVersion = "25.11";
  users.users.nixos.linger = true;
  _module.args = {
    user = "nixos";
    homeModules = [
      ../../modules/home/cli-tools.nix
      ../../modules/home/git.nix
      ../../modules/home/npm.nix
      ../../modules/home/dotnet-tools-path.nix
      ../../modules/home/kde-theming.nix
      ./plasma.nix
    ];
    userDescription = "Nico Welles";
    userEmail = "welles@mentz.net";
    passwordConfig = {hashedPassword = "$6$3BGVF3pHFaYKQrs1$Ac6nlm55Mi.80KdRhvlr9wk4V80X/CE2cof8YRba5Mz6Kqgzl8uzq.Bd78qKh8Tsq4FGQuRsmhedOVlH.Zuvx1";};
    extraGroups = ["wheel"];
    persistRoot = null;
    sshSigningKey = null;
    onePasswordVaults = null;
  };
}
