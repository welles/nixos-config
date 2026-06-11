# Host Rework: configurations/machines → hosts/

## Goal

Migrate all NixOS hosts from the split `configurations/<user>/` + `machines/<hostname>/` layout to a unified `hosts/<hostname>/` directory. Each host is fully self-contained; shared, reusable code lives in `modules/`. No `global.nix` for new-style hosts — every setting is explicit via module imports.

## Why

The old split made sense as a "user profile" abstraction when multiple machines shared a user config, but as machines diverge it becomes friction. The new layout makes it obvious where every configuration option comes from without having to trace through `configurations/` and `machines/` simultaneously.

## Principles

- **Self-contained hosts**: `hosts/<hostname>/default.nix` is the single entry point. It imports what it needs from `../../modules/` and defines everything else inline.
- **No global stateVersion**: each host hardcodes `system.stateVersion` to the NixOS version it was *installed* with. This value should never change once set.
- **No `user` arg to the flake builder**: the host knows its own primary user. `mkHostSystem` only takes `hostname`.
- **Explicit module imports**: nothing is silently inherited from `global.nix`. If a host needs timezone, tmux, or nix GC settings, it imports or declares them.
- **Stable/unstable per-host**: use `mkStableHostSystem` or `mkUnstableHostSystem` in `flake.nix` depending on the host's nixpkgs track.
- **Gradual migration**: old-style hosts continue using `mkSystem`/`mkStableSystem`/`mkUnstableSystem` until they are individually migrated.

## Flake builder API

```nix
# Old style — still used for unmigrated hosts
mkSystem        pkgs hm hostname user   # generic
mkStableSystem         hostname user   # nixpkgs 26.05
mkUnstableSystem       hostname user   # nixpkgs-unstable

# New style — for hosts/ layout
mkHostSystem    pkgs hm hostname        # generic
mkStableHostSystem     hostname        # nixpkgs 26.05
mkUnstableHostSystem   hostname        # nixpkgs-unstable
```

## Migration Status

| Host | Old layout | New layout | Status |
|------|-----------|------------|--------|
| `nico-desktop-nixos` | — (new machine) | `hosts/nico-desktop-nixos/` | In progress |
| `nico-thinkpad-nixos` | `configurations/nico/` + `machines/nico-thinkpad-nixos/` | — | Not started |
| `nico-thinkbook-nixos` | `configurations/nico/` + `machines/nico-thinkbook-nixos/` | — | Not started |
| `nico-schokoladenelch-nixos` | `configurations/schokoladenelch/` + `machines/nico-schokoladenelch-nixos/` | — | Not started |
| `eltern-asus-nixos` | `configurations/eltern/` + `machines/eltern-asus-nixos/` | — | Not started |
| `nixos-wsl-nixos` | `configurations/nixos/` + `machines/nixos-wsl-nixos/` | — | Not started |
| `nixos-virtualbox-nixos` | `configurations/nixos/` + `machines/nixos-virtualbox-nixos/` | — | Not started |

## Session Log

### 2026-06-11

- Added `mkHostSystem`, `mkStableHostSystem`, `mkUnstableHostSystem` to `flake.nix`
- Added `nico-desktop-nixos = mkUnstableHostSystem "nico-desktop-nixos"` to `nixosConfigurations`
- Created `hosts/nico-desktop-nixos/default.nix` — imports `machine-configuration.nix` and `modules/tmux.nix`, defines all base settings inline (timezone, locale, nix GC, zsh, shell aliases, nixos-diff script), sets up home-manager pointing to `./home.nix`
- `hosts/nico-desktop-nixos/machine-configuration.nix` already existed (nixos-generate-config output for AMD x86_64 desktop)
- `hosts/nico-desktop-nixos/home.nix` is a stub — to be filled out with user home-manager config
- Build verified: `nico-desktop-nixos` evaluates successfully; existing hosts unaffected
