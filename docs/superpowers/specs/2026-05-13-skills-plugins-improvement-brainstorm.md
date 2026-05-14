# Skills Plugins — Improvement Brainstorm

**Date:** 2026-05-13
**Repo:** Skills Plugins (60 plugins, dual-target installer: Claude Code commands + Agent Skills)
**Status:** Brainstorm — not yet a design spec. Pick items to promote into specs.

---

## Context Snapshot

- 60 plugins under `plugins/`, two layouts: legacy (`commands/*.md` only) and skill-rooted (`SKILL.md` + optional `commands/`, `references/`, `examples/`, `scripts/`, `assets/`).
- Install via `install.sh` with `--target claude|agents|both`, category filters, interactive mode.
- No hooks, no sub-agents, no MCP servers, no CI, no eval harness, no schema validation. Just markdown prompts + bash installer.

---

## A. Reach / Adoption

1. **Claude Code plugin marketplace manifest** — Publish `.claude-plugin/marketplace.json` so users get `/plugin marketplace add austinsonger/skills-plugins` and per-plugin one-click install with auto-updates. Replaces most of `install.sh` for the Claude target.
2. **Per-plugin "30-second demo" transcripts** — Real captured `claude` session showing input → output for each plugin. READMEs currently describe; demos prove.
3. **Searchable index site (GitHub Pages)** — Filter by category, tech, target, with copy-paste install snippet per plugin. 60 plugins is past the readable-table threshold.
4. **Plugin capability badges** — `[claude-code] [agents] [mcp] [hooks] [scripts]` on each row so users see at a glance which surface area a plugin actually uses.

## B. Quality / Trust

5. **SKILL.md linter + schema validator** — Check frontmatter presence, description length, dead `references/` links, oversized SKILL.md files. Runs in CI on every PR.
6. **Eval harness for prompts** — `tests/` per plugin with input scenarios and rubric assertions ("must mention X", "must refuse Y", "must produce structured output Z"). Critical for security plugins where wrong advice = harmful advice.
7. **Per-plugin versioning** — `version:` in frontmatter + `CHANGELOG.md`. Installer warns on downgrade and shows "updated since last install."
8. **Provenance / signing** — `sha256sum` manifest so users verify they're running the prompt you shipped. Especially relevant for security plugins.
9. **Cross-plugin consistency audit** — 60 plugins authored at different times have drifted. A "stylebot" pass flags inconsistent output structures, vocabulary, headings across plugin families (all `pentest-*`, all `blue-team-*`).

## C. Power / Capability (highest leverage)

10. **Hooks** — Claude Code supports `PreToolUse`, `PostToolUse`, `Stop`, `UserPromptSubmit`. Big wins:
    - `secure-code-review`: `PostToolUse` on Edit/Write → auto-scan diffs.
    - `hallucination-guard`: `PreToolUse` on Bash → block commands referencing invented paths.
    - `token-tracker`: `Stop` → log usage automatically.
    - `memory-vault` / `context-keeper`: `Stop` → persist session summary.
    These plugins exist as commands but are 5× more valuable as hooks. Ship both.
11. **Sub-agents (`.claude/agents/`)** — Pentest, malware analysis, code review, threat modeling work better as named sub-agents (`@pentest-ad`) than slash commands because Claude can delegate without losing main-thread context. Add `agents/` to the plugin layout; installer emits `.claude/agents/<name>.md`.
12. **MCP servers for security plugins** — `pentest-toolkit`, `pentest-network`, `cve-search`, `vuln-research`, `api-security` benefit from real MCP servers running tools (nmap, nuclei, CVE API) rather than prompting Claude to describe what to run. Ship one reference server (`mcp-cve-lookup`) to set the pattern.
13. **Plugin composition / chaining** — `chains_to: [pentest-report]` in frontmatter so finishing `/pentest-web` auto-suggests `/pentest-report`. Surface workflows users currently have to discover themselves.
14. **Bundled executable scripts** — Skill-rooted layout supports `scripts/` but most plugins ship none. Add real ones: `pentest-ad/scripts/bloodhound-collect.sh`, `compliance-evidence-gen/scripts/aws-evidence-pull.py`. Agent Skills' power is prompt + tools, not prompt alone.

## D. Maintainer Ergonomics

15. **Plugin scaffolder** — `./scripts/new-plugin.sh <name> <category>` generates directory, SKILL.md frontmatter, commands/, README block, and registers in `install.sh` category list.
16. **Auto-generated README plugin table** — Generate from plugin frontmatter so adding/renaming updates docs automatically. Pairs with #15.
17. **CI matrix** — Install on Linux + macOS, against `claude`, `agents`, `both` targets. `install.sh` has surface area; silent breakage kills adoption.
18. **`install.sh --dry-run` and `--diff`** — Show what would change before changing it. Especially for `--update`, which can overwrite local edits silently.
19. **"Install report"** — After install, summarize: installed N, conflicts skipped M, updated since last run K. Currently mostly silent on success.

---

## Top 5 If Forced to Pick

| # | Item | Bucket | Why |
|---|---|---|---|
| 1 | Marketplace manifest | Adoption | One-click install kills the bash-script tax |
| 5 | SKILL.md linter | Trust | Catches drift before it ships |
| 6 | Eval harness | Trust | Differentiates from "collection of prompts" |
| 10 | Hooks for obvious plugins | Capability | Several plugins are wrong shape today |
| 15 + 16 | Scaffolder + auto-gen table | Ergonomics | Makes plugin 61 easy instead of a chore |

---

## Next Step

Pick one (or a bundle) to promote into a real design spec. Candidates I'd recommend graduating first:

- **#1 marketplace manifest** — small, fast, immediate adoption win
- **#10 hooks** — biggest capability jump for plugins you've already written
- **#5 + #6 linter + evals** — establishes the quality bar before the repo grows past 60
