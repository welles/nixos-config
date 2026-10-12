# Development Desktop VM ("nico-devbox-nixos")
#
# Full NixOS desktop (Cinnamon) running as a libvirt/KVM guest on
# nico-schokoladenelch-nixos (see hosts/nico-schokoladenelch-nixos/nico-devbox-vm.nix).
# The server only provides the VM and its disk (zvol bucket/vms/nico-devbox-nixos);
# everything inside - Nix store, home directory, Docker - lives on that disk
# and is deployed on its own like any other host in this flake.
#
#   - Desktop over RDP (xrdp + Cinnamon), from the LAN through the server's
#     port 3390 or via Guacamole at 192.168.201.10:3389
#   - SSH from the LAN through the server's port 2223; from the VM the
#     server is reachable like any other machine in the LAN
#   - Impermanence: the ZFS root dataset is rolled back on every boot, only
#     /persist survives
#
# Installation (once):
#   1. Deploy nico-schokoladenelch-nixos: creates the zvol, the libvirt
#      network and the domain (which starts with an empty disk).
#   2. On the server, put a NixOS minimal ISO where the domain expects it
#      and restart the VM, so it boots the installer:
#        sudo mkdir -p /var/lib/libvirt/images
#        sudo curl -L -o /var/lib/libvirt/images/nixos-installer.iso \
#          https://channels.nixos.org/nixos-unstable/latest-nixos-minimal-x86_64-linux.iso
#        sudo virsh destroy nico-devbox-nixos; sudo virsh start nico-devbox-nixos
#   3. In the installer's console (virt-manager via
#      qemu+ssh://schokoladenelch@<server>/system), set a password for the
#      user `nixos` with `passwd`.
#   4. From a machine in the LAN with this repository and the sops age key:
#        mkdir -p /tmp/devbox-extra/persist/var/lib/sops-nix
#        sudo cp /persist/var/lib/sops-nix/key.txt /tmp/devbox-extra/persist/var/lib/sops-nix/
#        nix run github:nix-community/nixos-anywhere -- \
#          --flake .#nico-devbox-nixos --extra-files /tmp/devbox-extra \
#          --ssh-port 2223 nixos@<server>
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
  ...
}: {
  imports = [
    # Hardware & boot
    ./boot.nix
    ../../modules/zfs-rollback.nix
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ./impermanence.nix
    ../../modules/sops-zfs-persist.nix
    ./sops.nix

    # Networking
    ./networking.nix
    ../../modules/networkmanager.nix
    ../../modules/openssh-host-keys.nix

    # Desktop environment
    ./desktop.nix
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

    # Packages
    ../../modules/packages/1password.nix
    ../../modules/packages/claude-code.nix
    ../../modules/packages/gh.nix
    ../../modules/packages/google-chrome.nix
    ../../modules/packages/nodejs.nix
    ../../modules/packages/vscode.nix

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
    ];
    persistRoot = "/persist";
    sopsAgeKeyFile = "/persist/var/lib/sops-nix/key.txt";
    pool = "devbox";
    userDescription = "Nico Welles";
    userEmail = "nico@welles.email";
    sshSigningKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKIfp1vknvLG8NUOIq6BAh8rIAq96kU+bbem0HtopQL";
    onePasswordVaults = ["Persönlich" "Schokoladenelch"];
    passwordConfig = {hashedPasswordFile = config.sops.secrets."user-password".path;};
    extraGroups = ["wheel"];
  };
}
