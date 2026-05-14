# Changelog

All notable changes to this plugin will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-05-13

### Added
- Initial release.
- `/audit-prep` slash command: auditor Q&A simulator that drills the user with
  framework-specific questions (SOC 2, ISO 27001, PCI, HIPAA, FedRAMP, NIST 800-53),
  scores answers against an auditor rubric, and emits a Markdown transcript with
  reusable strong-answer library, weakness hit-list, and evidence gaps.
- Difficulty levels (friendly / standard / hostile), role selection
  (Control Owner / CISO / Engineer / Compliance Lead), argument short-circuit
  (`/audit-prep <framework> <scope> <difficulty> [count]`), and in-session
  `resume` keyword.
