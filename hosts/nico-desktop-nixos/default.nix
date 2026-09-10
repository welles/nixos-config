{
  hostname,
  config,
  ...
}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/yazi.nix
    ../../modules/home/konsole.nix
    ./hardware-configuration.nix
    ../../modules/profile-icon
    ./disk-configuration.nix
    ./impermanence.nix
    ../../modules/packages/claude-code.nix
    ../../modules/packages/codex.nix
    ../../modules/packages/antigravity.nix
    ../../modules/kde-plasma.nix
    ../../modules/packages/fira-code-nerd-font.nix
    ../../modules/packages/fira-sans.nix
    ../../modules/pipewire.nix
    ./networking.nix
    ../../modules/packages/alejandra.nix
    ../../modules/packages/deadnix.nix
    ../../modules/packages/delta.nix
    ../../modules/packages/discord.nix
    ../../modules/packages/easyeffects.nix
    ../../modules/packages/firefox-devedition.nix
    ../../modules/packages/fsearch.nix
    ../../modules/packages/google-chrome.nix
    ../../modules/packages/gparted.nix
    ../../modules/packages/lazygit.nix
    ../../modules/packages/libreoffice.nix
    ../../modules/packages/mcp-nixos.nix
    ../../modules/packages/pciutils.nix
    ../../modules/packages/remmina.nix
    ../../modules/packages/sops.nix
    ../../modules/packages/sourcegit.nix
    ../../modules/packages/ssh-to-age.nix
    ../../modules/packages/statix.nix
    ../../modules/packages/usbutils.nix
    ../../modules/packages/vscode.nix
    ../../modules/packages/nodejs.nix
    ./services.nix
    ./nvidia-gpu.nix
    ../../modules/tmux.nix
    ../../modules/packages/occt
    ../../modules/scripts/check-persist
    ../../modules/scripts/toggle-screens
    ../../modules/scripts/search-tmdb
    ../../modules/locale-de.nix
    ../../modules/keyboard.nix
    ../../modules/nix-settings.nix
    ./boot.nix
    ./sops.nix
    ../../modules/user-account.nix
    ../../modules/home-manager-user.nix
    ../../modules/nixos-tools.nix
    ../../modules/bluetooth.nix
    ../../modules/packages/1password.nix
    ../../modules/packages/bottles.nix
    ../../modules/virt-manager-client.nix
    ../../modules/nix-ld.nix
    ../../modules/logitech-wheel.nix
    ../../modules/packages/streamdeck.nix
  ];

  networking.hostName = hostname;
  networking.hostId = "7e6301e4";
  system.stateVersion = "26.05";
  _module.args = {
    user = "nico";
    homeModules = [
      ./plasma.nix
      ../../modules/home/fonts.nix
      ../../modules/home/cli-tools.nix
      ../../modules/home/git.nix
      ../../modules/home/git-signing.nix
      ../../modules/home/npm.nix
      ../../modules/home/kde-theming.nix
      ../../modules/home/1password-ssh-agent.nix
      ../../modules/home/1password-autostart.nix
      ../../modules/home/sops-env.nix
      ../../modules/home/xdg-user-dirs.nix
      ../../modules/home/lazygit.nix
    ];
    persistRoot = "/persist";
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
