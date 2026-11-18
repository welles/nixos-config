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
- Desktop over RDP (xrdp + Cinnamon, port 3389), directly or in the
  browser at `https://devbox.welles.app` (Cloudflare browser-based RDP,
  `cloudflare/devbox-rdp.tf`; its xrdp login screen renders garbled, the
  desktop after it is fine); SSH on port 22. The desktop session already starts at boot,
  logged in with the plaintext `user-password` from sops (GNOME keyring
  unlocked); an RDP login takes it over (`modules/xrdp-boot-session.nix`).
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
runs as the system service `claude-remote-manager`
(`modules/claude-remote-manager.nix`, the app's own NixOS module) as `nico`,
without a sandbox: its Claude Code sessions are Claude Code of `nico`, like
a terminal session on this machine.

- **Reachable** at `https://claude.welles.app` through the server's
  Cloudflare Tunnel and behind Cloudflare Access (Google login, 30-day
  session), both in `cloudflare/` (`local.apps.claude-remote-manager`).
  Only the GitHub webhook `/api/github/webhook` passes without a login
  (`bypass_paths`; the app checks its signature). The service listens on
  port 8080 of the VM; the firewall admits that port only from the server
  (by its MAC address, `tunnelHostMacAddress`;
  `modules/claude-remote-manager-lan-tunnel.nix`). Open it through
  `claude.welles.app` also from the devbox itself. The API refuses requests
  from processes it started (sessions and their tools), so a session does
  not approve its own requests by accident; the owner's own programs here
  are not refused.
- **Previews** of dev servers are not enabled yet (`previewUrl = null`): a
  wildcard two labels below `welles.app` needs Cloudflare's paid Advanced
  Certificate, a separate domain is the alternative. Enabling them means an
  entry for the wildcard host name in `local.apps` of `cloudflare/apps.tf`
  (its own Access application), plus a `cloudflare_certificate_pack` for
  the first option or the new zone in `zone_ids` for the second, and
  `previewUrl` and `previewAccessAudience` in `claudeRemoteManager`.
- **Sessions** use `~/.claude` (the login, skills, plugins and MCP servers
  of Claude Desktop and the terminal), the whole file system, Docker, the
  media mounts under `/mnt/tank` and the home's credentials. `sudo` asks
  for `nico`'s password. Git in the session clones works like in
  `~/workspace`: GitHub over SSH with the sops key `github-ssh-key` (pushes
  to the clones' HTTPS `origin` are rewritten to SSH), unsigned commits.
  The sessions' system prompt ends with `claude-remote-manager.md` in this
  directory. The permission mode is chosen per session, `bypassPermissions`
  included; an Autofix run asks for every call but reading.
- **State**: everything in `/var/lib/claude-remote-manager` (persisted as one
  directory): database, mirrors and session clones; the Claude Code
  transcripts are in `~/.claude`. The root-only directory in which the app
  records to whom it gave the data directory,
  `/var/lib/claude-remote-manager-owner`, is persisted too.
- **Secrets** in this host's `secrets.yaml`, readable by root only:
  `claude-remote-manager/github-app-key` (private key of the GitHub App,
  App ID 5736769), `claude-remote-manager/github-webhook-secret`,
  `claude-remote-manager/ntfy-token` (a token of the ntfy user that publishes
  to the topic `claude-remote-manager` on `ntfy.welles.app`).
- **Cloudflare Access values** are in `claudeRemoteManager` in
  `default.nix`: the team domain, and the app's Application Audience tag
  from `./tofu.sh output access_audiences` in `cloudflare/`. No email
  allowlist: Access issues tokens only to the Google E-Mail group.

Sessions use the Claude login of `~/.claude`; there is no login of their
own.

**Updates**: after every green CI run on the app's `main`, the workflow
`.github/workflows/update-claude-remote-manager.yml` updates the flake input
`claude-remote-manager` and commits `flake.lock`; besides that, the nightly
input update moves it too. The next `nixos-switch` here brings the new
version and restarts the service (running sessions are interrupted; database
migrations run at startup).
