# Draws a status overview of the server on the terminal and redraws it every
# few seconds: clock, system, network, UPS, ZFS pools, disk temperatures,
# Docker stacks and failed systemd units. Sections whose tool or data is
# missing on a host are left out.
#
# Deliberately reads no GPU counters: reading the i915 PMU (as btop does)
# deadlocked the kernel's scheduler together with busy Wine containers.

interval=2
# Iterations between slow probes (UPS, ZFS, Docker, units) and disk temperatures
slow_every=5
smart_every=150

esc=$'\e'
reset="${esc}[0m"
bold="${esc}[1m"
dim="${esc}[2m"
red="${esc}[31m"
green="${esc}[32m"
yellow="${esc}[33m"
cyan="${esc}[36m"

# Formats bytes per second as bits per second
human_rate() {
	awk -v b="$1" 'BEGIN {
    b *= 8; split("bit/s kbit/s Mbit/s Gbit/s", u, " "); i = 1
    while (b >= 1000 && i < 4) { b /= 1000; i++ }
    printf (i == 1 ? "%.0f %s" : "%.1f %s"), b, u[i]
  }'
}

# Prints the interface of the default route (empty when there is none)
default_iface() {
	ip route show default 2>/dev/null | awk '{ for (i = 1; i < NF; i++) if ($i == "dev") { print $(i + 1); exit } }'
}

# Sets net_rx/net_tx (bytes) and net_now (microseconds) for an interface;
# fails when the interface is gone
read_net_counters() {
	local stats="/sys/class/net/$1/statistics"
	net_rx=$(cat "$stats/rx_bytes" 2>/dev/null) || return 1
	net_tx=$(cat "$stats/tx_bytes" 2>/dev/null) || return 1
	net_now=${EPOCHREALTIME/[.,]/}
}

# Formats a byte count with binary units
human_bytes() {
	awk -v b="$1" 'BEGIN {
    split("B KiB MiB GiB TiB", u, " "); i = 1
    while (b >= 1024 && i < 5) { b /= 1024; i++ }
    printf "%.1f %s", b, u[i]
  }'
}

# Prints a bar of the given width filled to the given percentage
bar() {
	local pct=$1 width=$2 fill color=$green full empty
	fill=$((pct * width / 100))
	((pct >= 80)) && color=$yellow
	((pct >= 90)) && color=$red
	printf -v full '%*s' "$fill" ''
	printf -v empty '%*s' "$((width - fill))" ''
	printf '%s%s%s%s%s' "$color" "${full// /█}" "$dim" "${empty// /░}" "$reset"
}

# Colours a temperature in degrees Celsius
temp_color() {
	local t=$1 warn=$2 crit=$3
	if ((t >= crit)); then
		printf '%s%s°C%s' "$red" "$t" "$reset"
	elif ((t >= warn)); then
		printf '%s%s°C%s' "$yellow" "$t" "$reset"
	else
		printf '%s°C' "$t"
	fi
}

find_hwmon() {
	local h
	for h in /sys/class/hwmon/hwmon*; do
		if [[ "$(cat "$h/name" 2>/dev/null)" == "$1" ]]; then
			echo "$h"
			return
		fi
	done
}

format_uptime() {
	awk '{ s = int($1); d = int(s / 86400); h = int(s % 86400 / 3600); m = int(s % 3600 / 60)
    if (d > 0) printf "%dd %dh %dm", d, h, m; else printf "%dh %dm", h, m }' /proc/uptime
}

read_cpu() {
	awk '/^cpu / { idle = $5 + $6; total = 0; for (i = 2; i <= NF; i++) total += $i; print total, idle }' /proc/stat
}

# Slow probes; their results stay in these variables between redraws
ups_line=""
zfs_lines=()
docker_lines=()
units_line=""
disk_line=""

probe_ups() {
	ups_line=""
	command -v apcaccess >/dev/null || return 0
	local out status charge left load linev color
	out=$(timeout 2 apcaccess -u 2>/dev/null) || return 0
	status=$(awk -F': ' '/^STATUS/ { gsub(/ +$/, "", $2); print $2 }' <<<"$out")
	charge=$(awk -F': ' '/^BCHARGE/ { printf "%.0f", $2 }' <<<"$out")
	left=$(awk -F': ' '/^TIMELEFT/ { printf "%.0f", $2 }' <<<"$out")
	load=$(awk -F': ' '/^LOADPCT/ { printf "%.0f", $2 }' <<<"$out")
	linev=$(awk -F': ' '/^LINEV/ { printf "%.0f", $2 }' <<<"$out")
	color=$green
	[[ "$status" == ONLINE ]] || color=$red
	ups_line="${bold}USV${reset}  ${color}${status}${reset}  Akku ${charge}%  Restlaufzeit ${left} min  Last ${load}%  Netz ${linev} V"
}

