{
  hostname,
  config,
  ...
}: {
  imports = [
    # Hardware & boot
    ../../modules/zfs-grub-boot.nix
    ../../modules/zfs-rollback.nix
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ./impermanence.nix
    ../../modules/logitech-wheel.nix
    ./nvidia-gpu.nix
    ./sops.nix

    # Networking
    ./networking.nix

    # Desktop environment
    ../../modules/bluetooth.nix
    ../../modules/kde-plasma.nix
    ../../modules/user-dirs.nix
    ../../modules/pipewire.nix
    ../../modules/profile-icon

    # Home Manager
    ../../modules/packages/konsole.nix
    ../../modules/npm.nix
    ../../modules/shell.nix
    ../../modules/packages/yazi.nix

    # User & identity
    ../../modules/home-manager-user.nix
    ../../modules/user-account.nix

    # System
    ../../modules/keyboard.nix
    ../../modules/locale-de.nix
    ../../modules/nix-ld.nix
    ../../modules/nix-settings.nix
    ../../modules/nixos-tools.nix
    ../../modules/packages/tmux.nix

    # Services & hardware
    ./services.nix
    ../../modules/packages/virt-manager-client.nix

    # Packages
    ../../modules/packages/1password.nix
    ../../modules/packages/alejandra.nix
    ../../modules/packages/antigravity.nix
    ../../modules/packages/bottles.nix
    ../../modules/packages/claude-code.nix
    ../../modules/packages/codex.nix
    ../../modules/packages/deadnix.nix
    ../../modules/packages/discord.nix
    ../../modules/packages/easyeffects.nix
    ../../modules/packages/fira-code-nerd-font.nix
    ../../modules/packages/fira-sans.nix
    ../../modules/packages/firefox-devedition.nix
    ../../modules/packages/fsearch.nix
    ../../modules/packages/google-chrome.nix
    ../../modules/packages/gparted.nix
    ../../modules/packages/lazygit.nix
    ../../modules/packages/libreoffice.nix
    ../../modules/packages/mcp-nixos.nix
    ../../modules/packages/nodejs.nix
    ../../modules/packages/occt.nix
    ../../modules/packages/pciutils.nix
    ../../modules/packages/remmina.nix
    ../../modules/packages/sops.nix
    ../../modules/packages/sourcegit.nix
    ../../modules/packages/ssh-to-age.nix
    ../../modules/packages/statix.nix
    ../../modules/packages/streamdeck.nix
    ../../modules/packages/usbutils.nix
    ../../modules/packages/vscode.nix

    # Scripts
    ../../modules/scripts/check-persist
    ../../modules/scripts/persist-audit
    ../../modules/scripts/search-tmdb
    ../../modules/scripts/toggle-screens
  ];

  networking.hostName = hostname;
  networking.hostId = "7e6301e4";
  system.stateVersion = "26.05";
  _module.args = {
    user = "nico";
    homeModules = [
      ./plasma.nix
      ../../modules/fonts.nix
      ../../modules/cli-tools.nix
      ../../modules/packages/git.nix
      ../../modules/git-signing.nix
      ../../modules/kde-theming.nix
      ../../modules/1password-ssh-agent.nix
      ../../modules/1password-autostart.nix
      ../../modules/sops-env.nix
    ];
    persistRoot = "/persist";
    pool = "main";
    userDescription = "Nico Welles";
    userEmail = "nico@welles.email";
    sshSigningKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKIfp1vknvLG8NUOIq6BAh8rIAq96kU+bbem0HtopQL";
    onePasswordVaults = ["Persönlich" "Schokoladenelch"];
    passwordConfig = {hashedPasswordFile = config.sops.secrets."user-password".path;};
    extraGroups = ["wheel"];
    remoteHost = "nico-schokoladenelch-nixos";
    remoteUser = "schokoladenelch";
  };
}
