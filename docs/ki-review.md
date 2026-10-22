# KI-Review für Pull Requests (Claude)

Claude prüft jeden Pull Request mit dem [Claude Agent SDK](https://www.npmjs.com/package/@anthropic-ai/claude-agent-sdk) über die Anthropic API und schreibt das Ergebnis in den PR (auf Deutsch). Bezahlt wird aus dem monatlichen Aktionsguthaben der Anthropic-Organisation, das sich dieses Repo mit stamm-phoenix/website-astro und stamm-phoenix/playwright-api teilt. Das Aktionsguthaben gilt für Agent SDK und API, aber nicht für Claude Code; deshalb läuft das Review nicht über `anthropics/claude-code-action`.

- Bei jedem neuen oder aktualisierten PR: ein **Review** mit `claude-opus-5-5`. Ein neuer Push bricht ein laufendes automatisches Review desselben PRs ab.
- Gründlicheres Review auf Wunsch: das Label `claude-review` an den PR setzen. Das läuft einmal mit `claude-fable-5-1` und wird von Pushes nicht abgebrochen. Sobald es gepostet ist, entfernt der Workflow das Label wieder; für ein weiteres gründliches Review es erneut setzen. Schlägt es fehl, bleibt das Label stehen; dann es entfernen und neu setzen.
- Jeder Fund erscheint als Kommentar an der betroffenen Zeile (Schwere 🔴 Kritisch, 🟠 Fehler oder 🟡 Hinweis, Bereich, Begründung, bei eindeutigen Lösungen ein Vorschlag zum Übernehmen und ein „Prompt für KI-Agenten“), dazu ein Zusammenfassungs-Kommentar „🤖 Claude-Review“, den jeder Lauf aktualisiert. Die Kommentare kommen von `github-actions` und blockieren keinen Merge.
- Claude darf nur lesen (`Read`, `Grep`, `Glob`), und zwar nur den ausgecheckten Stand und die Dateien vom PR; ein Hook lehnt jeden anderen Pfad ab. Es hat keine Shell, kein Netz und keine Schreibrechte auf GitHub und lädt keine Einstellungen, Hooks oder MCP-Server aus dem Repo (`.claude/`, `.mcp.json`). Gepostet wird in einem eigenen Job. PRs aus Forks und von Bots werden nicht geprüft.
- Workflow `.github/workflows/claude-review.yml` und Skript `.github/scripts/claude-review.mjs` sind dieselben wie in website-astro und playwright-api; Änderungen dort nachziehen. Was nur für dieses Repo gilt (worauf Claude achten soll, Bereiche der Funde), steht in `.github/review-instructions.md`.

## Einrichtung

1. Secret `ANTHROPIC_REVIEW_KEY` unter **Settings → Secrets and variables → Actions**: ein API-Schlüssel aus der Organisation mit dem Aktionsguthaben in der [Anthropic Console](https://platform.claude.com/).
2. Label `claude-review` unter **Issues → Labels**.

## Kosten und Abschalten

Was ein Lauf gekostet hat, steht im Log unter „Claude“ (z. B. „claude-opus-5-5: 8 turns, 0.22 $“); schlägt ein Lauf fehl, steht dort auch der Grund der API (z. B. „Credit balance is too low“). In den anderen Repos kosteten Reviews kleiner PRs mit Opus 0,14 bis 0,34 $, ein gründliches mit Fable etwa 1,70 $. Ein Lauf bricht nach 60 Schritten oder 5 $ ab. Ist das Guthaben aufgebraucht, schlagen die Reviews bis zum nächsten Monat fehl.

Abschalten: den Workflow unter **Actions → Claude Review → … → Disable workflow** deaktivieren.
