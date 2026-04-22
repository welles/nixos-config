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

# Pin nixpkgs to whatever flake.lock pins so tool installs resolve straight to
# the binary cache entry for that exact revision.
rev="$(jq -r '.nodes.nixpkgs.locked.rev' "$CLAUDE_PROJECT_DIR/flake.lock")"
if [ -z "$rev" ] || [ "$rev" = "null" ]; then
	log "could not read nixpkgs rev from flake.lock; aborting"
	exit 1
fi

# Determine which tools are not yet in the nix profile.
installed_json="$(nix profile list --json 2>/dev/null || echo '{"elements":{}}')"
missing_tools=()
missing_refs=()
for tool in alejandra deadnix statix; do
	if ! printf '%s' "$installed_json" | jq -e --arg t "$tool" '.elements[$t]' >/dev/null 2>&1; then
		missing_tools+=("$tool")
		missing_refs+=("github:NixOS/nixpkgs/${rev}#${tool}")
	fi
done

if [ ${#missing_tools[@]} -eq 0 ]; then
	log "alejandra, deadnix, statix already installed"
else
	log "installing ${#missing_tools[@]} tool(s) from nixpkgs@${rev:0:12}"

	# Scope substituters to cache.nixos.org only.  The Determinate Nix installer
	# appends install.determinate.systems as an extra substituter; that host is
	# not in the egress allowlist and causes every nix invocation to fail before
	# it can even try the real binary cache.
	if nix profile add \
		--option substituters 'https://cache.nixos.org' \
		--option trusted-substituters 'https://cache.nixos.org' \
		"${missing_refs[@]}"; then
		log "tools installed from nixpkgs"
	else
		# cache.nixos.org can be transiently unreachable in the gVisor environment
		# (DNS resolver saturation surfaces as HTTP 503).  Fall back to prebuilt
		# static binaries from GitHub releases, which are always in the allowlist.
		log "binary cache unavailable; falling back to GitHub release binaries"

		TOOLS_BIN="${HOME}/.local/bin"
		mkdir -p "$TOOLS_BIN"
		arch="$(uname -m)"

		install_github_release() {
			local tool="$1" repo="$2" pattern="$3"
			if [ -x "${TOOLS_BIN}/${tool}" ]; then return 0; fi
			log "downloading ${tool} from github.com/${repo}"
			local asset_tsv name url tmp_dir
			asset_tsv="$(curl -fsSL "https://api.github.com/repos/${repo}/releases/latest" |
				jq -r ".assets[] | select(.name | test(\"${pattern}\")) | [.name, .browser_download_url] | @tsv" |
				head -1)"
			[ -n "$asset_tsv" ] || {
				log "WARNING: no asset found for ${tool}; skipping"
				return 0
			}
			name="$(printf '%s' "$asset_tsv" | cut -f1)"
			url="$(printf '%s' "$asset_tsv" | cut -f2)"
			tmp_dir="$(mktemp -d)"
			trap 'rm -rf "$tmp_dir"' RETURN
			curl -fsSL "$url" -o "${tmp_dir}/${name}"
			if [[ "$name" == *.tar.gz || "$name" == *.tgz ]]; then
				tar -xzf "${tmp_dir}/${name}" -C "$tmp_dir"
				find "$tmp_dir" -name "$tool" -type f | head -1 |
					xargs -I{} install -m755 {} "${TOOLS_BIN}/${tool}"
			elif [[ "$name" == *.zip ]]; then
				unzip -q "${tmp_dir}/${name}" -d "$tmp_dir"
				find "$tmp_dir" -name "$tool" -type f | head -1 |
					xargs -I{} install -m755 {} "${TOOLS_BIN}/${tool}"
			else
				install -m755 "${tmp_dir}/${name}" "${TOOLS_BIN}/${tool}"
			fi
		}

		for tool in "${missing_tools[@]}"; do
			case "$tool" in
			alejandra) install_github_release alejandra "kamadorueda/alejandra" "${arch}-unknown-linux" ;;
			deadnix) install_github_release deadnix "astro/deadnix" "deadnix-${arch}-unknown-linux" ;;
			statix) install_github_release statix "oppiliappan/statix" "statix-${arch}-unknown-linux" ;;
			esac
		done
	fi
fi

if [ -n "${CLAUDE_ENV_FILE:-}" ]; then
	{
		# Include ~/.local/bin for the GitHub-release fallback path.
		echo 'export PATH="$HOME/.local/bin:$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH"'
	} >>"$CLAUDE_ENV_FILE"
fi

log "done"
