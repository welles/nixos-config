{hostname, ...}: {
  imports = [
    # Bundles
    ../../bundles/base.nix
    ../../bundles/containers.nix
    ../../bundles/desktop-kde.nix
    ../../bundles/dev-tools.nix
    ../../bundles/dotnet-dev.nix
    ../../bundles/git-gui.nix
    ../../bundles/impermanence-zfs.nix
    ../../bundles/java-dev.nix
    ../../bundles/nix-dev.nix
    ../../bundles/onepassword.nix
    ../../bundles/sops-admin.nix

    # Hardware & boot
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ./tablet.nix
    ../../modules/zfs-grub-boot.nix

    # Networking
    ../../modules/avahi.nix
    ./fritzbox-wireguard.nix
    ./mobile-network.nix
    ./networking.nix
    ../../modules/networkmanager.nix
    ../../modules/wifi-welles-intern
    ../../modules/wifi-welles-starlink

    # Desktop environment
    ../../modules/flatpak.nix
    ../../modules/printing.nix
    ../../modules/removable-media.nix

    # Home Manager
    ../../modules/laptop-plasma.nix
    ../../modules/packages/yazi.nix

    # System
    ../../modules/nix-ld.nix

    # Services & hardware
    ../../modules/rclone

    # Packages
    ../../modules/packages/_7zz.nix
    ../../modules/packages/antigravity.nix
    ../../modules/packages/azure-cli.nix
    ../../modules/packages/calibre.nix
    ../../modules/packages/claude-code.nix
    ../../modules/packages/codex.nix
    ../../modules/packages/discord.nix
    ../../modules/packages/drawing.nix
    ../../modules/packages/easyeffects.nix
    ../../modules/packages/evtest.nix
    ../../modules/packages/exfatprogs.nix
    ../../modules/packages/fastfetch.nix
    ../../modules/packages/fsearch.nix
    ../../modules/packages/gimp.nix
    ../../modules/packages/gh.nix
    ../../modules/packages/gparted.nix
    ../../modules/packages/kdePackages-partitionmanager.nix
    ../../modules/packages/libreoffice.nix
    ../../modules/packages/losslesscut-bin.nix
    ../../modules/packages/mission-center.nix
    ../../modules/packages/mumble.nix
    ../../modules/packages/naps2.nix
    ../../modules/packages/obs-studio.nix
    ../../modules/packages/pciutils.nix
    ../../modules/packages/picard.nix
    ../../modules/packages/pinta.nix
    ../../modules/packages/powershell.nix
    ../../modules/packages/remmina.nix
    ../../modules/packages/solaar.nix
    ../../modules/packages/systemctl-tui.nix
    ../../modules/packages/teamspeak6-client.nix
    ../../modules/packages/unrar.nix
    ../../modules/packages/usbutils.nix
    ../../modules/packages/video-compare.nix
    ../../modules/packages/video2x.nix
    ../../modules/packages/vlc.nix
    ../../modules/packages/wrtag.nix
    ../../modules/packages/xfsprogs.nix
  ];

  networking.hostName = hostname;
  networking.hostId = "0aea17fa";
  system.stateVersion = "25.11";
  _module.args = {
    user = "nico";
    persistRoot = "/persist";
    sopsAgeKeyFile = "/persist/var/lib/sops-nix/key.txt";
    pool = "main";
    userDescription = "Nico Welles";
    userEmail = "nico@welles.email";
    sshSigningKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKIfp1vknvLG8NUOIq6BAh8rIAq96kU+bbem0HtopQL";
    onePasswordVaults = ["Persönlich" "Schokoladenelch"];
    passwordConfig = {initialPassword = "passwort";};
    extraGroups = ["wheel"];
    nextcloudUrl = "https://nextcloud.welles.app";
  };
}
