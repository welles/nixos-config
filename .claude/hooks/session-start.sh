#!/usr/bin/env bash
# SessionStart hook: provision Nix + lint/build tools for Claude Code on the web.
#
# Local NixOS sessions already have these tools in the system closure, so this
# hook exits early unless $CLAUDE_CODE_REMOTE is "true" (set only by the web
# container).
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

log() { printf '[session-start] %s\n' "$*" >&2; }

if ! command -v nix >/dev/null 2>&1; then
  log "installing Determinate Nix"
  curl -fsSL https://install.determinate.systems/nix \
    | sh -s -- install linux \
        --no-confirm \
        --init none \
        --determinate
fi

for profile in /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh \
               /etc/profile.d/nix.sh \
               "$HOME/.nix-profile/etc/profile.d/nix.sh"; do
  if [ -f "$profile" ]; then
    # shellcheck disable=SC1090
    . "$profile"
    break
  fi
done

if ! command -v nix >/dev/null 2>&1; then
  log "nix not on PATH after install; aborting"
  exit 1
fi

if ! nix --version 2>/dev/null | grep -qi determinate; then
  mkdir -p "$HOME/.config/nix"
  if ! grep -qs '^experimental-features' "$HOME/.config/nix/nix.conf" 2>/dev/null; then
    echo 'experimental-features = nix-command flakes' >> "$HOME/.config/nix/nix.conf"
  fi
fi

log "installing alejandra, deadnix, statix, nixos-rebuild"
nix profile install \
  nixpkgs#alejandra \
  nixpkgs#deadnix \
  nixpkgs#statix \
  nixpkgs#nixos-rebuild

if [ -n "${CLAUDE_ENV_FILE:-}" ]; then
  {
    echo 'export PATH="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH"'
    echo 'export NIX_PATH="nixpkgs=flake:nixpkgs"'
  } >> "$CLAUDE_ENV_FILE"
fi

log "done"
