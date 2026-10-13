# Development Desktop VM ("nico-devbox-nixos")
#
# Full NixOS desktop (KDE Plasma) running as a libvirt/KVM guest on
# nico-schokoladenelch-nixos (see hosts/nico-schokoladenelch-nixos/nico-devbox-vm.nix).
# The server only provides the VM and its disk (zvol bucket/vms/nico-devbox-nixos);
# everything inside - Nix store, home directory, Docker - lives on that disk
# and is deployed on its own like any other host in this flake.
#
#   - Bridged into the LAN: gets its address via DHCP from the Fritzbox
#     (MAC 52:54:00:c9:00:0a, fix the address there) and is reachable as
#     nico-devbox-nixos like any other machine, the server too
#   - Desktop over RDP (xrdp + Plasma on X11, port 3389), directly or via
#     Guacamole; SSH on port 22
#   - A Claude Code Remote Control session per repository in ~/workspace
#     (modules/claude-workspace.nix, repositories in claudeWorkspaceRepos)
#   - Playwright MCP for Claude Code, a VS Code tunnel named
#     nico-devbox-nixos
#   - Impermanence: the ZFS root dataset is rolled back on every boot, only
#     /persist survives
#
# Installation (once):
#   1. Deploy nico-schokoladenelch-nixos (with `nixos-rebuild boot` and a
#      reboot, as it moves the server's address to the bridge br0): creates
#      the zvol and the domain (which starts with an empty disk).
#   2. On the server, put a NixOS minimal ISO where the domain expects it
#      and restart the VM, so it boots the installer:
#        sudo mkdir -p /var/lib/libvirt/images
#        sudo curl -L -o /var/lib/libvirt/images/nixos-installer.iso \
#          https://channels.nixos.org/nixos-unstable/latest-nixos-minimal-x86_64-linux.iso
#        sudo virsh destroy nico-devbox-nixos; sudo virsh start nico-devbox-nixos
#   3. In the installer's console (virt-manager via
#      qemu+ssh://schokoladenelch@<server>/system), set a password for the
#      user `nixos` with `passwd`.
#   4. Look up the installer's address in the Fritzbox (MAC
#      52:54:00:c9:00:0a). From a machine in the LAN with this repository
#      and the sops age key:
#        mkdir -p /tmp/devbox-extra/persist/var/lib/sops-nix
#        sudo cp /persist/var/lib/sops-nix/key.txt /tmp/devbox-extra/persist/var/lib/sops-nix/
#        nix run github:nix-community/nixos-anywhere -- \
#          --flake .#nico-devbox-nixos --extra-files /tmp/devbox-extra \
#          nixos@<VM address>
#      disko partitions the disk (including the @blank snapshot of
#      devbox/root), the system is built on that machine, not on the server.
#   5. Delete the ISO again (the disk boots first anyway); log in over RDP,
#      sign in to 1Password and enable its SSH agent.
#
# Updates afterwards like on every other host (`nixos-switch` inside the VM,
# or `nixos-rebuild switch --target-host` from elsewhere).
{
  config,
  hostname,
  pkgs,
  ...
}: {
  imports = [
    # Hardware & boot
    ./boot.nix
    ../../modules/zfs-systemd-boot.nix
    ../../modules/zfs-rollback.nix
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ./impermanence.nix
    ../../modules/sops-zfs-persist.nix
    ./sops.nix

    # Networking: DHCP from the Fritzbox. Unlike on the desktops,
    # NetworkManager-wait-online stays enabled, as the Claude services need a
    # working network, including DNS, once network-online.target is reached.
    ../../modules/networkmanager.nix
    ../../modules/openssh.nix

    # Desktop environment: Plasma on X11 over RDP (xrdp only starts X11
    # sessions; Plasma 6.8 is going to drop them). SDDM only serves the local
    # SPICE console (virt-manager). No GPU in the VM: remote-plasma.nix turns
    # off compositing and animations.
    ../../modules/kde-plasma.nix
    ../../modules/xrdp.nix
    ../../modules/user-dirs.nix

    # Home Manager
    ../../modules/npm.nix
    ../../modules/shell.nix

    # User & identity
    ../../modules/home-manager-user.nix
    ../../modules/user-account.nix

    # System
    ../../modules/keyboard.nix
    ../../modules/locale-de.nix
    ../../modules/nix-ld.nix
    ../../modules/nix-settings.nix
    ../../modules/nixos-tools.nix
    ../../modules/sudo.nix
    ../../modules/packages/tmux.nix

    # Services
    ../../modules/docker.nix
    ../../modules/claude-workspace.nix
    ../../modules/playwright-mcp.nix
    ../../modules/vscode-tunnel.nix

    # Packages
    ../../modules/packages/1password.nix
    ../../modules/packages/claude-code.nix
    ../../modules/packages/fira-code-nerd-font.nix
    ../../modules/packages/fira-sans.nix
    ../../modules/packages/firefox.nix
    ../../modules/packages/gh.nix
    ../../modules/packages/google-chrome.nix
    ../../modules/packages/konsole.nix
    ../../modules/packages/vscode.nix

    # Development: languages and runtimes
    ../../modules/packages/bun.nix
    ../../modules/packages/dotnet-sdk_10.nix
    ../../modules/packages/jdk25.nix
    ../../modules/packages/nodejs.nix
    ../../modules/packages/pnpm.nix
    ../../modules/packages/powershell.nix
    ../../modules/packages/python3.nix

    # Development: tools
    ../../modules/nix-ld-dev-libraries.nix
    ../../modules/packages/azure-cli.nix
    ../../modules/packages/jetbrains-idea.nix
    ../../modules/packages/jetbrains-rider.nix
    ../../modules/packages/jq.nix
    ../../modules/packages/just.nix
    ../../modules/packages/lazydocker.nix
    ../../modules/packages/lazygit.nix
    ../../modules/packages/ripgrep.nix
    ../../modules/packages/sqlcmd.nix
    ../../modules/packages/unzip.nix
    ../../modules/packages/wget.nix

    # Development: Nix
    ../../modules/packages/alejandra.nix
    ../../modules/packages/deadnix.nix
    ../../modules/packages/mcp-nixos.nix
    ../../modules/packages/sops.nix
    ../../modules/packages/ssh-to-age.nix
    ../../modules/packages/statix.nix

    # Scripts
    ../../modules/scripts/check-persist
    ../../modules/scripts/persist-audit
  ];

  networking.hostName = hostname;
  networking.hostId = "75163031";
  system.stateVersion = "26.05";
  _module.args = {
    user = "nico";
    homeModules = [
      ../../modules/cli-tools.nix
      ../../modules/packages/git.nix
      ../../modules/git-signing.nix
      ../../modules/1password-ssh-agent.nix
      ../../modules/1password-autostart.nix
      ../../modules/remote-plasma.nix
      ../../modules/fonts.nix
      ../../modules/kde-theming.nix
    ];
    persistRoot = "/persist";
    sopsAgeKeyFile = "/persist/var/lib/sops-nix/key.txt";
    pool = "devbox";
    userDescription = "Nico Welles";
    userEmail = "nico@welles.email";
    xrdpSession = "${pkgs.kdePackages.plasma-workspace}/bin/startplasma-x11";
    claudeWorkspaceRepos = [
      "welles/nixos-config"
      "stamm-phoenix/website-astro"
      "stamm-phoenix/playwright-api"
    ];
    sshSigningKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKIfp1vknvLG8NUOIq6BAh8rIAq96kU+bbem0HtopQL";
    onePasswordVaults = ["Persönlich" "Schokoladenelch"];
    passwordConfig = {hashedPasswordFile = config.sops.secrets."user-password".path;};
    # Same key as for the server (1Password SSH agent)
    sshAuthorizedKeys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDl1C29djVxWt/uHCdkGdzwHFUCxm3MeSdJeqvkcnhRJ"
    ];
    extraGroups = ["wheel"];
  };
}
