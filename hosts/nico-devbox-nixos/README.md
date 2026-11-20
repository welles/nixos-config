# nico-devbox-nixos

Full NixOS desktop (Cinnamon) running as a libvirt/KVM guest on
`nico-schokoladenelch-nixos` (its `libvirtVms.nico-devbox-nixos`, see
`modules/libvirt-vm.nix`). The server only provides the VM and its disk
(zvol `bucket/vms/nico-devbox-nixos`); everything inside (Nix store, home
directory, Docker) lives on that disk and is deployed on its own like any
other host in this flake.

- Bridged into the LAN: gets its address via DHCP from the UniFi router
  (MAC `52:54:00:c9:00:0a`, fix the address there) and is reachable as
  `nico-devbox-nixos` like any other machine, the server too.
- Desktop over RDP in the LAN (xrdp + Cinnamon, port 3389); SSH on port
  22. The desktop session already starts at boot, logged in with the
  plaintext `user-password` from sops (GNOME keyring unlocked); an RDP
  login takes it over (`modules/xrdp-boot-session.nix`).
- The same desktop session in the browser through KasmVNC at
  `https://devbox.welles.app` (`modules/kasmvnc-xrdp-mirror.nix`: KasmVNC
  mirrors the xrdp session's display :10 and fits it to the browser window
  while no RDP client is connected); only the Google login of Cloudflare
  Access. KasmVNC listens on localhost only and is published by the
  devbox's own Cloudflare Tunnel (`cloudflare/devbox.tf`,
  `modules/cloudflared.nix`, token in `secrets.yaml`). If it breaks, RDP
  keeps working.
- Claude Desktop starts with that session, so the VM is ready for Remote
  Control sessions after every boot (`modules/claude-desktop-autostart.nix`).
  Repositories for them are cloned by hand into `~/workspace`, where Git
  uses the SSH key from sops instead of 1Password
  (`modules/workspace-git.nix`).
- Playwright MCP for Claude Code, a VS Code tunnel named
  `nico-devbox-nixos`.
- Claude Remote Manager at `https://claude.welles.app`: web frontend for
  Claude Code sessions, which run here as `nico` (see below).
- Impermanence: the ZFS root dataset is rolled back on every boot, only
  `/persist` survives.
- The server's media datasets are mounted under `/mnt/tank` over virtiofs
  (`virtiofsMounts`, `modules/virtiofs-mounts.nix`).
- Serial console: `virsh console nico-devbox-nixos` on the server when
  neither SSH nor RDP work.

## Installation (once)

1. Deploy `nico-schokoladenelch-nixos` (with `nixos-rebuild boot` and a
   reboot if the server's address is not on the bridge `br0` yet): creates
   the zvol and the domain (which starts with an empty disk).
2. On the server, put a NixOS minimal ISO where the domain expects it and
   restart the VM, so it boots the installer:

   ```sh
   sudo mkdir -p /var/lib/libvirt/images
   sudo curl -L -o /var/lib/libvirt/images/nixos-installer.iso \
     https://channels.nixos.org/nixos-unstable/latest-nixos-minimal-x86_64-linux.iso
   sudo virsh destroy nico-devbox-nixos; sudo virsh start nico-devbox-nixos
   ```

3. In the installer's console (virt-manager via
   `qemu+ssh://schokoladenelch@<server>/system`), set a password for the
   user `nixos` with `passwd`.
4. Look up the installer's address in the UniFi router (MAC
   `52:54:00:c9:00:0a`). From a machine in the LAN with this repository and
   the sops age key:

   ```sh
   mkdir -p /tmp/devbox-extra/persist/var/lib/sops-nix
   sudo cp /persist/var/lib/sops-nix/key.txt /tmp/devbox-extra/persist/var/lib/sops-nix/
   nix run github:nix-community/nixos-anywhere -- \
     --flake .#nico-devbox-nixos --extra-files /tmp/devbox-extra \
     nixos@<VM address>
   ```

   disko partitions the disk (including the `@blank` snapshot of
   `devbox/root`); the system is built on that machine, not on the server.
5. Delete the ISO again (the disk boots first anyway); log in over RDP,
   sign in to 1Password and enable its SSH agent.

Updates afterwards like on every other host (`nixos-switch` inside the VM,
or `nixos-rebuild switch --target-host` from elsewhere).

## Claude Remote Manager

[Claude Remote Manager](https://github.com/welles/claude-remote-manager)
moved to the home server (the Docker Compose stack `claude_remote_manager`,
`modules/stacks/`), isolated from this machine. The service is stopped here
(`services.claude-remote-manager.enable = false` in `default.nix`); the
module `modules/claude-remote-manager.nix` stays imported only so that its
data in `/var/lib/claude-remote-manager` stays persisted, until it is
removed together with the NixOS module of the app.

