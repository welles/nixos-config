# Lenovo ThinkBook Configuration
#
# Primary gaming machine for Nico. ThinkBook with NVIDIA RTX + Intel
# hybrid GPU (PRIME offload). Includes Logitech steering wheel support,
# Sunshine remote game streaming, Steam, Eden emulator, and Xbox dongle.
{
  inputs,
  pkgs,
  stateVersion,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia-gpu.nix
    ./eden.nix
    ./xone-dongle.nix
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

  networking.hostName = "nico-thinkbook-nixos";
  system.stateVersion = stateVersion;

  hardware.bluetooth.enable = true;

  # Logitech steering wheel support
  hardware.new-lg4ff.enable = true;
  services.udev.packages = with pkgs; [oversteer];
  hardware.usb-modeswitch.enable = true;
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c26d", RUN+="${pkgs.usb-modeswitch}/bin/usb_modeswitch -v 046d -p c26d -M 0f00010142 -C 0x03 -m 01 -r 01"
  '';

  services.sunshine = {
    enable = true;
    autoStart = false;
    capSysAdmin = true;
    openFirewall = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    openttd-jgrpp
    oversteer
    prismlauncher
    streamcontroller
    (bottles.override {removeWarningPopup = true;})
  ];

  systemd.services.NetworkManager-wait-online.enable = false;

  sops = {
    defaultSopsFormat = "yaml";
    age.keyFile = "/var/lib/sops-nix/key.txt";
    validateSopsFiles = true;
  };

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties"."default.clock.min-quantum" = 1024;
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
