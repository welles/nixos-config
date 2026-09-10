{hostname, ...}: {
  imports = [
    # Hardware & boot
    ./boot.nix
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ./impermanence.nix

    # Networking
    ./networking.nix

    # Desktop environment
    ./desktop.nix

    # Home Manager
    ../../modules/packages/konsole.nix
    ../../modules/npm.nix
    ../../modules/shell.nix
    ../../modules/packages/yazi.nix

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
    ../../modules/packages/tmux.nix

    # Services & hardware
    ../../modules/docker.nix
    ./virtualbox.nix

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
    ../../modules/packages/openssl.nix
    ../../modules/packages/perl.nix
    ../../modules/packages/python3.nix
    ../../modules/packages/solidtime-desktop.nix
    ../../modules/packages/sourcegit.nix
    ../../modules/packages/vscode.nix
  ];

  networking.hostName = hostname;
  system.stateVersion = "25.11";
  _module.args = {
    user = "nixos";
    homeModules = [
      ../../modules/cli-tools.nix
      ../../modules/packages/git.nix
      ../../modules/dotnet-tools-path.nix
    ];
    persistRoot = "/persist";
    userDescription = "NW";
    userEmail = "welles@mentz.net";
    passwordConfig = {hashedPassword = "$6$3BGVF3pHFaYKQrs1$Ac6nlm55Mi.80KdRhvlr9wk4V80X/CE2cof8YRba5Mz6Kqgzl8uzq.Bd78qKh8Tsq4FGQuRsmhedOVlH.Zuvx1";};
    extraGroups = ["wheel"];
    sshSigningKey = null;
    onePasswordVaults = null;
  };
}
