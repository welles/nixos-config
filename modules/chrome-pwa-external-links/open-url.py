import json
import struct
import subprocess
import sys
from urllib.parse import urlsplit


MESSAGE_LENGTH = struct.Struct("=I")
MAX_MESSAGE_LENGTH = 1024 * 1024


def read_url(stream):
    header = stream.read(MESSAGE_LENGTH.size)
    if len(header) != MESSAGE_LENGTH.size:
        return None
    (length,) = MESSAGE_LENGTH.unpack(header)
    if length > MAX_MESSAGE_LENGTH:
        return None
    payload = stream.read(length)
    if len(payload) != length:
        return None
    message = json.loads(payload)
    if not isinstance(message, dict) or not isinstance(url := message.get("url"), str):
        return None
    parsed = urlsplit(url)
    if parsed.scheme in {"http", "https"} and parsed.hostname:
        return url
    return None


def main():
    opened = False
    try:
        url = read_url(sys.stdin.buffer)
        if url is not None:
            result = subprocess.run(
                ["@gio@", "open", url],
                stdin=subprocess.DEVNULL,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                check=False,
            )
            opened = result.returncode == 0
    except (OSError, ValueError):
        pass

    reply = json.dumps({"opened": opened}).encode("utf-8")
    sys.stdout.buffer.write(MESSAGE_LENGTH.pack(len(reply)) + reply)


if __name__ == "__main__":
    main()
