# Observability platform for nico-schokoladenelch-nixos

## Context

`nico-schokoladenelch-nixos` is the home server (ZFS/disko, Docker, Caddy, impermanence) running 9 enabled `modules/stacks` docker-compose stacks (forgejo, jdownloader, musicbrainz_picard, guacamole, jellyfin, navidrome, nextcloud, windmill, windows). The only monitoring today is `services.glances` (LAN-only, no history, no alerting, no logs). The goal is real observability: host metrics, per-container Docker metrics, and searchable logs (host + container), with dashboards and basic alerting — reusing the existing Ionos SMTP relay already used for restic-backup-failure emails.

Chosen platform (confirmed against this repo's actual pinned channel, `nixpkgs/nixos-26.05`, via the NixOS options index): **Prometheus + Grafana + Loki + Grafana Alloy**, all as native NixOS services, plus native `services.cadvisor` for per-container metrics. This matches the repo's strong existing convention of using upstream NixOS options instead of inventing new abstractions, and avoids adding yet another `modules/stacks` docker-compose entry for core infrastructure.

Two corrections from the initial framing, verified directly against the 26.05 option index:
- **`services.promtail` does not exist in nixos-26.05** (removed upstream, EOL). Use **`services.alloy`** (Grafana Alloy) instead as the single log-shipping agent — it ships host journal logs (`loki.source.journal`) and per-container Docker logs (`loki.source.docker`, via Docker Engine API + `discovery.docker`) in one process.
- **cAdvisor has a native NixOS module** (`services.cadvisor`, confirmed present in 26.05), so it does *not* need to become a new `modules/stacks` entry with its own subnet/ID/compose file — it runs as a plain system service with access to `/var/run/docker.sock` and cgroups already.

Also confirmed: `services.grafana.dataDir` and `services.loki.dataDir` accept arbitrary absolute paths, but `services.prometheus.stateDir` is always resolved under `/var/lib/` via systemd `StateDirectory=` — so Prometheus's ZFS-backed storage is wired via a bind mount onto `/var/lib/prometheus2` instead of a `dataDir`-style option.

**Grafana web access**: kept behind the existing Cloudflare Tunnel (`systemd.services.cloudflared-tunnel` in `services.nix`, a "remotely managed" tunnel whose ingress/public-hostname routing is configured in the Cloudflare Zero Trust dashboard, not in this repo) rather than exposed openly through Caddy like the other stacks. This reuses the Google-account SSO (Cloudflare Access) already set up for other services on that tunnel, so Grafana never gets a public unauthenticated HTTPS endpoint. Concretely this means: **no** `services.caddy.virtualHosts` entry and **no** `services.cloudflare-dyndns.domains` addition for `grafana.welles.app` — Grafana stays bound to `127.0.0.1:3000` only, and the public hostname → Access-policy wiring is a manual step in the Cloudflare dashboard (out of this repo's scope, same as how the tunnel's other routes are already managed).

**Alertmanager is intentionally skipped for v1** — Grafana's built-in unified alerting (already bundled, no extra service) covers a handful of sane default alerts via the same Prometheus datasource, and reuses the existing `msmtp-password` sops secret for email. This keeps the service count to 6 (node-exporter, cadvisor, prometheus, grafana, loki, alloy) instead of 7, appropriate for a single-host v1.

Per-stack application metrics (forgejo/nextcloud/jellyfin exposing their own `/metrics`) are out of scope for v1 — noted as future work, added per-stack later if desired.

## File layout

```
hosts/nico-schokoladenelch-nixos/
├── default.nix                 (MODIFY: add import)
├── disk-configuration.nix      (MODIFY: 3 new bucket datasets)
├── impermanence.nix            (MODIFY: neededForBoot for the 3 new mounts)
├── sops.nix                    (MODIFY: 1 new secret, grafana-admin-password)
├── observability.nix           (NEW: main module — node-exporter, cadvisor, prometheus, loki, alloy, grafana)
└── observability/
    └── alloy-config.alloy      (NEW: Alloy River config — journal + docker log shipping to Loki)
```

No changes needed to `networking.nix` — Grafana rides the existing Cloudflare Tunnel (SSO-gated, configured in the Cloudflare dashboard); Prometheus/Loki/cAdvisor/node-exporter/Grafana itself all stay bound to `127.0.0.1` on the host (local-only by design, no new firewall rule required since none of them are exposed on the LAN or externally, except via the tunnel for Grafana).

## Implementation

### 1. ZFS datasets

Imperatively, on the host (compose files aren't applied until a rebuild, and disko only formats at install time — new datasets must be created by hand first, per `modules/stacks/RULES.md` §8 convention and the repo's own `create-zfs-dataset` script):
```bash
create-zfs-dataset bucket prometheus
create-zfs-dataset bucket grafana
create-zfs-dataset bucket loki
```

Then add to `hosts/nico-schokoladenelch-nixos/disk-configuration.nix` under `zpool.bucket.datasets`, matching the exact shape of the existing `forgejo`/`windmill` entries:
```nix
"prometheus" = {
  type = "zfs_fs";
  mountpoint = "/mnt/bucket/prometheus";
  options = { mountpoint = "legacy"; "com.sun:auto-snapshot" = "true"; };
};
"grafana" = { ... mountpoint = "/mnt/bucket/grafana"; ... };
"loki" = { ... mountpoint = "/mnt/bucket/loki"; ... };
```

In `hosts/nico-schokoladenelch-nixos/impermanence.nix`, add to the `fileSystems` block (mirroring the existing `/mnt/bucket/apps` / `/mnt/bucket/libvirt` entries):
```nix
"/mnt/bucket/prometheus".neededForBoot = true;
"/mnt/bucket/grafana".neededForBoot = true;
"/mnt/bucket/loki".neededForBoot = true;
```

### 2. sops secret

In `hosts/nico-schokoladenelch-nixos/sops.nix`, add:
```nix
"grafana-admin-password" = {
  owner = "grafana";
  group = "grafana";
  mode = "0440";
  restartUnits = ["grafana.service"];
};
```
Then run `sops hosts/nico-schokoladenelch-nixos/secrets.yaml` and add a `grafana-admin-password: <value>` entry (manual step, encrypted file). No new SMTP secret needed — `msmtp-password` is already `mode = "0444"` (world-readable) and can be reused directly by Grafana's own SMTP settings.

### 3. `hosts/nico-schokoladenelch-nixos/default.nix`

Add `./observability.nix` to the imports list next to `./services.nix`.

### 4. `hosts/nico-schokoladenelch-nixos/observability.nix` (new)

Prose header comment (matching `services.nix`/`docker.nix` style), then:

- **Node exporter** — `services.prometheus.exporters.node.enable = true;` bound to `127.0.0.1:9100`, `enabledCollectors = ["systemd"];`.
- **cAdvisor** — `services.cadvisor.enable = true;` bound to `127.0.0.1:8080` (per-container metrics; runs as root by default so it already has docker.sock/cgroup access, no extra group wiring).
- **Prometheus** — bind-mount `/var/lib/prometheus2` onto `/mnt/bucket/prometheus` via a `fileSystems` entry (`fsType = "none"; options = ["bind"];`), `listenAddress = "127.0.0.1"; port = 9090;`, `scrapeConfigs` for `node` (9100) and `cadvisor` (8080) jobs.
- **Loki** — `services.loki.dataDir = "/mnt/bucket/loki";`, filesystem storage + TSDB index schema (single-binary mode, `replication_factor = 1`, `ring.kvstore.store = "inmemory"`), `retention_period = "30d"`, bound to `127.0.0.1:3100`. (The module runs `loki -verify-config` at build time, so schema typos fail the build, not runtime.)
- **Alloy** — `environment.etc."alloy/config.alloy".source = ./observability/alloy-config.alloy;`, `services.alloy.enable = true;`, and `systemd.services.alloy.serviceConfig.SupplementaryGroups = ["docker"];` (additive with the module's own `["systemd-journal"]`, needed for docker.sock access to discover/tail container logs). Confirmed Docker's default `json-file` logging driver is unmodified in `modules/docker.nix`, which `loki.source.docker` relies on.
- **Grafana** — native, `http_addr = "127.0.0.1"; http_port = 3000;`, `root_url = "https://grafana.welles.app"` (cosmetic — used for links/emails; actual routing happens via the tunnel), admin password from the new sops secret via Grafana's `$__file{...}` file-provider syntax, SMTP settings reusing `msmtp-password` (host `smtp.ionos.de:465`, `startTLS_policy = "NoStartTLS"`, matching the existing `programs.msmtp` config in `services.nix`). `provision.datasources` wires up both Prometheus and Loki (`access = "proxy"`, pointing at `127.0.0.1:9090` / `127.0.0.1:3100`). `provision.alerting.contactPoints` defines one email contact point to `nico@welles.email`.
- **No Caddy virtualHost, no cloudflare-dyndns entry** — unlike the other proxied stacks, Grafana is *not* exposed through Caddy on 80/443. Instead it rides the existing Cloudflare Tunnel already running on this host (`systemd.services.cloudflared-tunnel`), which is "remotely managed" (its ingress rules and Access/SSO policies live in the Cloudflare Zero Trust dashboard, not in this repo's Nix config — confirmed no local ingress config exists for it today). A manual step outside this repo is needed: in the Cloudflare Zero Trust dashboard, add a **Public Hostname** on this tunnel for `grafana.welles.app` → `http://localhost:3000`, and apply the same Access policy (Google-account SSO) already used for the tunnel's other routed services. This keeps Grafana from ever having an unauthenticated public endpoint.

### 5. `hosts/nico-schokoladenelch-nixos/observability/alloy-config.alloy` (new)

River config with four components: `discovery.docker` (enumerate containers via docker.sock) → `discovery.relabel` (attach a clean `container` label) → `loki.source.docker` (tail container logs, forward to Loki) and `loki.source.journal` (tail the host systemd journal, `labels = {job = "systemd-journal"}`, forward to Loki) → `loki.write` (push to `http://127.0.0.1:3100/loki/api/v1/push`).

### 6. Alerting rules (v1, modest — Grafana-native, no Alertmanager)

Three rules against the Prometheus datasource, all routed to the single `email-nico` contact point:
- `PrometheusTargetDown`: `up == 0` for 5m.
- `HostDiskSpaceLow`: `node_filesystem_avail_bytes{fstype!~"tmpfs|overlay"} / node_filesystem_size_bytes < 0.10` for 15m.
- `HostLoadHigh`: `node_load15 / count(node_cpu_seconds_total{mode="idle"}) by (instance) > 1.5` for 15m.

## Ordered steps

1. Create the 3 ZFS datasets on the host (`create-zfs-dataset bucket prometheus|grafana|loki`).
2. Write `observability.nix` + `observability/alloy-config.alloy`.
3. Edit `disk-configuration.nix`, `impermanence.nix`, `sops.nix`, `default.nix`.
4. `sops hosts/nico-schokoladenelch-nixos/secrets.yaml` → add `grafana-admin-password`.
5. `nixos-rebuild build --flake .#nico-schokoladenelch-nixos` — catches eval errors, Loki config-verify, Grafana provisioning-schema errors, before touching the live system.
6. `nixos-rebuild dry-activate --flake .#nico-schokoladenelch-nixos` on the host — sanity-check the activation diff, especially the new bind mount.
7. `nixos-rebuild switch --flake .#nico-schokoladenelch-nixos`.

## Verification

- `systemctl status prometheus grafana loki alloy cadvisor prometheus-node-exporter` — all active.
- `curl -s 127.0.0.1:9100/metrics | head` and `curl -s 127.0.0.1:8080/metrics | head` — exporters alive.
- `curl -s 127.0.0.1:9090/api/v1/targets | jq '.data.activeTargets[] | {job,health}'` — both `node` and `cadvisor` targets `"up"`.
- `curl -s 127.0.0.1:3100/ready` — Loki ready.
- `journalctl -u alloy -f` while restarting a test container — confirm docker.sock connects with no permission errors.
- `curl -G --data-urlencode 'query={container="navidrome"}' 127.0.0.1:3100/loki/api/v1/query_range` and the same for `{job="systemd-journal"}` — confirms logs are actually flowing end-to-end.
- `curl -s 127.0.0.1:3000/api/health` on the host → Grafana healthy locally before touching the tunnel.
- After adding the Public Hostname + Access policy in the Cloudflare Zero Trust dashboard (manual step, not part of this repo's changes): visit `https://grafana.welles.app` from a browser → should redirect through Google SSO / Cloudflare Access before ever reaching Grafana's own login page; confirm an unauthenticated request (e.g. `curl -I https://grafana.welles.app`) gets challenged by Cloudflare Access, not served directly by Grafana. Log in with the sops-provisioned admin password once past Access; Connections → Data sources shows both Prometheus and Loki "working"; try the Explore tab against each.
- `zfs list | grep -E 'prometheus|grafana|loki'` — datasets exist and are growing.
- Restart (not reboot) `prometheus`/`grafana`/`loki` and re-query old time ranges to confirm data survived; then do one real reboot to confirm the new bind mount / impermanence ordering holds.
- Use Grafana's "Test rule" on `HostDiskSpaceLow` to confirm the reused Ionos SMTP path actually delivers to nico@welles.email.
- From off-LAN (e.g. mobile data), confirm ports 9090/8080/9100/3000/3100 all time out/refuse directly against the host — Grafana should only be reachable via the tunnel's `grafana.welles.app` hostname, never by hitting the server's IP/port directly.
