# Builds the new configuration, shows what `nixos-rebuild switch` would change
# and recommends `switch` or `boot`.
#
# Usage: nixos-diff [flake-ref]   (default: $DEFAULT_FLAKE, e.g. `nixos-diff .#host`)

FLAKE="${1:-$DEFAULT_FLAKE}"

WORKDIR=$(mktemp -d)
trap 'rm -rf "$WORKDIR"' EXIT
RESULT="$WORKDIR/result"

CURRENT=/run/current-system
BOOTED=/run/booted-system

# Resolve a local flake path (e.g. `.#host`) before changing into the work
# directory; refs like `github:...` stay as they are.
flake_path="${FLAKE%%#*}"
if [ -n "$flake_path" ] && [ -e "$flake_path" ]; then
	FLAKE="$(realpath "$flake_path")${FLAKE#"$flake_path"}"
fi

echo "Building $FLAKE ..."
(cd "$WORKDIR" && nixos-rebuild build --flake "$FLAKE" --refresh)
NEW=$(readlink -f "$RESULT")

# Same store path of a link in two system generations?
same() { [ "$(readlink -f "$1/$3")" = "$(readlink -f "$2/$3")" ]; }

if [ "$NEW" = "$(readlink -f "$CURRENT")" ]; then
	echo ""
	echo "No changes: the new configuration is identical to the running one."
	# An earlier switch may have activated a new kernel or driver without a reboot.
	if ! same "$BOOTED" "$RESULT" kernel || ! same "$BOOTED" "$RESULT" initrd ||
		! same "$BOOTED" "$RESULT" kernel-modules ||
		! cmp -s "$BOOTED/kernel-params" "$RESULT/kernel-params"; then
		echo "=> A reboot is still pending: kernel, initrd, kernel parameters or modules differ from the booted system."
	fi
	exit 0
fi

echo ""
echo "=== Package changes ==="
nvd diff "$CURRENT" "$RESULT"

echo ""
echo "=== Service changes (dry-activate) ==="
DRY_FAILED=0
if ! DRY=$(sudo "$RESULT/bin/switch-to-configuration" dry-activate 2>&1); then
	DRY_FAILED=1
fi
echo "$DRY"

# Reasons that make `switch` fail or leave the system half-updated.
boot_reasons=()
# Reasons that need a reboot to take effect but don't hurt a `switch`.
reboot_reasons=()
# Things to know when switching.
notes=()

# Kernel-level changes only take effect on the next boot.
same "$BOOTED" "$RESULT" kernel || reboot_reasons+=("new kernel ($(basename "$(dirname "$(readlink -f "$RESULT/kernel")")"))")
same "$BOOTED" "$RESULT" initrd || reboot_reasons+=("initrd changed")
if ! cmp -s "$BOOTED/kernel-params" "$RESULT/kernel-params"; then
	reboot_reasons+=("kernel parameters changed")
fi

# Kernel modules changed while the kernel stays the same: an out-of-tree
# driver (e.g. NVIDIA) was updated. Its userspace would switch now while the
# old module stays loaded, which breaks GPU applications until a reboot.
if same "$BOOTED" "$RESULT" kernel && ! same "$BOOTED" "$RESULT" kernel-modules; then
	if find -L "$RESULT/kernel-modules/lib/modules/" -name 'nvidia.ko*' -print -quit | grep -q .; then
		boot_reasons+=("NVIDIA driver changed: new userspace would not match the loaded kernel module")
	else
		boot_reasons+=("kernel modules changed for the running kernel (driver update)")
	fi
fi

# The switch inhibitors (e.g. the D-Bus implementation) make `switch` refuse.
if [ -e "$RESULT/switch-inhibitors" ] && [ -e "$CURRENT/switch-inhibitors" ]; then
	INHIBIT=$(jq -rn \
		--slurpfile old "$CURRENT/switch-inhibitors" \
		--slurpfile new "$RESULT/switch-inhibitors" \
		'$old[0] | to_entries[] | select(.key | in($new[0])) | select(.value != $new[0][.key])
     | "\(.key): \(.value) -> \($new[0][.key])"')
	if [ -n "$INHIBIT" ]; then
		while IFS= read -r line; do
			boot_reasons+=("switch inhibitor changed, switch would refuse: $line")
		done <<<"$INHIBIT"
	fi
fi

# D-Bus can't be restarted at runtime, a new version only runs after a reboot.
for unit in dbus.service dbus-broker.service; do
	if [ -e "$RESULT/etc/systemd/system/$unit" ] && ! same "$CURRENT" "$RESULT" "etc/systemd/system/$unit"; then
		reboot_reasons+=("$unit changed (only takes effect after a reboot)")
	fi
done

# systemd itself is re-executed on switch; a reboot makes everything run the new version.
if ! same "$CURRENT" "$RESULT" systemd; then
	version() { basename "$(readlink -f "$1/systemd")" | cut -d- -f2-; }
	reboot_reasons+=("systemd updated: $(version "$CURRENT") -> $(version "$RESULT") (re-executed on switch, usually fine)")
fi

if [ "$DRY_FAILED" -eq 1 ]; then
	notes+=("dry-activate failed, service changes unknown")
else
	# Units that keep running the old version (restartIfChanged = false).
	not_restarted=$(grep -E "NOT (restart|stop)" <<<"$DRY" | sed 's/.*units: //' || true)
	if [ -n "$not_restarted" ]; then
		notes+=("not restarted, old version keeps running until reboot/relogin: $not_restarted")
	fi

	# Critical units a switch would stop or restart.
	critical='display-manager|NetworkManager|sshd|systemd-logind|wpa_supplicant|iwd|tailscaled|docker'
	touched=$(grep -E "^would (stop|restart) the following units" <<<"$DRY" | sed 's/.*units: //' | tr ',' '\n' | sed 's/^ *//' | grep -E "^($critical)\.service$" | paste -sd, - || true)
	if [ -n "$touched" ]; then
		notes+=("switch would stop/restart: $touched (interrupts the desktop session, network, SSH or containers)")
	fi
fi

echo ""
echo "=== Recommendation ==="
for r in "${boot_reasons[@]}"; do echo "  [boot]   $r"; done
for r in "${reboot_reasons[@]}"; do echo "  [reboot] $r"; done
for r in "${notes[@]}"; do echo "  [note]   $r"; done
echo ""

if [ ${#boot_reasons[@]} -gt 0 ]; then
	echo "=> nh-boot (or nixos-boot) and reboot. A switch would fail or leave the system inconsistent."
elif [ ${#reboot_reasons[@]} -gt 0 ]; then
	echo "=> A reboot is needed anyway: nh-boot and reboot is the cleaner choice."
	echo "   nh-switch is possible too, but the changes above only take effect after a reboot."
elif [ "$DRY_FAILED" -eq 1 ]; then
	echo "=> Unknown: dry-activate failed, so the service changes were not checked. Fix the error above and run nixos-diff again."
elif [ ${#notes[@]} -gt 0 ]; then
	echo "=> nh-switch is fine; mind the notes above (save your work if the desktop is restarted)."
else
	echo "=> nh-switch is safe."
fi
