{
  config,
  pkgs,
  inputs,
  user,
  ...
}: {
  imports = [
    ../../packages/eden
    ../../hardware/xone-dongle
  ];

  boot = {
    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        default = "saved";
      };
    };
    #kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = ["ntfs" "exfat"];
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  hardware.bluetooth.enable = true;

  hardware.new-lg4ff.enable = true;
  services.udev.packages = with pkgs; [oversteer];
  hardware.usb-modeswitch.enable = true;
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c26d", RUN+="${pkgs.usb-modeswitch}/bin/usb_modeswitch -v 046d -p c26d -M 0f00010142 -C 0x03 -m 01 -r 01"
  '';

  services.flatpak.enable = true;

  services.udisks2.enable = true;

  services.gvfs.enable = true;

  security.polkit = {
    enable = true;
    extraConfig = ''
      polkit.addRule(function(action, subject) {
        if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
             action.id == "org.freedesktop.udisks2.filesystem-mount") &&
            subject.isInGroup("wheel")) {
          return polkit.Result.YES;
        }
      });
    '';
  };

  networking.networkmanager.enable = true;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services = {
    xserver.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
    power-profiles-daemon.enable = true;
    printing = {
      enable = true;
      drivers = [
        pkgs.gutenprint
        pkgs.gutenprintBin
      ];
    };
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    sunshine = {
      enable = true;
      autoStart = false;
      capSysAdmin = true;
      openFirewall = true;
    };
  };

  security.rtkit.enable = true;

  services.xserver.xkb.layout = "de";

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
    config.common.default = "kde";
  };

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    initialPassword = "passwort";
    description = "Nico";
    extraGroups = ["networkmanager" "wheel" "docker" "libvirtd"];
    shell = pkgs.zsh;
    # packages = with pkgs; [
    # ];
  };

  virtualisation.vmVariant = {
    virtualisation.useBootLoader = true;
    virtualisation.useEFIBoot = true;
    boot.loader.timeout = 30;
    virtualisation = {
      memorySize = 8192;
      cores = 4;
      qemu.options = ["-vga virtio" "-display gtk,gl=on"];
    };
  };

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  programs = {
    firefox.enable = true;
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d";
      };
      flake = "/home/${user}/nixos";
    };
    zsh.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  environment.systemPackages = with pkgs; [
    inputs.llm-agents.packages.${pkgs.system}.gemini-cli
    alejandra
    bitwarden-desktop
    calibre
    deadnix
    discord
    dotnet-sdk_10
    drawing
    easyeffects
    evtest
    exfatprogs
    fastfetch
    fsearch
    gimp
    google-chrome
    gparted
    jdk25
    jetbrains.rider
    kdePackages.kzones
    kdePackages.partitionmanager
    lazydocker
    lazygit
    libreoffice
    losslesscut-bin
    mcp-nixos
    mission-center
    mumble
    naps2
    nerd-fonts.fira-code
    nodejs
    obs-studio
    openttd-jgrpp
    oversteer
    pciutils
    picard
    pinta
    pnpm
    powershell
    prismlauncher
    remmina
    smartgit
    sops
    spotify
    ssh-to-age
    statix
    streamcontroller
    teams-for-linux
    teamspeak6-client
    unrar
    usbutils
    video-compare
    video2x
    vlc
    vscode
    wrtag
    xfsprogs
    # (
    #   let
    #     pname = "citron";
    #     version = "2026.02.1";
    #     src = pkgs.fetchurl {
    #       url = "https://github.com/Zephyron-Dev/Citron-CI/releases/download/${version}/Citron-${version}-Pathfinder-Linux-x86_64.AppImage";
    #       hash = "sha256-y53v+3ihVUeL7XH1Au1F1bNvxkHMiof1hTqfWkD+bY0=";
    #     };
    #     appimageContents =
    #       pkgs.runCommand "${pname}-extracted" {
    #         nativeBuildInputs = [pkgs.dwarfs];
    #       } ''
    #         mkdir -p $out
    #         dwarfsextract -i ${src} -o $out --image-offset 1483248
    #       '';
    #   in
    #     pkgs.buildFHSEnv {
    #       name = pname;
    #       runScript = "${appimageContents}/AppRun";
    #       targetPkgs = pkgs:
    #         with pkgs; [
    #           libthai
    #           libglvnd
    #           libx11
    #           libxcursor
    #           libxext
    #           libxfixes
    #           libxi
    #           libxrender
    #           libGL
    #           vulkan-loader
    #           alsa-lib
    #           libpulseaudio
    #         ];
    #       extraInstallCommands = ''
    #         mkdir -p $out/share/applications
    #         mkdir -p $out/share/icons/hicolor/scalable/apps
    #         cp ${appimageContents}/org.citron_emu.citron.desktop $out/share/applications/
    #         cp ${appimageContents}/org.citron_emu.citron.svg $out/share/icons/hicolor/scalable/apps/
    #         substituteInPlace $out/share/applications/org.citron_emu.citron.desktop \
    #           --replace 'Exec=citron' "Exec=$out/bin/citron"
    #       '';
    #     }
    # )
    (
      bottles.override {
        removeWarningPopup = true;
      }
    )
    (
      writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
        [General]
        background=${kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/contents/images/5120x2880.png
      ''
    )
  ];

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.min-quantum" = 1024;
      # "default.clock.quantum" = 1024;
    };
  };

  environment.shellAliases = {
    ls-gpus = "lspci | grep -E 'VGA|3D'";
  };

  system.activationScripts.set-profile-icon.text = ''
    mkdir -p /var/lib/AccountsService/icons

    cp ${./floating.png} /var/lib/AccountsService/icons/${user}
  '';

  home-manager.sharedModules = [inputs.plasma-manager.homeModules.plasma-manager];

  # system.activationScripts.update-flatpaks.text = ''
  #   echo "--- Auto-Updating System Flatpaks ---"

  #   ${pkgs.flatpak}/bin/flatpak update --system --noninteractive --assumeyes || true
  # '';
}
