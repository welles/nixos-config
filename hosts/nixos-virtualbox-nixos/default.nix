{hostname, ...}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/yazi.nix
    ../../modules/home/konsole.nix
    ../../modules/nixos-tools.nix
    ../../modules/docker.nix
    ../../modules/nix-ld-dev-libraries.nix
    ../../modules/dotnet-sdk-env.nix
    ../../modules/packages/headlamp.nix
    ../../modules/packages/hoppscotch.nix
    ../../modules/packages/lazygit.nix
    ../../modules/packages/lazydocker.nix
    ../../modules/packages/k9s.nix
    ../../modules/packages/k0sctl.nix
    ../../modules/packages/kdePackages-dolphin.nix
    ../../modules/packages/kind.nix
    ../../modules/packages/kubectl.nix
    ../../modules/packages/kubeseal.nix
    ../../modules/packages/kubelogin-oidc.nix
    ../../modules/packages/jetbrains-rider.nix
    ../../modules/packages/dotnet-sdk_10.nix
    ../../modules/packages/mercurial.nix
    ../../modules/packages/nodejs.nix
    ../../modules/packages/vscode.nix
    ../../modules/packages/firefox-devedition.nix
    ../../modules/packages/google-chrome.nix
    ../../modules/packages/microsoft-edge.nix
    ../../modules/packages/sourcegit.nix
    ../../modules/packages/bruno.nix
    ../../modules/packages/openssl.nix
    ../../modules/packages/kubernetes-helm.nix
    ../../modules/packages/jq.nix
    ../../modules/packages/perl.nix
    ../../modules/packages/python3.nix
    ../../modules/packages/solidtime-desktop.nix
    ../../modules/user-account.nix
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./boot.nix
    ./desktop.nix
    ./impermanence.nix
    ../../modules/tmux.nix
    ../../modules/locale-de.nix
    ../../modules/keyboard.nix
    ../../modules/nix-settings.nix
    ../../modules/home-manager-user.nix
    ./virtualbox.nix
    ./networking.nix
  ];

  networking.hostName = hostname;
  system.stateVersion = "25.11";
  _module.args = {
    user = "nixos";
    homeModules = [
      ../../modules/home/cli-tools.nix
      ../../modules/home/git.nix
      ../../modules/home/npm.nix
      ../../modules/home/dotnet-tools-path.nix
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
