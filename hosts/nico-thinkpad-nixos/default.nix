# Lenovo ThinkPad Configuration
#
# Primary laptop for Nico. ThinkPad convertible with IIO sensors for
# automatic screen rotation, a virtual on-screen keyboard (Maliit),
# KDE Plasma 6 desktop, and FritzBox WireGuard + LTE mobile network.
{
  inputs,
  pkgs,
  stateVersion,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./fritzbox-wireguard.nix
    ./mobile-network.nix
    ../../modules/base.nix
    ../../modules/networkmanager.nix
    ../../modules/docker.nix
    ../../modules/kde.nix
    ../../modules/pipewire.nix
    ../../modules/avahi.nix
    ../../modules/grub.nix
    ../../modules/virtualisation.nix
    ../../modules/desktop-services.nix
    ../../modules/locale-de.nix
    ../../modules/nico-packages.nix
    ../../modules/rclone.nix
  ];

  networking.hostName = "nico-thinkpad-nixos";
  system.stateVersion = stateVersion;

  hardware.bluetooth.enable = true;
  hardware.sensor.iio.enable = true;

  environment.systemPackages = with pkgs; [
    libinput
    iio-sensor-proxy
    maliit-keyboard
  ];

  networking.firewall.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties"."default.clock.min-quantum" = 1024;
  };

  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/var/lib/sops-nix/key.txt";
    validateSopsFiles = true;
  };

  users.users.nico = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "Nico";
    extraGroups = ["wheel" "docker" "networkmanager" "libvirtd"];
    shell = pkgs.zsh;
  };

  programs.firefox.enable = true;
  environment.shellAliases.ls-gpus = "lspci | grep -E 'VGA|3D'";

  system.activationScripts.set-profile-icon.text = ''
    mkdir -p /var/lib/AccountsService/icons
    cp ${./floating.png} /var/lib/AccountsService/icons/nico
  '';

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs stateVersion;};
    sharedModules = [
      inputs.plasma-manager.homeModules.plasma-manager
      {
        home.username = "nico";
        home.homeDirectory = "/home/nico";
        home.stateVersion = stateVersion;
        programs.home-manager.enable = true;
      }
    ];
    users.nico = import ../../modules/home/nico.nix;
  };
}
