"""Web server of the control center.

Serves the page (index.html) and a small JSON API on 127.0.0.1; Cloudflare
Tunnel publishes it behind Cloudflare Access. Runs unprivileged and passes
every request on to the root helper (helper.py) through its socket.

Every request must carry Access's JWT (Cf-Access-Jwt-Assertion) of a person
(with an email; service tokens are refused), signed by the team's keys and,
if CONTROL_CENTER_ACCESS_AUDIENCE is set, issued for this application.
Requests that change something must be POSTs with the header
X-Control-Center, which a cross-site form cannot send.

  GET  /                                 the page
  GET  /api/state                        status of all targets
  GET  /api/log?target=&action=&cursor=  journal of an action's last run
  POST /api/action {target, action}      diff, switch, boot, reboot,
                                         poweroff, vm-start, vm-shutdown,
                                         vm-reboot, vm-destroy
"""

import json
import os
import socket
import sys
from concurrent.futures import ThreadPoolExecutor
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib.parse import parse_qs, urlparse

import jwt

PORT = int(os.environ["CONTROL_CENTER_PORT"])
HELPER_SOCKET = os.environ["CONTROL_CENTER_HELPER_SOCKET"]
INDEX = os.environ["CONTROL_CENTER_INDEX"]
VMS = json.loads(os.environ.get("CONTROL_CENTER_VMS", "[]"))
TEAM_DOMAIN = os.environ["CONTROL_CENTER_ACCESS_TEAM_DOMAIN"]
AUDIENCE = os.environ.get("CONTROL_CENTER_ACCESS_AUDIENCE") or None

TARGETS = ["host", *VMS]
ACTIONS = ("diff", "switch", "boot", "reboot", "poweroff")
VM_ACTIONS = ("vm-start", "vm-shutdown", "vm-reboot", "vm-destroy")

jwks = jwt.PyJWKClient(f"https://{TEAM_DOMAIN}/cdn-cgi/access/certs", cache_keys=True, lifespan=3600)
pool = ThreadPoolExecutor(max_workers=8)


def helper(request, timeout=60):
    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as s:
        s.settimeout(timeout)
        s.connect(HELPER_SOCKET)
        s.sendall(json.dumps(request).encode() + b"\n")
        data = b""
        while chunk := s.recv(65536):
            data += chunk
    return json.loads(data)


def authenticated_email(token):
    if not token:
        return None
    try:
        key = jwks.get_signing_key_from_jwt(token)
        claims = jwt.decode(
            token,
            key.key,
            algorithms=["RS256"],
            issuer=f"https://{TEAM_DOMAIN}",
            audience=AUDIENCE,
            options={"verify_aud": AUDIENCE is not None, "require": ["exp", "iss"]},
        )
    except jwt.PyJWTError as e:
        print(f"JWT refused: {e}", file=sys.stderr)
        return None
    return claims.get("email")


def state():
    def one(target):
        try:
            result = helper({"target": target, "cmd": "status"})
        except OSError as e:
            result = {"error": f"Helper nicht erreichbar: {e}"}
        name = socket.gethostname() if target == "host" else target
        return {"id": target, "kind": "host" if target == "host" else "vm", "name": name, **result}

    return {"targets": list(pool.map(one, TARGETS))}


class Handler(BaseHTTPRequestHandler):
    server_version = "control-center"

    def log_message(self, format, *args):
        # The page polls every second; log only what changes something
        if self.command == "POST":
            super().log_message(format, *args)

    def send(self, code, body, content_type="application/json"):
        if not isinstance(body, bytes):
            body = json.dumps(body).encode()
        self.send_response(code)
        self.send_header("Content-Type", content_type)
        self.send_header("Content-Length", str(len(body)))
        self.send_header("Cache-Control", "no-store")
        self.send_header("X-Content-Type-Options", "nosniff")
        self.send_header("X-Frame-Options", "DENY")
        self.send_header("Content-Security-Policy", "default-src 'self'; script-src 'unsafe-inline'; style-src 'unsafe-inline'; frame-ancestors 'none'")
        self.end_headers()
        self.wfile.write(body)

    def authorize(self):
        email = authenticated_email(self.headers.get("Cf-Access-Jwt-Assertion"))
        if email is None:
            self.send(403, {"ok": False, "error": "Keine gültige Cloudflare-Access-Anmeldung"})
        return email

    def do_GET(self):
        self.guarded(self.get)

    def do_POST(self):
        self.guarded(self.post)

    def guarded(self, method):
        try:
            method()
        except OSError as e:
            self.send(502, {"ok": False, "error": f"Helper nicht erreichbar: {e}"})

    def get(self):
        if self.authorize() is None:
            return
        url = urlparse(self.path)
        query = {k: v[0] for k, v in parse_qs(url.query).items()}
        if url.path == "/":
            with open(INDEX, "rb") as f:
                self.send(200, f.read(), "text/html; charset=utf-8")
        elif url.path == "/api/state":
            self.send(200, state())
        elif url.path == "/api/log" and query.get("target") in TARGETS and query.get("action") in ACTIONS[:3]:
            request = {"target": query["target"], "cmd": "log", "action": query["action"]}
            if query.get("cursor"):
                request["cursor"] = query["cursor"]
            self.send(200, helper(request))
        else:
            self.send(404, {"ok": False, "error": "Nicht gefunden"})

    def post(self):
        email = self.authorize()
        if email is None:
            return
        if self.path != "/api/action" or self.headers.get("X-Control-Center") != "1":
            self.send(404, {"ok": False, "error": "Nicht gefunden"})
            return
        try:
            length = int(self.headers.get("Content-Length", "0"))
            body = json.loads(self.rfile.read(min(length, 4096)))
            target, action = body["target"], body["action"]
        except (ValueError, KeyError, TypeError):
            self.send(400, {"ok": False, "error": "Ungültige Anfrage"})
            return
        if target not in TARGETS or action not in (ACTIONS if target == "host" else ACTIONS[:3] + VM_ACTIONS):
            self.send(400, {"ok": False, "error": "Unbekanntes Ziel oder unbekannte Aktion"})
            return
        print(f"{email}: {action} on {target}", file=sys.stderr)
        if action.startswith("vm-"):
            request = {"target": target, "cmd": "vm", "action": action[len("vm-"):]}
        else:
            request = {"target": target, "cmd": "start", "action": action}
        self.send(200, helper(request, timeout=180))


def main():
    if AUDIENCE is None:
        print("CONTROL_CENTER_ACCESS_AUDIENCE not set: accepting Access JWTs of every application of the team", file=sys.stderr)
    ThreadingHTTPServer(("127.0.0.1", PORT), Handler).serve_forever()


if __name__ == "__main__":
    main()
