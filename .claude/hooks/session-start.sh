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

# The web container uses gVisor (runsc), whose syscall emulation breaks Nix's
# user-namespace build sandbox, so we disable it. Install is non-daemon
# (--init none) because there is no systemd. We skip --determinate: its
# default substituter (install.determinate.systems) is not in the egress
# allowlist, and its lazy-trees profile build trips on the same gVisor
# wait() issue.
if ! command -v nix >/dev/null 2>&1 && [ ! -x /nix/var/nix/profiles/default/bin/nix ]; then
  log "downloading nix-installer binary from GitHub release"
  arch="$(uname -m)"
  installer="$(mktemp)"
  curl -fsSL \
    "https://github.com/DeterminateSystems/nix-installer/releases/latest/download/nix-installer-${arch}-linux" \
    -o "$installer"
  chmod +x "$installer"

  log "installing Nix"
  "$installer" install linux \
    --no-confirm \
    --init none \
    --extra-conf 'sandbox = false'

  rm -f "$installer"
fi

export PATH="/nix/var/nix/profiles/default/bin:${PATH}"

if ! command -v nix >/dev/null 2>&1; then
  log "nix not on PATH after install; aborting"
  exit 1
fi

# Pin nixpkgs to whatever flake.lock pins so tool installs go straight to the
# binary cache. flakehub.com / api.github.com / install.determinate.systems
# are either blocked by the egress allowlist or rate-limited on the shared
# egress IP, so an unpinned `nixpkgs#...` reference fails to resolve.
rev="$(jq -r '.nodes.nixpkgs.locked.rev' "$CLAUDE_PROJECT_DIR/flake.lock")"
if [ -z "$rev" ] || [ "$rev" = "null" ]; then
  log "could not read nixpkgs rev from flake.lock; aborting"
  exit 1
fi

# Install only what isn't already in the profile, so resume/clear
# SessionStart invocations don't error out with "already installed".
installed="$(nix profile list --json 2>/dev/null || echo '{"elements":{}}')"
missing=()
for tool in alejandra deadnix statix nixos-rebuild; do
  if ! printf '%s' "$installed" | jq -e --arg t "$tool" '.elements[$t]' >/dev/null; then
    missing+=("github:NixOS/nixpkgs/${rev}#${tool}")
  fi
done

if [ ${#missing[@]} -gt 0 ]; then
  log "installing ${#missing[@]} tool(s) from nixpkgs@${rev:0:12}"
  nix profile add "${missing[@]}"
else
  log "alejandra, deadnix, statix, nixos-rebuild already installed"
fi

if [ -n "${CLAUDE_ENV_FILE:-}" ]; then
  {
    echo 'export PATH="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH"'
  } >> "$CLAUDE_ENV_FILE"
fi

log "done"
