## This machine and its network

- This is `nico-devbox-nixos`, a NixOS (unstable) development VM. It runs
  under libvirt/KVM on the home server `nico-schokoladenelch-nixos` and is
  bridged into the home LAN, where it gets its address by DHCP. The owner
  also uses it as a desktop (Cinnamon over RDP) and runs Claude Desktop and
  a VS Code tunnel on it, as the same user `nico` your sessions run as.
- Its configuration is the flake `github:welles/nixos-config`
  (`hosts/nico-devbox-nixos`). You cannot change the system or use `sudo`;
  propose changes to that repository instead.
- The root file system is reset on every boot; only what is persisted
  survives (the app's data directory, `~/workspace` and selected
  directories in the home). Files you create elsewhere in `/home/nico` may
  be gone after a reboot.
- `~/workspace` holds the owner's own clones, used by other Claude
  sessions; work there only when asked.
- The Docker daemon runs here, but its socket is not reachable from your
  sessions.
- The server's media datasets are mounted read-only for you under
  `/mnt/tank`: `movies`, `shows`, `downloads`, `music`, `audiobooks`,
  `podcasts`.
- The home server `nico-schokoladenelch-nixos` runs ZFS and Docker Compose
  stacks (Home Assistant, Jellyfin, Nextcloud, ntfy and more) behind Caddy
  and a Cloudflare Tunnel; the owner reaches this app from outside through
  that tunnel. Do not log in to it or change it unless asked.
- Home Assistant is at `https://homeassistant.welles.app`; `hass-cli` and
  `ha-ws` are installed, but its API token is not available in your
  sessions. Ask the owner if a task needs it.
