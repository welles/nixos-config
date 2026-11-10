# Current Workarounds

Temporary fixes for problems outside this repository (nixpkgs, upstream
software, NixOS defaults). Each entry says how to tell whether the workaround
is still needed, so it can be removed once the cause is gone.

When removing a workaround, delete its entry here in the same commit.

## codex: missing system libraries

- **Where:** `modules/packages/codex.nix`
- **Added:** 2026-11-09
- **Problem:** codex 0.167.0 in nixpkgs fails to build in `zstd-sys`, because
  the package does not provide `zstd` (and `aws-lc`, `oniguruma`, `sqlite`) as
  build inputs.
- **Workaround:** `overrideAttrs` adds the four libraries to `buildInputs`.
- **Remove when:** NixOS/nixpkgs@16b463698a ("codex: fix build with sys libs")
  has reached `nixos-unstable`. Check with
  `nix eval --json github:nixos/nixpkgs/nixos-unstable#codex.buildInputs --apply 'map (p: p.pname or p.name)'`
  (the list must contain `zstd`), or by building `pkgs.codex` without the
  override.

## t3code: bundled codex does not build

- **Where:** `modules/t3code-server.nix`
- **Added:** 2026-11-09
- **Problem:** The `t3code` wrapper in nixpkgs puts its own `pkgs.codex` on
  the PATH, and that codex fails to build in `zstd-sys` (see the codex entry
  above), so `t3code` does not build either.
- **Workaround:** `pkgs.t3code.override {enableCodex = false;}`; T3 Code uses
  the agents from the system PATH instead.
- **Remove when:** `pkgs.codex` builds without the override from
  `modules/packages/codex.nix` (same check as the codex entry above).

## video2x: GCC 16 defaults to C++20

- **Where:** `modules/packages/video2x.nix`
- **Added:** 2026-10-02
- **Problem:** Under C++20, `path::u8string()` returns `std::u8string`, which
  fmt/spdlog refuse to format, so video2x fails to build with GCC 16.
- **Workaround:** Builds with `-fno-char8_t` to restore the pre-C++20 `char`
  behaviour.
- **Remove when:** The unpatched `pkgs.video2x` builds again, e.g. it is in
  the binary cache:
  `nix path-info --store https://cache.nixos.org $(nix eval --raw .#nixosConfigurations.nico-desktop-nixos.pkgs.video2x.outPath)`

## Wine needs `/var/lib/dbus/machine-id`

- **Where:** `modules/wine-machine-id.nix` (imported by `modules/packages/bottles.nix`
  and `modules/packages/musicfab.nix`)
- **Added:** 2026-10-21
- **Problem:** Wine reads the SMBIOS system UUID only from
  `/var/lib/dbus/machine-id`, which NixOS does not create. Every prefix then
  reports the placeholder UUID `deaddead-…`, and StreamFab's key server hands
  out keys that do not decrypt (error 605).
- **Workaround:** A tmpfiles rule links `/var/lib/dbus/machine-id` to
  `/etc/machine-id`.
- **Remove when:** NixOS creates `/var/lib/dbus/machine-id` itself, or Wine
  falls back to `/etc/machine-id`.

## DVDFab programs: Wine's PulseAudio driver busy-loops in MIDI

- **Where:** `modules/packages/dvdfab/mk-launcher.nix` (MusicFab, StreamFab)
- **Added:** 2026-11-10
- **Problem:** `winepulse.drv` does not implement the MIDI unix calls, so
  `midi_notify_wait` returns at once and mmdevapi's `notify_thread` spins
  forever. MusicFab then hangs on its splash screen ("Accessing server
  information") at 100 % CPU. Still the case in Wine 11.21.
- **Workaround:** The launcher sets `HKCU\Software\Wine\Drivers` `Audio` to
  `alsa` (winealsa implements MIDI; ALSA's default device goes to
  PulseAudio).
- **Remove when:** winepulse implements the MIDI calls or mmdevapi stops the
  notify thread on `STATUS_NOT_IMPLEMENTED` (`dlls/mmdevapi/main.c`,
  `notify_thread`). Check by deleting the `Audio` value in the prefix and
  starting `musicfab`.

## DVDFab programs: gamma changes kill them under xrdp

- **Where:** `modules/packages/dvdfab/mk-launcher.nix` (MusicFab, StreamFab)
- **Added:** 2026-11-10
- **Problem:** The X server of an xrdp session answers
  `XF86VidModeSetGamma` with `BadValue`; Xlib treats that as fatal and ends
  the whole process. StreamFab (with its GPU code in the main process) died
  right after start.
- **Workaround:** The launcher sets `HKCU\Software\Wine\X11 Driver`
  `UseXVidMode` to `N`.
- **Remove when:** the programs only run on a local X server (no xrdp), or
  xorgxrdp accepts gamma requests. Check by deleting the value in the prefix
  and starting `streamfab --in-process-gpu` in an RDP session.

## MusicFab: blank page after dialogs (cross-process rendering)

- **Where:** `modules/packages/musicfab.nix` (StreamFab doesn't need it)
- **Added:** 2026-11-10
- **Problem:** Chromium's GPU process draws into MusicFab's window from
  another process, which Wine does not keep in the window's surface. After
  the converter dialog closes or the window is covered, the Spotify page
  stays blank or stale until something in it changes.
- **Workaround:** The launcher starts MusicFab with `--in-process-gpu`.
- **Remove when:** Wine retains cross-process child window rendering. Check by
  starting MusicFab without the argument, opening a playlist, cancelling the
  converter dialog and seeing whether the page is still drawn.
