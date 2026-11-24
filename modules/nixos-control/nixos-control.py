"""Remote control of this NixOS host for the control center.

Runs as root, called by the control center's helper: directly on the server,
through the QEMU guest agent in its VMs. Every command prints one JSON object.

  nixos-control status                 state of the host and of the units
  nixos-control start ACTION           diff, switch, boot, reboot, poweroff
  nixos-control log ACTION [CURSOR]    journal of the action's last run
"""

import json
import os
import socket
import subprocess
import sys
import time

# The guest agent starts commands with an almost empty PATH
os.environ["PATH"] = "/run/current-system/sw/bin:/run/wrappers/bin:" + os.environ.get("PATH", "")

ACTIONS = ("diff", "switch", "boot")
POWER = ("reboot", "poweroff")
LOG_LIMIT = 2000


def run(cmd, timeout=10):
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)
    except (OSError, subprocess.TimeoutExpired):
        return None
    return result.stdout if result.returncode == 0 else None


def read(path):
    try:
        with open(path) as f:
            return f.read().strip()
    except OSError:
        return None


def unit(action):
    return f"nixos-control-{action}.service"


def timestamp(value):
    # systemctl show --timestamp=unix: "@1700000000" or empty
    if value and value.startswith("@"):
        return int(value[1:])
    return None


def unit_state(action):
    out = run(["systemctl", "show", unit(action), "--timestamp=unix",
               "-p", "ActiveState,Result,ExecMainStartTimestamp,ExecMainExitTimestamp"]) or ""
    props = dict(line.split("=", 1) for line in out.splitlines() if "=" in line)
    started = timestamp(props.get("ExecMainStartTimestamp"))
    state = props.get("ActiveState", "unknown")
    # RemainAfterExit: "active" means the last run succeeded, "activating" that it runs
    if state == "activating":
        status = "running"
    elif state == "failed":
        status = "failed"
    elif state == "active":
        status = "succeeded"
    else:
        status = "never"
    return {
        "status": status,
        "started": started,
        "finished": timestamp(props.get("ExecMainExitTimestamp")) if status != "running" else None,
    }


def running_actions():
    return [a for a in ACTIONS if unit_state(a)["status"] == "running"]


def same_link(a, b, name):
    return os.path.realpath(os.path.join(a, name)) == os.path.realpath(os.path.join(b, name))


def reboot_reasons():
    booted, current = "/run/booted-system", "/run/current-system"
    reasons = []
    if not (os.path.isdir(booted) and os.path.isdir(current)):
        return reasons
    if not same_link(booted, current, "kernel"):
        reasons.append("neuer Kernel")
    if not same_link(booted, current, "initrd"):
        reasons.append("initrd geändert")
    if not same_link(booted, current, "kernel-modules"):
        reasons.append("Kernel-Module geändert")
    if read(f"{booted}/kernel-params") != read(f"{current}/kernel-params"):
        reasons.append("Kernel-Parameter geändert")
    if not same_link(booted, current, "systemd"):
        reasons.append("systemd aktualisiert")
    return reasons


def nixos():
    current = os.path.realpath("/run/current-system")
    generation = 0
    profiles = "/nix/var/nix/profiles"
    for name in os.listdir(profiles):
        if name.startswith("system-") and name.endswith("-link"):
            if os.path.realpath(os.path.join(profiles, name)) == current:
                generation = max(generation, int(name[len("system-"):-len("-link")]))
    try:
        if generation:
            since = int(os.lstat(f"{profiles}/system-{generation}-link").st_mtime)
        else:
            since = int(os.lstat("/run/current-system").st_mtime)
    except OSError:
        since = None
    # Activated with `boot`: active only since the reboot
    boot_time = int(time.time() - uptime())
    if since is not None and since < boot_time:
        since = boot_time
    revision, revision_time = None, None
    parts = (read(f"{current}/etc/nixos-configuration-revision") or "").split()
    if parts and parts[0] != "unknown":
        revision = parts[0]
        if len(parts) > 1 and parts[1] != "0":
            revision_time = int(parts[1])
    return {
        "version": read(f"{current}/nixos-version"),
        "generation": generation or None,
        "since": since,
        "revision": revision,
        "revisionTime": revision_time,
        "rebootReasons": reboot_reasons(),
    }


def uptime():
    return float((read("/proc/uptime") or "0").split()[0])


