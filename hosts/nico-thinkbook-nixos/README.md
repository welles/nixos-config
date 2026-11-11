# nico-thinkbook-nixos

Lenovo ThinkBook laptop with KDE Plasma, composed like `nico-thinkpad-nixos`
minus the ThinkPad-only hardware (screen rotation, LTE modem, on-screen
keyboard) and the home VPN, plus NVIDIA PRIME offload
(`modules/nvidia-prime-offload.nix`): the Intel GPU drives the display,
`nvidia-offload <command>` renders on the NVIDIA GPU. NVIDIA Dynamic Boost
(`modules/nvidia-dynamic-boost.nix`) lets the GPU go above its 50 W base
limit, but only on AC power in the performance mode; check with
`nvidia-smi -q -d POWER` ("Current Power Limit") while a game runs.

- Impermanence: the ZFS root dataset `main/root` is rolled back to
  `main/root@blank` on every boot, only `/persist` (and `/nix`) survive.
- No hibernation: NixOS blocks it on ZFS (`nohibernate`), and
  `modules/no-hibernate.nix` hides it in KDE. The 32G swap is plain swap.
  On low battery the laptop sleeps, at 5 % it shuts down.
- No SSH server after installation.

## Installation (nixos-anywhere, erases the disk)

1. On the ThinkBook: disable Secure Boot in the UEFI (GRUB, no lanzaboote),
   boot the NixOS minimal ISO (unstable) from USB, connect to the network
   (LAN or `nmtui`), set a password for the user `nixos` with `passwd` and
   note the address from `ip a`.
2. Verify the hardware facts in this directory against the machine (over
   `ssh nixos@<address>`) and fix them if they differ:

   ```sh
   ls -l /dev/disk/by-id/ | grep nvme   # device in disk-configuration.nix
   lspci | grep -Ei 'vga|3d'            # bus IDs in default.nix, 00:02.0 → PCI:0:2:0
   free -g                              # RAM, for the swap size
   ```

3. From a machine with this repository and the sops age key:

   ```sh
   install -d -m 700 /tmp/thinkbook-extra
   install -d /tmp/thinkbook-extra/persist/var/lib/sops-nix
   sudo install -m 600 -o "$USER" /persist/var/lib/sops-nix/key.txt \
     /tmp/thinkbook-extra/persist/var/lib/sops-nix/key.txt
   nix run github:nix-community/nixos-anywhere -- \
     --flake .#nico-thinkbook-nixos --extra-files /tmp/thinkbook-extra \
     --generate-hardware-config nixos-generate-config \
     ./hosts/nico-thinkbook-nixos/hardware-configuration.nix \
     nixos@<address>
   rm -rf /tmp/thinkbook-extra
   ```

   disko partitions the disk and creates the `main/root@blank` snapshot; the
   system is built on the machine running nixos-anywhere. Commit the
   regenerated `hardware-configuration.nix`.

4. After the first boot: log in with the password from `secrets.yaml`,
   check the rollback (`zfs list -t snapshot`, a file touched in `/` is gone
   after a reboot), the GPU (`nvidia-smi`, and
   `nix shell nixpkgs#mesa-demos -c nvidia-offload glxinfo -B | grep renderer`
   shows the NVIDIA GPU, without `nvidia-offload` the Intel one); then sign in
   to 1Password and enable its SSH agent.

Updates afterwards like on every other host (`nixos-switch` on the laptop).
