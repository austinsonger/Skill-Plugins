---
description: Dashboard of installed plugins, chains, active hooks, and last-used timestamps. Optional args, /skills <category>, /skills --unused, /skills --hooks.
---

Run the dashboard script and render its stdout verbatim inside a single fenced code block. Do not summarize, reorder, or add commentary unless the user explicitly asks.

```bash
${CLAUDE_PLUGIN_ROOT}/scripts/skills-dashboard.sh "$@"
```

Argument forwarding:

- `/skills` — full dashboard.
- `/skills <category>` — filter the per-plugin table to that category (e.g. `security`, `blueteam`, `frontend`, `meta`).
- `/skills --unused` — only show plugins with no entry in the usage log.
- `/skills --hooks` — only show plugins that ship a `hooks/hooks.json`.

If the script exits non-zero, print its stderr verbatim and stop — do not try to recreate the dashboard from memory.
