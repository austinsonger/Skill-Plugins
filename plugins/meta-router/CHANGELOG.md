# Changelog

## 1.0.0

- Initial release.
- `@router` sub-agent: picks the best specialist plugin/agent/command for a user request.
- `/skills` slash command: dashboard of installed plugins, chains, active hooks, and last-used timestamps.
- `UserPromptSubmit` hook records slash-command usage to `~/.claude/.skills-plugins-usage.log`.
