#!/bin/bash
# ============================================================================
# Skills Plugins Uninstaller
# Removes installed slash commands from ~/.claude/commands/ and/or
# agent skills from ~/.agents/skills/.
# ============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGINS_DIR="$SCRIPT_DIR/plugins"
CLAUDE_COMMANDS_DIR="$HOME/.claude/commands"
AGENTS_SKILLS_DIR="$HOME/.agents/skills"

# Target: "claude", "agents", or "both" (default)
TARGET="${1:-both}"
case "$TARGET" in
    --target|-t) TARGET="$2" ;;
esac
case "$TARGET" in
    claude|agents|both) ;;
    *) TARGET="both" ;;
esac

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${CYAN}${BOLD}"
echo "  ╔══════════════════════════════════════════════════════╗"
echo "  ║           Skills Plugins Uninstaller                 ║"
echo "  ╚══════════════════════════════════════════════════════╝"
echo -e "${NC}"

REMOVED=0

for dir in "$PLUGINS_DIR"/*/; do
    plugin_name=$(basename "$dir")

    # Skill-rooted plugin: claude target installs as <plugin>.md, agents as full dir
    if [ -f "$dir/SKILL.md" ]; then
        if [ "$TARGET" = "claude" ] || [ "$TARGET" = "both" ]; then
            if [ -f "$CLAUDE_COMMANDS_DIR/$plugin_name.md" ]; then
                rm "$CLAUDE_COMMANDS_DIR/$plugin_name.md"
                echo -e "${RED}  [-] Removed (claude): $plugin_name.md${NC}"
                REMOVED=$((REMOVED + 1))
            fi
        fi
        if [ "$TARGET" = "agents" ] || [ "$TARGET" = "both" ]; then
            if [ -d "$AGENTS_SKILLS_DIR/$plugin_name" ]; then
                rm -rf "$AGENTS_SKILLS_DIR/$plugin_name"
                echo -e "${RED}  [-] Removed (agents): $plugin_name/${NC}"
                REMOVED=$((REMOVED + 1))
            fi
        fi
    fi

    # Subcommands (legacy + any skill plugin with commands/)
    for cmd in "$dir/commands/"*.md; do
        [ -f "$cmd" ] || continue
        filename=$(basename "$cmd")
        skill_name=$(basename "$filename" .md)
        if [ "$TARGET" = "claude" ] || [ "$TARGET" = "both" ]; then
            if [ -f "$CLAUDE_COMMANDS_DIR/$filename" ]; then
                rm "$CLAUDE_COMMANDS_DIR/$filename"
                echo -e "${RED}  [-] Removed (claude): $filename${NC}"
                REMOVED=$((REMOVED + 1))
            fi
        fi
        if [ "$TARGET" = "agents" ] || [ "$TARGET" = "both" ]; then
            if [ -d "$AGENTS_SKILLS_DIR/$skill_name" ]; then
                rm -rf "$AGENTS_SKILLS_DIR/$skill_name"
                echo -e "${RED}  [-] Removed (agents): $skill_name/${NC}"
                REMOVED=$((REMOVED + 1))
            fi
        fi
    done
done

echo ""
if [ $REMOVED -gt 0 ]; then
    echo -e "${GREEN}[+] Uninstalled $REMOVED command(s) successfully.${NC}"
else
    echo -e "${YELLOW}[*] No installed commands found to remove.${NC}"
fi
