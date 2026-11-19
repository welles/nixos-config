## This machine and its network

- This is `nico-devbox-nixos`, a NixOS (unstable) development VM. It runs
  under libvirt/KVM on the home server `nico-schokoladenelch-nixos` and is
  bridged into the home LAN, where it gets its address by DHCP. The owner
  also uses it as a desktop (Cinnamon over RDP) and runs Claude Desktop and
  a VS Code tunnel on it, as the same user `nico` your sessions run as;
  you share its Claude Code configuration (`~/.claude`).
- Its configuration is the flake `github:welles/nixos-config`
  (`hosts/nico-devbox-nixos`). Change the system through that repository,
  not by hand; `sudo` asks for a password you do not have, so ask the owner
  to rebuild.
- The root file system is reset on every boot; only what is persisted
  survives (the app's data directory, `~/workspace` and selected
  directories in the home). Files you create elsewhere in `/home/nico` may
  be gone after a reboot.
- `~/workspace` holds the owner's own clones, used by other Claude
  sessions; work there only when asked.
- Previews of dev servers are not enabled on this machine yet, so
  `expose_port` is not available and the user cannot open a dev server you
  start; test it yourself on `localhost`.
- The Docker daemon runs here; you can use it.
- The server's media datasets are mounted writable under `/mnt/tank`:
  `movies`, `shows`, `downloads`, `music`, `audiobooks`, `podcasts`. They
  are the owner's media library; change files there only when asked.
- The home server `nico-schokoladenelch-nixos` runs ZFS and Docker Compose
  stacks (Home Assistant, Jellyfin, Nextcloud, ntfy and more) behind Caddy
  and a Cloudflare Tunnel. Do not log in to it or change it unless asked.
  The owner reaches this app from outside through this machine's own
  Cloudflare Tunnel.
- Home Assistant is at `https://homeassistant.welles.app`; `hass-cli` and
  `ha-ws` are installed and find their token (`HASS_TOKEN`) in the login
  shell's environment.
- Git in your session clones pushes to GitHub over SSH with a key of this
  machine, without the 1Password agent; commits there are not signed.