def memory():
    info = {}
    for line in (read("/proc/meminfo") or "").splitlines():
        key, _, value = line.partition(":")
        info[key] = int(value.split()[0]) * 1024
    return {"total": info.get("MemTotal"), "available": info.get("MemAvailable")}


def failed_units():
    out = run(["systemctl", "--failed", "--no-legend", "--plain"]) or ""
    return [line.split()[0] for line in out.splitlines() if line.strip()]


def zfs_pools():
    out = run(["zpool", "list", "-H", "-o", "name,size,alloc,cap,health"])
    if out is None:
        return None
    pools = []
    for line in out.splitlines():
        name, size, alloc, cap, health = line.split("\t")
        scan = None
        for status_line in (run(["zpool", "status", name]) or "").splitlines():
            status_line = status_line.strip()
            if status_line.startswith("scan:") and "in progress" in status_line:
                scan = status_line[len("scan:"):].strip()
        pools.append({"name": name, "size": size, "alloc": alloc, "cap": cap, "health": health, "scan": scan})
    return pools


def docker_containers():
    if not os.path.exists("/var/run/docker.sock"):
        return None
    fmt = '{{.Label "com.docker.compose.project"}}\t{{.Names}}\t{{.State}}\t{{.Status}}'
    out = run(["docker", "ps", "-a", "--format", fmt])
    if out is None:
        return None
    containers = []
    for line in out.splitlines():
        project, name, state, status = line.split("\t")
        containers.append({"project": project or None, "name": name, "state": state, "status": status})
    return sorted(containers, key=lambda c: (c["project"] or "", c["name"]))


def ups():
    out = run(["apcaccess", "-u"], timeout=3)
    if out is None:
        return None
    fields = {}
    for line in out.splitlines():
        key, _, value = line.partition(":")
        fields[key.strip()] = value.strip()
    return {
        "status": fields.get("STATUS"),
        "charge": fields.get("BCHARGE"),
        "timeLeft": fields.get("TIMELEFT"),
        "load": fields.get("LOADPCT"),
    }


def status():
    return {
        "hostname": socket.gethostname(),
        "time": int(time.time()),
        "uptime": uptime(),
        "load": [float(x) for x in (read("/proc/loadavg") or "0 0 0").split()[:3]],
        "memory": memory(),
        "nixos": nixos(),
        "failedUnits": failed_units(),
        "zfs": zfs_pools(),
        "docker": docker_containers(),
        "ups": ups(),
        "actions": {a: unit_state(a) for a in ACTIONS},
    }


def start(action):
    busy = running_actions()
    if busy:
        return {"ok": False, "error": f"Es läuft bereits: {', '.join(busy)}"}
    if action in ACTIONS:
        # restart: with RemainAfterExit, start would not run a succeeded unit again
        cmd = ["systemctl", "restart", "--no-block", unit(action)]
    else:
        cmd = ["systemctl", "--no-block", action]
    if run(cmd) is None:
        return {"ok": False, "error": f"{' '.join(cmd)} ist fehlgeschlagen"}
    return {"ok": True}


def message(entry):
    # The journal's JSON gives messages with control characters (colours) as byte arrays
    value = entry.get("MESSAGE", "")
    if isinstance(value, list):
        return bytes(value).decode("utf-8", "replace")
    return value or ""


def log(action, cursor=None):
    cmd = ["journalctl", "-u", unit(action), "--invocation=0", "-o", "json", "--no-pager"]
    if cursor:
        cmd.append(f"--after-cursor={cursor}")
    lines = []
    more = False
    with subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True) as proc:
        for raw in proc.stdout:
            if len(lines) >= LOG_LIMIT:
                more = True
                proc.kill()
                break
            try:
                entry = json.loads(raw)
            except ValueError:
                continue
            cursor = entry.get("__CURSOR", cursor)
            lines.append({
                "time": int(entry.get("__REALTIME_TIMESTAMP", "0")) // 1000000,
                "priority": int(entry.get("PRIORITY", "6")),
                "message": message(entry),
            })
    return {"lines": lines, "cursor": cursor, "more": more, "state": unit_state(action)}


def main(args):
    if args == ["status"]:
        return status()
    if len(args) == 2 and args[0] == "start" and args[1] in ACTIONS + POWER:
        return start(args[1])
    if len(args) in (2, 3) and args[0] == "log" and args[1] in ACTIONS:
        return log(args[1], args[2] if len(args) == 3 else None)
    print(__doc__, file=sys.stderr)
    sys.exit(2)


if __name__ == "__main__":
    print(json.dumps(main(sys.argv[1:])))
