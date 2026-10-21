{
  hostname,
  inputs,
  ...
}: {
  imports = [
    # Bundles
    ../../bundles/base.nix
    ../../bundles/containers.nix
    ../../bundles/dev-tools.nix
    ../../bundles/dotnet-dev.nix
    ../../bundles/git-gui.nix
    ../../bundles/sops-admin.nix

    # Hardware & boot
    ./hardware-configuration.nix

    # Desktop environment
    ./desktop.nix

    # Secrets
    ./sops.nix

    # Shell & user environment
    ../../modules/packages/mercurial.nix
    ./mercurial.nix
    ../../modules/packages/yazi.nix

    # System
    ./ld-library-path.nix
    ../../modules/nix-ld-dev-libraries.nix

    # Services & hardware
    ../../modules/podman.nix
    inputs.nixos-wsl.nixosModules.default
    ./wsl.nix

    # Packages
    ../../modules/packages/bruno.nix
    ../../modules/packages/headlamp.nix
    ../../modules/packages/hoppscotch.nix
    ../../modules/packages/jq.nix
    ../../modules/packages/k0sctl.nix
    ../../modules/packages/k9s.nix
    ../../modules/packages/keeper.nix
    ../../modules/packages/keeper-commander
    ../../modules/packages/kind.nix
    ../../modules/packages/kubectl.nix
    ../../modules/packages/kubelogin-oidc.nix
    ../../modules/packages/kubernetes-helm.nix
    ../../modules/packages/kubeseal.nix
    ../../modules/packages/microsoft-edge.nix
    ../../modules/packages/nuke.nix
    ../../modules/packages/openssl.nix
    ../../modules/packages/perl.nix
    ../../modules/packages/podman-desktop.nix
    ../../modules/packages/python3.nix
    #../../modules/packages/solidtime-desktop.nix
    ../../modules/packages/tortoisehg.nix
  ];

  networking.hostName = hostname;
  system.stateVersion = "25.11";
  users.users.nixos.linger = true;
  _module.args = {
    user = "nixos";
    userDescription = "Nico Welles";
    userEmail = "welles@mentz.net";
    passwordConfig = {hashedPassword = "$6$3BGVF3pHFaYKQrs1$Ac6nlm55Mi.80KdRhvlr9wk4V80X/CE2cof8YRba5Mz6Kqgzl8uzq.Bd78qKh8Tsq4FGQuRsmhedOVlH.Zuvx1";};
    extraGroups = ["wheel"];
    persistRoot = null;
    sopsAgeKeyFile = "/var/lib/sops-nix/key.txt";
  };
}
