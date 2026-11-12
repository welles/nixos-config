"""Send one command to Home Assistant's WebSocket API and print the result.

Usage: ha-ws <type> [json-payload]
       echo '<json-payload>' | ha-ws <type> -

Reads HASS_SERVER and HASS_TOKEN from the environment. Prints the
command's result as JSON and exits non-zero if Home Assistant reports an
error.
"""

import asyncio
import json
import os
import sys

import websockets


async def run(command: dict) -> int:
    server = os.environ["HASS_SERVER"].rstrip("/")
    url = server.replace("https://", "wss://", 1).replace("http://", "ws://", 1)
    async with websockets.connect(url + "/api/websocket", max_size=None) as ws:
        await ws.recv()  # auth_required
        await ws.send(
            json.dumps({"type": "auth", "access_token": os.environ["HASS_TOKEN"]})
        )
        auth = json.loads(await ws.recv())
        if auth.get("type") != "auth_ok":
            print(json.dumps(auth), file=sys.stderr)
            return 1
        await ws.send(json.dumps({"id": 1, **command}))
        while True:
            msg = json.loads(await ws.recv())
            if msg.get("id") == 1 and msg.get("type") == "result":
                break
    if not msg.get("success"):
        print(json.dumps(msg.get("error"), ensure_ascii=False), file=sys.stderr)
        return 1
    print(json.dumps(msg.get("result"), ensure_ascii=False, indent=2))
    return 0


def main() -> int:
    if len(sys.argv) < 2 or sys.argv[1] in ("-h", "--help"):
        print(__doc__.strip(), file=sys.stderr)
        return 2
    payload = {}
    if len(sys.argv) > 2:
        raw = sys.stdin.read() if sys.argv[2] == "-" else sys.argv[2]
        payload = json.loads(raw)
    return asyncio.run(run({**payload, "type": sys.argv[1]}))


if __name__ == "__main__":
    sys.exit(main())
