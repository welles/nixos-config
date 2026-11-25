"""Privileged helper of the control center.

Runs as root behind the socket /run/control-center-helper.sock (socket unit,
only the group control-center may connect). The web server sends one JSON
request per connection and gets one JSON response:

  {"target": "host", "cmd": "status"}
  {"target": "<vm>", "cmd": "start", "action": "switch"}
  {"target": "<vm>", "cmd": "log", "action": "diff", "cursor": "..."}
  {"target": "<vm>", "cmd": "vm", "action": "shutdown"}

Target "host" is this server; its `nixos-control` runs directly. The VMs (the
names in $CONTROL_CENTER_VMS) run their `nixos-control` through the QEMU guest
agent; "vm" commands act on the domain itself through libvirt.
"""

import base64
import json
import os
import socket
import subprocess
import threading
import time

NIXOS_CONTROL = "/run/current-system/sw/bin/nixos-control"
VMS = json.loads(os.environ.get("CONTROL_CENTER_VMS", "[]"))
ACTIONS = ("diff", "switch", "boot")
POWER = ("reboot", "poweroff")
VM_ACTIONS = ("start", "resume", "shutdown", "reboot", "destroy")


class Error(Exception):
    pass


def run(cmd, timeout=30):
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)
    except subprocess.TimeoutExpired:
        raise Error(f"Zeitüberschreitung: {cmd[0]}")
    if result.returncode != 0:
        raise Error((result.stderr or result.stdout).strip() or f"{cmd[0]} ist fehlgeschlagen")
    return result.stdout


def agent(vm, command, arguments=None):
    request = {"execute": command}
    if arguments is not None:
        request["arguments"] = arguments
    out = run(["virsh", "qemu-agent-command", vm, json.dumps(request), "--timeout", "5"], timeout=15)
    return json.loads(out)["return"]


def guest_exec(vm, args, timeout):
    """Runs nixos-control in the VM and returns its JSON output."""
    pid = agent(vm, "guest-exec", {"path": NIXOS_CONTROL, "arg": args, "capture-output": True})["pid"]
    deadline = time.monotonic() + timeout
    while time.monotonic() < deadline:
        status = agent(vm, "guest-exec-status", {"pid": pid})
        if status.get("exited"):
            out = base64.b64decode(status.get("out-data", "")).decode("utf-8", "replace")
            if status.get("exitcode") != 0:
                err = base64.b64decode(status.get("err-data", "")).decode("utf-8", "replace")
                raise Error(err.strip() or f"nixos-control endete mit {status.get('exitcode')}")
            return json.loads(out)
        time.sleep(0.1)
    raise Error("Zeitüberschreitung beim Guest-Agent")


def vm_state(vm):
    try:
        return run(["virsh", "domstate", vm], timeout=10).strip()
    except Error:
        return "undefined"


def nixos_control(target, args, timeout=30):
    if target == "host":
        return json.loads(run([NIXOS_CONTROL, *args], timeout=timeout))
    return guest_exec(target, args, timeout)


def vm_command(vm, action):
    if action == "start":
        # Defines the domain from the current configuration and starts it
        run(["systemctl", "restart", f"libvirt-vm-{vm}.service"], timeout=120)
    else:
        run(["virsh", action, vm])
    return {"ok": True}


def handle(request):
    target = request.get("target")
    cmd = request.get("cmd")
    action = request.get("action")
    if target != "host" and target not in VMS:
        raise Error("Unbekanntes Ziel")

    if cmd == "status":
        result = {}
        if target != "host":
            result["vmState"] = vm_state(target)
            if result["vmState"] != "running":
                return result
        try:
            result["status"] = nixos_control(target, ["status"])
        except Error as e:
            result["error"] = str(e)
        return result
    if cmd == "start" and action in ACTIONS + POWER:
        if target != "host" and action in POWER:
            raise Error("Die VM über die VM-Befehle neu starten oder herunterfahren")
        return nixos_control(target, ["start", action])
    if cmd == "log" and action in ACTIONS:
        cursor = request.get("cursor")
        args = ["log", action] + ([cursor] if isinstance(cursor, str) and cursor else [])
        return nixos_control(target, args)
    if cmd == "vm" and target != "host" and action in VM_ACTIONS:
        return vm_command(target, action)
    raise Error("Unbekannter Befehl")


def serve(conn):
    with conn:
        try:
            data = b""
            while not data.endswith(b"\n"):
                chunk = conn.recv(65536)
                if not chunk:
                    break
                data += chunk
            response = handle(json.loads(data))
        except Error as e:
            response = {"ok": False, "error": str(e)}
        except Exception as e:  # noqa: BLE001 - report anything to the web server
            response = {"ok": False, "error": f"{type(e).__name__}: {e}"}
        conn.sendall(json.dumps(response).encode() + b"\n")


def main():
    # Socket activation: the listening socket is file descriptor 3
    listener = socket.socket(fileno=3)
    while True:
        conn, _ = listener.accept()
        threading.Thread(target=serve, args=(conn,), daemon=True).start()


if __name__ == "__main__":
    main()
