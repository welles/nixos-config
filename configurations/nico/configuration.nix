{
  config,
  pkgs,
  ...
}: {
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
        gfxmodeEfi = "1920x1080";
        gfxpayloadEfi = "keep";
        theme = pkgs.sleek-grub-theme.override {
          withBanner = "Hallo, Nico.";
          withStyle = "dark";
        };
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "splash"
      "quiet"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    initrd.verbose = false;
    consoleLogLevel = 0;
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = ["rings"];
        })
      ];
    };
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

  hardware = {
    # xpadneo.enable = true;
    xone.enable = true;
  };
  hardware.firmware = [
    (pkgs.stdenvNoCC.mkDerivation {
      name = "xone-dongle-firmware";
      nativeBuildInputs = [pkgs.cabextract];
      dontBuild = true;
      dontConfigure = true;
      dontUnpack = true;

      installPhase = let
        firmwareList = [
          {
            url = "https://catalog.s.download.windowsupdate.com/d/msdownload/update/driver/drvs/2017/03/2ea9591b-f751-442c-80ce-8f4692cdc67b_6b555a3a288153cf04aec6e03cba360afe2fce34.cab";
            hash = "sha256-2Jpy6NwQt8TxbVyIf+f1TDTCIAWsHzYHBNXZRiJY7zI=";
            fileName = "FW_ACC_00U.bin";
            targetName = "xone_dongle_02e6.bin";
          }
          {
            url = "https://catalog.s.download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/07/1cd6a87c-623f-4407-a52d-c31be49e925c_e19f60808bdcbfbd3c3df6be3e71ffc52e43261e.cab";
            hash = "sha256-ZXNqhP9ANmRbj47GAr7ZGrY1MBnJyzIz3sq5/uwPbwQ=";
            fileName = "FW_ACC_00U.bin";
            targetName = "xone_dongle_02fe.bin";
          }
          {
            url = "https://catalog.s.download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/06/1dbd7cb4-53bc-4857-a5b0-5955c8acaf71_9081931e7d664429a93ffda0db41b7545b7ac257.cab";
            hash = "sha256-kN2R+2dGDTh0B/2BCcDn0PGPS2Wb4PYtuFihhJ6tLuA=";
            fileName = "FW_ACC_CL.bin";
            targetName = "xone_dongle_02f9.bin";
          }
          {
            url = "https://catalog.s.download.windowsupdate.com/d/msdownload/update/driver/drvs/2017/08/aeff215c-3bc4-4d36-a3ea-e14bfa8fa9d2_e58550c4f74a27e51e5cb6868b10ff633fa77164.cab";
            hash = "sha256-Wo+62VIeWMxpeoc0cgykl2cwmAItYdkaiL5DMALM2PI=";
            fileName = "FW_ACC_BR.bin";
            targetName = "xone_dongle_091e.bin";
          }
        ];

        processFirmware = item: ''
          mkdir -p workdir
          pushd workdir

          echo "Verarbeite ${item.targetName}..."
          cabextract "${pkgs.fetchurl {
            url = item.url;
            hash = item.hash;
          }}"

          mkdir -p $out/lib/firmware
          cp "${item.fileName}" "$out/lib/firmware/${item.targetName}"

          popd
          rm -rf workdir
        '';
      in ''
        ${builtins.concatStringsSep "\n" (map processFirmware firmwareList)}
      '';
    })
  ];

  networking.networkmanager.enable = true;

  time = {
    hardwareClockInLocalTime = true;
    timeZone = "Europe/Berlin";
  };

  i18n.defaultLocale = "de_DE.UTF-8";

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
      autoNumlock = true;
    };
    desktopManager.plasma6.enable = true;
    power-profiles-daemon.enable = true;
    xserver.xkb = {
      layout = "de";
      variant = "";
    };
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
  };

  console.keyMap = "de";

  security.rtkit.enable = true;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.nico = {
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
      flake = "/home/nico/nixos";
    };
    zsh.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alejandra
    bitwarden-desktop
    calibre
    deadnix
    discord
    dotnet-sdk_10
    easyeffects
    evtest
    exfatprogs
    fastfetch
    fsearch
    google-chrome
    gparted
    jdk21
    jdk25
    jetbrains.rider
    kdePackages.kzones
    kdePackages.partitionmanager
    lazygit
    libreoffice
    mission-center
    nerd-fonts.fira-code
    nodejs
    obs-studio
    openttd-jgrpp
    oversteer
    pciutils
    picard
    pinta
    pnpm
    prismlauncher
    remmina
    smartgit
    spotify
    statix
    streamcontroller
    teams-for-linux
    usbutils
    video-compare
    vlc
    vscode
    wrtag
    (
      bottles.override {
        removeWarningPopup = true;
      }
    )
    (
      pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
        [General]
        background=${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/contents/images/5120x2880.png
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

  nix.settings.auto-optimise-store = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.activationScripts.set-profile-icon.text = ''
    mkdir -p /var/lib/AccountsService/icons

    cp ${./floating.png} /var/lib/AccountsService/icons/nico
  '';

  system.activationScripts.update-flatpaks.text = ''
    echo "--- Auto-Updating System Flatpaks ---"

    ${pkgs.flatpak}/bin/flatpak update --system --noninteractive --assumeyes || true
  '';
}
