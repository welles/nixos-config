# KI-Review für Pull Requests (Claude)

Claude prüft jeden Pull Request mit dem zentralen Reviewer [welles/claude-reviewer](https://github.com/welles/claude-reviewer), einem wiederverwendbaren Workflow, der das [Claude Agent SDK](https://www.npmjs.com/package/@anthropic-ai/claude-agent-sdk) über die Anthropic API nutzt. Bezahlt wird aus dem API-Guthaben des Schlüssels, nicht aus einem Claude-Abo. Ablauf, Sicherheit und Eingaben beschreibt das [README des Reviewers](https://github.com/welles/claude-reviewer#readme); hier steht nur, was für dieses Repo gilt.

- Bei jedem neuen oder aktualisierten PR: ein **Review** mit `claude-opus-5-5`. Ein neuer Push bricht ein laufendes automatisches Review desselben PRs ab.
- Gründlicheres Review auf Wunsch: das Label `claude-review` an den PR setzen. Das läuft einmal mit `claude-fable-5-1` und wird von Pushes nicht abgebrochen. Sobald es gepostet ist, entfernt der Workflow das Label wieder. Schlägt es fehl, bleibt das Label stehen; dann es entfernen und neu setzen.
- Jeder Fund erscheint als Kommentar an der betroffenen Zeile, dazu ein Zusammenfassungs-Kommentar „🤖 Claude-Review“, den jeder Lauf aktualisiert. Gepostet wird als `welles-claude-reviewer[bot]`.
- **Urteil:** Solange ein Fund der Schwere 🔴 Kritisch oder 🟠 Fehler offen ist (sein Thread nicht aufgelöst), verlangt der Reviewer Änderungen, sonst gibt er frei. Behobene Funde löst ein späterer Lauf selbst auf; trifft ein Fund nicht zu, den Thread von Hand auflösen.
- `.github/workflows/claude-review.yml` ruft nur `welles/claude-reviewer/.github/workflows/review.yml@v1` auf. Worauf Claude in diesem Repo achten soll und welche Bereiche es für Funde gibt, steht in `.github/review-instructions.md`.

## Einrichtung

Schon erledigt; zum Nachvollziehen oder für ein neues Repo:

1. Secret `ANTHROPIC_REVIEW_KEY` unter **Settings → Secrets and variables → Actions**: ein API-Schlüssel aus der [Anthropic Console](https://platform.claude.com/).
2. GitHub App `welles-claude-reviewer` (Pull requests: Read and write) auf dem Repo installieren und die Secrets `REVIEWER_APP_CLIENT_ID` und `REVIEWER_APP_KEY` setzen.
3. Label `claude-review` unter **Issues → Labels**.
4. Damit das Urteil einen Merge blockiert: Branch Protection oder Ruleset für `main` mit „Require a pull request before merging“, mindestens einer Freigabe und „Dismiss stale pull request approvals when new commits are pushed“.

## Kosten und Abschalten

Was ein Lauf gekostet hat, steht im Log unter „Claude“ (z. B. „claude-opus-5-5: 8 turns, 0.22 $“); schlägt ein Lauf fehl, steht dort auch der Grund der API (z. B. „Credit balance is too low“). Reviews kleiner PRs kosteten mit Opus 0,14 bis 0,34 $, ein gründliches mit Fable etwa 1,70 $. Ein Lauf bricht nach 60 Schritten oder 5 $ ab.

Abschalten: den Workflow unter **Actions → Claude Review → … → Disable workflow** deaktivieren.
