# Worauf das KI-Review achtet

Anweisungen für das Claude-Review (`.github/workflows/claude-review.yml`, Einrichtung in `docs/ki-review.md`). Der Workflow und das Skript `.github/scripts/claude-review.mjs` sind dieselben wie in stamm-phoenix/website-astro und stamm-phoenix/playwright-api; was nur für dieses Repo gilt, steht hier.

## Projekt

Die NixOS-Konfiguration als Flake für mehrere Rechner: `hosts/` beschreibt einzelne Rechner, `bundles/` sind benannte Listen von Imports, `modules/` sind wiederverwendbare Bausteine; Secrets liegen verschlüsselt mit sops in `secrets.yaml`. Die Regeln stehen in `AGENTS.md`.

## Besonders prüfen

- Abhängigkeiten zeigen nur nach unten: Module importieren keine Bundles und nichts aus `hosts/`, Bundles nichts aus `hosts/`; Bundles enthalten nur `imports`.
- Hosts enthalten nur, was sich nicht abstrahieren lässt (Imports, `_module.args`, wenige Skalare, Hardware- und Disk-Dateien); Logik, Dienste, Pakete oder Persistenz gehören in ein Modul.
- Module sind vollständig: Pakete, Dienste, Firewall, Nutzer, Secrets und Persistenz kommen aus dem Modul selbst; host-spezifische Werte (Nutzer, Pfade, Pools, E-Mails, Schlüssel) kommen über Modul-Argumente, nie fest eingetragen.
- Persistenz für Impermanence: jedes Modul legt seinen Zustand ab, geschützt mit `lib.mkIf (persistRoot != null)`, so eng wie möglich, kein Pfad doppelt persistiert; neue Pakete mit Zustand ohne Persistenz sind ein Fund.
- Secrets: keine Klartext-Geheimnisse (Passwörter, Tokens, private Schlüssel) in `.nix`-Dateien oder unverschlüsselt im Repo; Secrets mit Besitzer und Rechten deklariert.
- Sicherheit der Rechner: offene Ports, Dienste ohne Authentifizierung, `sudo`- und SSH-Einstellungen, Firewall-Regeln.
- Ein Fehler, durch den eine Konfiguration nicht mehr baut oder ein Rechner nach dem Umschalten nicht mehr startet (fehlende Imports, falsche Optionen, Disk-Layout), ist mindestens `fehler`.

## Hinweise

`hinweis` sind z. B. Verstöße gegen die Architekturregeln in `AGENTS.md`, unnötig weite Persistenz und kleine Risiken.

## Bereiche

Sicherheit, Funktion, Daten, Architektur, Persistenz, Projektregeln, Betrieb
