# Docker Compose Stack Rules

Rules extracted from existing stacks for consistency when adding new ones.

---

## 1. Directory and File Structure

- Each stack lives in its own directory: `modules/stacks/{stack_name}/`
- The directory must contain exactly one file: `docker-compose.yaml`
- Stack names use `snake_case`
- Every new stack must be registered in `modules/stacks/default.nix`

---

## 2. Stack ID and Address Assignment

Each stack is assigned a unique integer ID **N** (1–99). This ID governs both the network subnet and the host port range. Inspect the existing `docker-compose.yaml` files to find a free N before adding a new stack.

### Derivation rules

- **Subnet**: `10.10.N.0/24`
- **Host port base**: `500(N*10)` — e.g. N=17 → base port 50170
- **Additional host ports**: base+1, base+2, … (up to 9 extra ports per stack)
- **Service IPs within the subnet**:
  - Primary app: `10.10.N.10`
  - Database: `10.10.N.20`
  - Cache / Redis: `10.10.N.30`
  - Worker / cron / auxiliary: `10.10.N.40`
  - Init/setup containers (one-shot): use `network_mode: none` and a named volume instead

---

## 3. Network Block

Every stack defines its own isolated bridge network. No cross-stack networking.

```yaml
networks:
  {stack_name}:
    name: {stack_name}
    driver: bridge
    enable_ipv6: false
    ipam:
      config:
        - subnet: 10.10.N.0/24
```

All services attach to this network with an explicit static `ipv4_address`.

---

## 4. Service Naming

- Multi-service stacks: prefix all service and container names with `{stack_name}_` — e.g. `forgejo_app`, `forgejo_db`
- Single-service stacks: service name equals the stack name — e.g. `navidrome`, `jdownloader`
- `container_name` always matches the service name exactly

---

## 5. Required Fields on Every Service

```yaml
environment:
  TZ: Europe/Berlin
restart: unless-stopped
stop_grace_period: 2m
volumes:
  - /etc/localtime:/etc/localtime:ro
```

All services must have these, no exceptions.

---

## 6. Health Checks

Every service must have a `healthcheck`. Choose the method appropriate to the service:

| Scenario               | Test command                                                    |
|------------------------|-----------------------------------------------------------------|
| HTTP API               | `["CMD-SHELL", "curl -f http://localhost:{port}/{path} \|\| exit 1"]` |
| HTTPS (self-signed)    | `["CMD-SHELL", "curl -fks https://localhost:{port}/{path} \|\| exit 1"]` |
| TCP port listening     | `["CMD-SHELL", "nc -z 127.0.0.1 {port} \|\| exit 1"]`          |
| PostgreSQL             | `["CMD-SHELL", "pg_isready -U {user}"]`                        |
| Redis                  | `["CMD", "redis-cli", "ping"]`                                 |
| Process running        | `["CMD-SHELL", "pgrep -f {process_name} > /dev/null \|\| exit 1"]` |
| wget-capable container | `["CMD-SHELL", "wget -q --spider --proxy off localhost:{port}/{path} \|\| exit 1"]` |

Standard intervals by service type:

| Service type      | interval | timeout | retries | start_period |
|-------------------|----------|---------|---------|--------------|
| App (fast start)  | 30s      | 10s     | 3       | 10–30s       |
| App (slow start)  | 30s      | 10–30s  | 3       | 30–300s      |
| PostgreSQL / Redis| 10s      | 5s      | 5       | —            |

---

## 7. Secrets

There are two distinct secret mechanisms; pick the right one for each use case.

### `secrets` (env_file secrets)

Used when the container reads environment variables from a file at runtime.

- Declared in `default.nix` under `secrets = [...]`
- sops-nix mounts the secret at `/run/secrets/{name}` with permissions `root:docker 0440`
- Reference in compose:
  ```yaml
  env_file:
    - /run/secrets/{secret_name}
  ```
- The secret file contains `KEY=VALUE` lines consumed by the container

### `composeSecrets` (compose interpolation secrets)

Used when the compose YAML itself references `${VAR}` — the variables must be expanded before Docker sees the file.

- Declared in `default.nix` under `composeSecrets = [...]`
- sops-nix mounts the secret at `/run/secrets/{name}` with permissions `root:root 0400`
- Injected by systemd as `EnvironmentFile=` before `docker compose up` runs
- Use only when the compose YAML contains `${VARIABLE}` interpolation (not for container env vars)

---

## 8. Volumes, Data Paths, and ZFS Datasets

Always specify `:rw` or `:ro` explicitly on every volume mount.

| Data type                        | Host path pattern                                      |
|----------------------------------|--------------------------------------------------------|
| App config / state (bucket)      | `/mnt/bucket/{stack_name}/{service_or_role}/`          |
| Large media / user data (NAS)    | `/mnt/tank/{category}/`                                |
| Named Docker volumes (init data) | Use a top-level `volumes:` block and reference by name |

Use named Docker volumes only for ephemeral init data passed between containers (e.g. guacamole's initdb SQL). All persistent state lives on host paths.

### ZFS dataset

Every new stack that stores data on the bucket pool needs its own ZFS dataset declared in `hosts/nico-schokoladenelch-nixos/disk-configuration.nix`, under `zpool.bucket.datasets`:

```nix
"{stack_name}" = {
  type = "zfs_fs";
  mountpoint = "/mnt/bucket/{stack_name}";
  options = {
    mountpoint = "legacy";
    "com.sun:auto-snapshot" = "true";
  };
};
```

Similarly, if the stack needs a large-data dataset on the tank pool, add it under `zpool.tank.datasets` with mountpoint `/mnt/tank/{dataset_name}`.

---

## 9. Image Pinning

- Pin to a specific version tag for all production/data services: `postgres:16.7-alpine`, `nextcloud:34.0.0`
- `latest` is acceptable only for non-critical desktop/GUI tools with no persistent schema
- Prefer `alpine` variants for databases when available

---

## 10. Dependencies

Use `depends_on` with `condition: service_healthy` to enforce startup order. Never start the app before its database is healthy.

```yaml
depends_on:
  {stack_name}_db:
    condition: service_healthy
```

---

## 11. Ports

- Expose only ports that are proxied through Caddy or directly needed externally
- Always specify the protocol explicitly: `50010:8096/tcp`, `50060:7777/udp`
- Both TCP and UDP may share the same host port number if required by the application

---

## 12. Registering in default.nix

Add an entry to the `stacks` attrset in `modules/stacks/default.nix`:

```nix
{stack_name} = {
  enabled = true;           # false to define but not deploy
  secrets = ["{secret}"];   # sops secret names for env_file secrets
  # composeSecrets = [];    # only if compose YAML uses ${VAR} interpolation
  proxies = {
    "{service}.welles.app" = {host_port};  # omit if not web-accessible
  };
  backup = {
    enable = false;         # true to add daily restic backup
    paths = [];             # host paths to snapshot when backup is enabled
  };
};
```

- Proxy domains follow the pattern `{service}.welles.app`
- The proxy maps a domain to the **host** port (not the container port)
- Caddy adds HSTS headers automatically; no need to configure TLS in compose

### Backup

When `backup.enable = true`:
- A sops secret named `restic-{stack_name}` must exist with restic env vars (repo URL, credentials)
- The backup runs daily at 03:00, briefly stops the stack, snapshots `backup.paths` to B2 bucket `schokoladenelch-{stack_name}`, then restarts
- Backup failure sends an email notification to `nico@welles.email`
