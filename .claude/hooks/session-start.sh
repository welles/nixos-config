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

# Install linting tools as static binaries directly from GitHub releases.
#
# Binary caches (cache.nixos.org, install.determinate.systems) and upstream
# source tarball hosts are outside the web container's egress allowlist, so
# `nix profile add` tries to build ~1400 derivations from scratch and fails
# when it cannot download any source tarballs.  GitHub release downloads are
# in the allowlist and work reliably.
TOOLS_BIN="${HOME}/.local/bin"
mkdir -p "$TOOLS_BIN"

arch="$(uname -m)"  # x86_64 or aarch64

# Download and install a prebuilt static binary from a GitHub release.
# $1 = tool name
# $2 = GitHub owner/repo
# $3 = ERE pattern matched against the release asset filename
install_github_release() {
  local tool="$1" repo="$2" pattern="$3"

  if [ -x "${TOOLS_BIN}/${tool}" ]; then
    log "${tool} already installed"
    return 0
  fi

  log "installing ${tool} from github.com/${repo}"

  local asset_tsv
  asset_tsv="$(curl -fsSL "https://api.github.com/repos/${repo}/releases/latest" \
    | jq -r ".assets[] | select(.name | test(\"${pattern}\")) | [.name, .browser_download_url] | @tsv" \
    | head -1)"

  if [ -z "$asset_tsv" ]; then
    log "WARNING: no release asset for ${tool} matching '${pattern}' — skipping"
    return 0
  fi

  local name url
  name="$(printf '%s' "$asset_tsv" | cut -f1)"
  url="$(printf '%s' "$asset_tsv" | cut -f2)"

  local tmp_dir
  tmp_dir="$(mktemp -d)"
  trap 'rm -rf "$tmp_dir"' RETURN

  curl -fsSL "$url" -o "${tmp_dir}/${name}"

  if [[ "$name" == *.tar.gz || "$name" == *.tgz ]]; then
    tar -xzf "${tmp_dir}/${name}" -C "$tmp_dir"
    find "$tmp_dir" -name "$tool" -type f | head -1 \
      | xargs -I{} install -m755 {} "${TOOLS_BIN}/${tool}"
  elif [[ "$name" == *.zip ]]; then
    unzip -q "${tmp_dir}/${name}" -d "$tmp_dir"
    find "$tmp_dir" -name "$tool" -type f | head -1 \
      | xargs -I{} install -m755 {} "${TOOLS_BIN}/${tool}"
  else
    install -m755 "${tmp_dir}/${name}" "${TOOLS_BIN}/${tool}"
  fi

  log "${tool} installed"
}

install_github_release alejandra "kamadorueda/alejandra" "${arch}-unknown-linux"
install_github_release deadnix   "astro/deadnix"         "deadnix-${arch}-unknown-linux"
install_github_release statix    "oppiliappan/statix"    "statix-${arch}-unknown-linux"

# nixos-rebuild dry-build is skipped when CLAUDE_CODE_REMOTE=true (see CLAUDE.md),
# so nixos-rebuild is not installed in the web environment.

if [ -n "${CLAUDE_ENV_FILE:-}" ]; then
  {
    echo "export PATH=\"${TOOLS_BIN}:/nix/var/nix/profiles/default/bin:\$PATH\""
  } >> "$CLAUDE_ENV_FILE"
fi

log "done"