probe_zfs() {
	zfs_lines=()
	command -v zpool >/dev/null || return 0
	local name size alloc cap health color scan
	while IFS=$'\t' read -r name size alloc cap health; do
		color=$green
		[[ "$health" == ONLINE ]] || color=$red
		scan=$(zpool status "$name" 2>/dev/null | awk '/scan:/ && /in progress/ { sub(/.*scan: /, ""); print; exit }')
		zfs_lines+=("$(printf '%-8s %s%-8s%s %s %3s%%  %s / %s%s' "$name" "$color" "$health" "$reset" \
			"$(bar "${cap%\%}" 30)" "${cap%\%}" "$alloc" "$size" "${scan:+  ${yellow}${scan}${reset}}")")
	done < <(zpool list -H -o name,size,alloc,cap,health 2>/dev/null)
}

probe_disks() {
	disk_line=""
	((EUID == 0)) || return 0
	local name tran temp rc json parts=()
	while read -r name tran; do
		case "$tran" in sata | sas | nvme) ;; *) continue ;; esac
		rc=0
		json=$(smartctl -n standby -j -A "/dev/$name" 2>/dev/null) || rc=$?
		# Exit status 2 with -n standby: the disk sleeps and was not woken up
		if ((rc & 2)) && [[ "$tran" != nvme ]]; then
			parts+=("${name} ${dim}zz${reset}")
			continue
		fi
		temp=$(jq -r '.temperature.current // empty' <<<"$json" 2>/dev/null || true)
		[[ -n "$temp" ]] && parts+=("${name} $(temp_color "$temp" 50 60)")
	done < <(lsblk -dno NAME,TRAN 2>/dev/null)
	((${#parts[@]} > 0)) && disk_line="${bold}Disks${reset} $(printf '%s  ' "${parts[@]}")"
	return 0
}

probe_docker() {
	docker_lines=()
	[[ -S /var/run/docker.sock ]] || return 0
	local rows cols width
	rows=$(timeout 5 docker ps -a --format '{{.Label "com.docker.compose.project"}}|{{.Names}}|{{.State}}|{{.Status}}' 2>/dev/null) || return 0
	width=24
	cols=$((term_cols / width))
	((cols < 1)) && cols=1
	# One entry per Compose project (or lone container), coloured by its worst container
	mapfile -t docker_lines < <(awk -F'|' -v cols="$cols" -v width="$width" \
		-v red="$red" -v yellow="$yellow" -v green="$green" -v dim="$dim" -v reset="$reset" '
    {
      p = ($1 != "" ? $1 : $2); n[p]++
      if ($3 == "running") {
        if ($4 ~ /unhealthy/) r = 3; else if ($4 ~ /starting/) r = 1; else r = 0
        running[p]++
      } else if ($3 == "restarting" || $3 == "paused") r = 2
      else r = -1
      if (!(p in worst) || r > worst[p]) worst[p] = r
    }
    END {
      k = 0
      PROCINFO["sorted_in"] = "@ind_str_asc"
      for (p in worst) {
        w = worst[p]
        if (w < 0 && running[p] > 0) w = 0
        if (w == 3) { c = red; m = "!" } else if (w >= 1) { c = yellow; m = "~" }
        else if (w == 0) { c = green; m = "*" } else { c = dim; m = "-" }
        label = sprintf("%s %s", m, p); if (n[p] > 1) label = label sprintf(" (%d)", n[p])
        if (length(label) > width - 1) label = substr(label, 1, width - 2) "~"
        cell[k++] = sprintf("%s%-*s%s", c, width, label, reset)
      }
      rows = int((k + cols - 1) / cols)
      for (r = 0; r < rows; r++) {
        line = ""
        for (c2 = 0; c2 < cols; c2++) { i = c2 * rows + r; if (i < k) line = line cell[i] }
        print line
      }
    }' <<<"$rows")
}

probe_units() {
	units_line=""
	local failed
	failed=$(systemctl --failed --no-legend --plain 2>/dev/null | awk '{ print $1 }' | tr '\n' ' ')
	if [[ -n "$failed" ]]; then
		units_line="${red}${bold}Fehlgeschlagen:${reset} ${red}${failed}${reset}"
	else
		units_line="${green}Keine fehlgeschlagenen systemd-Units${reset}"
	fi
}

coretemp=$(find_hwmon coretemp)
read -r cpu_total_prev cpu_idle_prev < <(read_cpu)
iface=""
rx_prev=0
tx_prev=0
net_time_prev=0

printf '%s' "${esc}[?25l${esc}[2J"
trap 'printf "%s" "${esc}[?25h${reset}"' EXIT

iteration=0
while true; do
	read -r term_rows term_cols < <(stty size 2>/dev/null || echo "34 100")

	if ((iteration % slow_every == 0)); then
		probe_ups
		probe_zfs
		probe_docker
		probe_units
	fi
	((iteration % smart_every == 0)) && probe_disks

	# Follow the default route: it may appear only after DHCP or move elsewhere
	if [[ -z "$iface" ]] || ((iteration % slow_every == 0)); then
		route_iface=$(default_iface)
		if [[ "$route_iface" != "$iface" ]]; then
			iface=$route_iface
			if [[ -n "$iface" ]] && read_net_counters "$iface"; then
				rx_prev=$net_rx
				tx_prev=$net_tx
				net_time_prev=$net_now
			fi
		fi
	fi

	# CPU usage since the last redraw
	read -r cpu_total cpu_idle < <(read_cpu)
	cpu_pct=$(((cpu_total - cpu_total_prev) > 0 ? 100 * ((cpu_total - cpu_total_prev) - (cpu_idle - cpu_idle_prev)) / (cpu_total - cpu_total_prev) : 0))
	cpu_total_prev=$cpu_total
	cpu_idle_prev=$cpu_idle

	# Memory; the ZFS ARC counts as used for the kernel but shrinks on demand
	read -r mem_total mem_avail < <(awk '/^MemTotal/ { t = $2 } /^MemAvailable/ { a = $2 } END { print t * 1024, a * 1024 }' /proc/meminfo)
	arc=0
	[[ -r /proc/spl/kstat/zfs/arcstats ]] && arc=$(awk '$1 == "size" { print $3 }' /proc/spl/kstat/zfs/arcstats)
	mem_used=$((mem_total - mem_avail - arc))
	mem_pct=$((100 * mem_used / mem_total))

	cpu_temp=""
	[[ -n "$coretemp" ]] && cpu_temp=$(temp_color "$(($(cat "$coretemp/temp1_input") / 1000))" 80 95)

	# Lines next to the clock
	info=(
		"${bold}${cyan}$(cat /proc/sys/kernel/hostname)${reset}"
		"$(date '+%A, %d.%m.%Y')"
		"Uptime $(format_uptime)   Load $(cut -d' ' -f1-3 /proc/loadavg)"
		"CPU $(printf '%3d' "$cpu_pct")% $(bar "$cpu_pct" 15)  ${cpu_temp}"
		"RAM $(printf '%3d' "$mem_pct")% $(bar "$mem_pct" 15)  $(human_bytes "$mem_used") / $(human_bytes "$mem_total")"
	)
	((arc > 0)) && info+=("${dim}    + ZFS-Cache (ARC) $(human_bytes "$arc")${reset}")

	lines=()
	mapfile -t clock < <(figlet -f small "$(date +%H:%M:%S)")
	clock_width=46
	for ((i = 0; i < ${#clock[@]} || i < ${#info[@]}; i++)); do
		lines+=("$(printf '%s%-*s%s' "$green$bold" "$clock_width" "${clock[i]:-}" "$reset")${info[i]:-}")
	done

	if [[ -n "$iface" ]] && read_net_counters "$iface"; then
		# Rates over the time that really passed (slow probes stretch some loops)
		elapsed=$((net_now - net_time_prev))
		((elapsed > 0)) || elapsed=1
		rx_rate=$(((net_rx - rx_prev) * 1000000 / elapsed))
		tx_rate=$(((net_tx - tx_prev) * 1000000 / elapsed))
		ip_addr=$(ip -4 -br addr show "$iface" 2>/dev/null | awk '{ print $3 }')
		lines+=("" "${bold}Netz${reset} ${iface} ${ip_addr}   ${green}↓ $(human_rate "$rx_rate")${reset}   ${cyan}↑ $(human_rate "$tx_rate")${reset}")
		rx_prev=$net_rx
		tx_prev=$net_tx
		net_time_prev=$net_now
	elif [[ -n "$iface" ]]; then
		# The interface disappeared; look for the default route again next loop
		iface=""
	fi
	[[ -n "$ups_line" ]] && lines+=("$ups_line")

	if ((${#zfs_lines[@]} > 0)); then
		lines+=("" "${bold}ZFS${reset}" "${zfs_lines[@]}")
	fi
	[[ -n "$disk_line" ]] && lines+=("$disk_line")

	if ((${#docker_lines[@]} > 0)); then
		lines+=("" "${bold}Docker${reset} ${dim}(* läuft  ~ startet  ! unhealthy  - gestoppt)${reset}" "${docker_lines[@]}")
	fi

	lines+=("" "$units_line")
	lines+=("${dim}Aktualisiert $(date +%T)${reset}")

	# Redraw in place without clearing, so the screen does not flicker
	{
		printf '%s' "${esc}[H"
		for ((i = 0; i < ${#lines[@]} && i < term_rows - 1; i++)); do
			printf '%s%s\n' "${lines[i]}" "${esc}[K"
		done
		printf '%s' "${esc}[J"
	}

	iteration=$((iteration + 1))
	sleep "$interval"
done
