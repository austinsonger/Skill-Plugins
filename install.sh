#!/bin/bash
# ============================================================================
# Skills Plugins Installer v2.0
# Installs Claude Code custom slash commands for advanced development,
# security and compliance, game dev, and productivity workflows.
#
# Compatible with Bash 3.2+ (macOS default) and Linux.
#
# Usage:
#   ./install.sh                       Install all plugins
#   ./install.sh --category security   Install by category
#   ./install.sh --interactive         Choose plugins interactively
#   ./install.sh --help                Show all options
# ============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGINS_DIR="$SCRIPT_DIR/plugins"
CLAUDE_COMMANDS_DIR="$HOME/.claude/commands"
AGENTS_SKILLS_DIR="$HOME/.agents/skills"

# Install target: "claude" (default), "agents", or "both"
TARGET="claude"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'

# Category → plugin mapping (bash 3.2 compatible)
get_category_plugins() {
    case "$1" in
        backend)      echo "backend-architect" ;;
        frontend)     echo "frontend-forge frontend-animations frontend-dom frontend-3d frontend-perf frontend-micro" ;;
        security)     echo "red-team-ops pentest-toolkit pentest-network pentest-mobile pentest-cloud pentest-wireless pentest-ad pentest-social pentest-report exploit-dev api-security secure-code-review threat-modeler crypto-analysis vuln-research supply-chain-sec devsecops" ;;
        blueteam)     echo "blue-team-soc blue-team-dfir blue-team-malware-analysis blue-team-siem blue-team-threat-intel blue-team-hardening blue-team-network-defense blue-team-edr" ;;
        reverse)      echo "reverse-binary reverse-malware reverse-protocol reverse-firmware reverse-obfuscation" ;;
        gamedev)      echo "gamedev-unity gamedev-unreal gamedev-threejs gamedev-godot gamedev-design" ;;
        productivity) echo "memory-vault context-manager context-keeper hallucination-guard token-tracker" ;;
        systems)      echo "os-internals cloud-security" ;;
        compliance)   echo "security-compliance-scrms security-compliance-scrms-pdca security-compliance-soc2-internal-audit security-compliance-iso27001-audit-findings security-compliance-vendor-risk-assessment security-compliance-control-narrative-writer security-compliance-control-statement-enhancer security-compliance-control-testing-worksheet security-compliance-inheritance-matrix-builder security-compliance-compliance-evidence-gen security-compliance-compliance-evidence-guide" ;;
        *)            echo "" ;;
    esac
}

ALL_CATEGORIES="backend frontend gamedev security blueteam reverse productivity systems compliance"

show_banner() {
    echo -e "${CYAN}${BOLD}"
    echo "  ╔══════════════════════════════════════════════════════════╗"
    echo "  ║             Skills Plugins Installer v2.0                ║"
    echo "  ║                                                          ║"
    echo "  ║   Security · Red Team · Blue Team · Reverse Engineering  ║"
    echo "  ║   Game Dev · Backend · Frontend · AI Productivity        ║"
    echo "  ╚══════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

show_help() {
    show_banner
    echo -e "${BOLD}USAGE${NC}"
    echo "  ./install.sh [OPTIONS]"
    echo ""
    echo -e "${BOLD}OPTIONS${NC}"
    echo -e "  ${CYAN}--help, -h${NC}              Show this help message"
    echo -e "  ${CYAN}--list, -l${NC}              List all plugins and their commands"
    echo -e "  ${CYAN}--force, -f${NC}             Overwrite existing commands"
    echo -e "  ${CYAN}--plugin, -p NAME${NC}       Install specific plugin(s)"
    echo -e "  ${CYAN}--category, -c NAME${NC}     Install all plugins in a category"
    echo -e "  ${CYAN}--interactive, -i${NC}       Choose categories interactively"
    echo -e "  ${CYAN}--uninstall, -u${NC}         Remove all installed commands"
    echo -e "  ${CYAN}--status, -s${NC}            Show installed vs available plugins"
    echo -e "  ${CYAN}--update${NC}                Update all installed plugins"
    echo -e "  ${CYAN}--target, -t TARGET${NC}     Install target: claude | agents | both (default: claude)"
    echo ""
    echo -e "${BOLD}TARGETS${NC}"
    echo -e "  ${MAGENTA}claude${NC}   ~/.claude/commands/         (Claude Code slash commands)"
    echo -e "  ${MAGENTA}agents${NC}   ~/.agents/skills/<name>/    (Agent Skills format — SKILL.md w/ frontmatter)"
    echo -e "  ${MAGENTA}both${NC}     install to both locations"
    echo ""
    echo -e "${BOLD}CATEGORIES${NC}"
    echo -e "  ${MAGENTA}backend${NC}       Backend architecture, API design, database optimization"
    echo -e "  ${MAGENTA}frontend${NC}      Components, animations, DOM, 3D, performance, micro-frontends"
    echo -e "  ${MAGENTA}gamedev${NC}       Unity (C#), Unreal Engine (C++), Three.js, Godot, game design"
    echo -e "  ${MAGENTA}security${NC}      Red team, pentest, exploit dev, API security, DevSecOps"
    echo -e "  ${MAGENTA}blueteam${NC}      SOC, DFIR, malware analysis, SIEM, threat intel, hardening, EDR"
    echo -e "  ${MAGENTA}reverse${NC}       Binary RE, malware RE, protocol RE, firmware, deobfuscation"
    echo -e "  ${MAGENTA}productivity${NC}  Memory, context management, hallucination guard"
    echo -e "  ${MAGENTA}systems${NC}       OS internals, cloud security"
    echo -e "  ${MAGENTA}compliance${NC}    SCRMS, SOC 2, ISO 27001, vendor risk, control narratives, audits"
    echo ""
    echo -e "${BOLD}EXAMPLES${NC}"
    echo "  ./install.sh                                  # Install everything"
    echo "  ./install.sh -c security                      # All security plugins"
    echo "  ./install.sh -c gamedev -c frontend            # Game dev + frontend"
    echo "  ./install.sh -p gamedev-unity -p gamedev-unreal # Specific plugins"
    echo "  ./install.sh -i                                # Interactive picker"
    echo "  ./install.sh -s                                # Check what's installed"
    echo "  ./install.sh --update                          # Update all installed"
    echo ""
    echo -e "${BOLD}HOW IT WORKS${NC}"
    echo "  Plugins install as custom slash commands in Claude Code."
    echo "  They are copied to: ${CYAN}~/.claude/commands/${NC}"
    echo ""
    echo "  After install, open Claude Code and type ${CYAN}/<command>${NC} to use."
    echo "  Example: ${CYAN}/gamedev-unity build a character controller with wall jump${NC}"
    echo ""
    echo -e "${BOLD}PREREQUISITES${NC}"
    echo "  - Claude Code CLI: npm install -g @anthropic-ai/claude-code"
    echo "  - Bash shell (macOS, Linux, WSL)"
    echo ""
}

# Extract a short description from a command markdown file.
# Strategy: first non-heading, non-empty paragraph line after the H1.
# Falls back to the H1 itself (with " Plugin" stripped).
extract_description() {
    local src="$1"
    local desc
    desc=$(awk '
        /^# / && !seen { seen=1; next }
        seen && NF && !/^#/ { print; exit }
    ' "$src")
    if [ -z "$desc" ]; then
        desc=$(head -n 1 "$src" | sed 's/^#* *//' | sed 's/ Plugin$//')
    fi
    # Truncate to ~200 chars and escape double quotes for YAML
    echo "$desc" | cut -c1-200 | sed 's/"/\\"/g'
}

# Install one .md as an Agent Skill: ~/.agents/skills/<skill-name>/SKILL.md
# with YAML frontmatter (name, description) prepended.
install_as_agent_skill() {
    local src="$1"
    local skill_name
    skill_name=$(basename "$src" .md)
    local skill_dir="$AGENTS_SKILLS_DIR/$skill_name"
    local dest="$skill_dir/SKILL.md"

    if [ -f "$dest" ] && [ "$FORCE" != "true" ]; then
        SKIPPED=$((SKIPPED + 1))
        return 1
    fi

    mkdir -p "$skill_dir"
    local description
    description=$(extract_description "$src")

    {
        echo "---"
        echo "name: $skill_name"
        echo "description: \"$description\""
        echo "---"
        echo ""
        cat "$src"
    } > "$dest"
    return 0
}

# Detect plugin layout. Echos "skill" if plugins/<name>/SKILL.md exists,
# "legacy" if plugins/<name>/commands/*.md exists, "none" otherwise.
detect_layout() {
    local plugin_name="$1"
    if [ -f "$PLUGINS_DIR/$plugin_name/SKILL.md" ]; then
        echo "skill"
    elif [ -d "$PLUGINS_DIR/$plugin_name/commands" ]; then
        echo "legacy"
    else
        echo "none"
    fi
}

# Strip YAML frontmatter from a file and echo body to stdout.
strip_frontmatter() {
    awk 'BEGIN{fm=0} NR==1 && /^---[[:space:]]*$/ {fm=1; next} fm==1 && /^---[[:space:]]*$/ {fm=2; next} fm!=1 {print}' "$1"
}

# Map a file extension to a fenced-code-block language hint.
fence_lang_for() {
    case "$1" in
        *.py) echo "python" ;;
        *.sh|*.bash) echo "bash" ;;
        *.js) echo "javascript" ;;
        *.ts) echo "typescript" ;;
        *.rb) echo "ruby" ;;
        *.go) echo "go" ;;
        *.rs) echo "rust" ;;
        *.json) echo "json" ;;
        *.yaml|*.yml) echo "yaml" ;;
        *.toml) echo "toml" ;;
        *.sql) echo "sql" ;;
        *.md) echo "" ;;
        *) echo "" ;;
    esac
}

# Build a single inlined slash-command file for a skill-rooted plugin.
# Concatenates SKILL.md body + references/ + examples/ + scripts/ so that
# claude-target installs retain supporting content.
build_inlined_skill() {
    local plugin_dir="$1"
    local dest="$2"

    {
        strip_frontmatter "$plugin_dir/SKILL.md"

        # References (markdown — inline directly)
        if [ -d "$plugin_dir/references" ]; then
            local first=1
            for ref in "$plugin_dir/references"/*; do
                [ -f "$ref" ] || continue
                if [ $first -eq 1 ]; then
                    echo ""
                    echo "---"
                    echo ""
                    echo "## References"
                    first=0
                fi
                echo ""
                echo "### $(basename "$ref")"
                echo ""
                local lang
                lang=$(fence_lang_for "$ref")
                if [ -z "$lang" ]; then
                    cat "$ref"
                else
                    echo "\`\`\`$lang"
                    cat "$ref"
                    echo "\`\`\`"
                fi
            done
        fi

        # Examples
        if [ -d "$plugin_dir/examples" ]; then
            local first=1
            for ex in "$plugin_dir/examples"/*; do
                [ -f "$ex" ] || continue
                if [ $first -eq 1 ]; then
                    echo ""
                    echo "---"
                    echo ""
                    echo "## Examples"
                    first=0
                fi
                echo ""
                echo "### $(basename "$ex")"
                echo ""
                local lang
                lang=$(fence_lang_for "$ex")
                if [ -z "$lang" ]; then
                    cat "$ex"
                else
                    echo "\`\`\`$lang"
                    cat "$ex"
                    echo "\`\`\`"
                fi
            done
        fi

        # Scripts (always fenced)
        if [ -d "$plugin_dir/scripts" ]; then
            local first=1
            for s in "$plugin_dir/scripts"/*; do
                [ -f "$s" ] || continue
                if [ $first -eq 1 ]; then
                    echo ""
                    echo "---"
                    echo ""
                    echo "## Scripts"
                    first=0
                fi
                echo ""
                echo "### $(basename "$s")"
                echo ""
                local lang
                lang=$(fence_lang_for "$s")
                [ -z "$lang" ] && lang="text"
                echo "\`\`\`$lang"
                cat "$s"
                echo "\`\`\`"
            done
        fi

        # Assets — list only (may include large/binary files). Note the path
        # so a user can find them on disk inside the cloned repo.
        if [ -d "$plugin_dir/assets" ]; then
            local first=1
            for a in "$plugin_dir/assets"/*; do
                [ -f "$a" ] || continue
                if [ $first -eq 1 ]; then
                    echo ""
                    echo "---"
                    echo ""
                    echo "## Assets"
                    echo ""
                    echo "Bundled assets (use the agents-target install to get the actual files):"
                    echo ""
                    first=0
                fi
                local size
                size=$(wc -c < "$a" | tr -d ' ')
                echo "- \`$(basename "$a")\` (${size} bytes)"
            done
        fi
    } > "$dest"
}

# Install a Skill-rooted plugin. Returns 0 if anything was installed.
install_skill_plugin() {
    local plugin_name="$1"
    local plugin_dir="$PLUGINS_DIR/$plugin_name"
    local did_install=0
    TOTAL=$((TOTAL + 1))

    # claude target: inline SKILL + resources into one slash command, plus any commands/*.md
    if [ "$TARGET" = "claude" ] || [ "$TARGET" = "both" ]; then
        local main_dest="$CLAUDE_COMMANDS_DIR/${plugin_name}.md"
        if [ -f "$main_dest" ] && [ "$FORCE" != "true" ]; then
            SKIPPED=$((SKIPPED + 1))
        else
            build_inlined_skill "$plugin_dir" "$main_dest"
            did_install=1
        fi

        if [ -d "$plugin_dir/commands" ]; then
            for cmd_file in "$plugin_dir/commands"/*.md; do
                [ -f "$cmd_file" ] || continue
                local fname=$(basename "$cmd_file")
                if [ -f "$CLAUDE_COMMANDS_DIR/$fname" ] && [ "$FORCE" != "true" ]; then
                    SKIPPED=$((SKIPPED + 1))
                else
                    cp "$cmd_file" "$CLAUDE_COMMANDS_DIR/$fname"
                    did_install=1
                fi
            done
        fi
    fi

    # agents target: copy the entire plugin directory to ~/.agents/skills/<name>/
    if [ "$TARGET" = "agents" ] || [ "$TARGET" = "both" ]; then
        local skill_dest="$AGENTS_SKILLS_DIR/$plugin_name"
        if [ -d "$skill_dest" ] && [ "$FORCE" != "true" ]; then
            SKIPPED=$((SKIPPED + 1))
        else
            rm -rf "$skill_dest"
            cp -R "$plugin_dir" "$skill_dest"
            did_install=1
        fi
    fi

    if [ $did_install -eq 1 ]; then
        INSTALLED=$((INSTALLED + 1))
        return 0
    fi
    return 1
}

install_plugin() {
    local plugin_name="$1"
    local layout
    layout=$(detect_layout "$plugin_name")

    case "$layout" in
        skill)
            if install_skill_plugin "$plugin_name"; then
                echo -e "${GREEN}  [+] $plugin_name${NC} — skill"
            fi
            return
            ;;
        none)
            echo -e "${RED}  [-] Plugin not found: $plugin_name${NC}"
            return 1
            ;;
    esac

    # legacy layout: plugins/<name>/commands/*.md
    local plugin_dir="$PLUGINS_DIR/$plugin_name/commands"
    local count=0
    for cmd_file in "$plugin_dir"/*.md; do
        [ -f "$cmd_file" ] || continue
        local filename=$(basename "$cmd_file")
        TOTAL=$((TOTAL + 1))
        local did_install=0

        if [ "$TARGET" = "claude" ] || [ "$TARGET" = "both" ]; then
            if [ -f "$CLAUDE_COMMANDS_DIR/$filename" ] && [ "$FORCE" != "true" ]; then
                SKIPPED=$((SKIPPED + 1))
            else
                cp "$cmd_file" "$CLAUDE_COMMANDS_DIR/$filename"
                did_install=1
            fi
        fi

        if [ "$TARGET" = "agents" ] || [ "$TARGET" = "both" ]; then
            if install_as_agent_skill "$cmd_file"; then
                did_install=1
            fi
        fi

        if [ $did_install -eq 1 ]; then
            count=$((count + 1))
            INSTALLED=$((INSTALLED + 1))
        fi
    done

    if [ $count -gt 0 ]; then
        echo -e "${GREEN}  [+] $plugin_name${NC} — $count command(s)"
    fi
}

install_category() {
    local category="$1"
    local plugins=$(get_category_plugins "$category")

    if [ -z "$plugins" ]; then
        echo -e "${RED}  [-] Unknown category: $category${NC}"
        echo -e "  Available: ${MAGENTA}$ALL_CATEGORIES${NC}"
        return 1
    fi

    echo -e "${BLUE}  ┌─ ${BOLD}$category${NC}"
    for plugin in $plugins; do
        echo -n "  │ "
        install_plugin "$plugin"
    done
    echo -e "${BLUE}  └─ done${NC}"
    echo ""
}

show_list() {
    show_banner
    echo -e "${BOLD}Available Plugins by Category:${NC}"
    echo ""

    for category in $ALL_CATEGORIES; do
        local plugins=$(get_category_plugins "$category")
        local total_cmds=0

        for plugin in $plugins; do
            local layout=$(detect_layout "$plugin")
            if [ "$layout" = "legacy" ]; then
                local cmd_count=$(ls -1 "$PLUGINS_DIR/$plugin/commands/"*.md 2>/dev/null | wc -l | tr -d ' ')
                total_cmds=$((total_cmds + cmd_count))
            elif [ "$layout" = "skill" ]; then
                total_cmds=$((total_cmds + 1))
                if [ -d "$PLUGINS_DIR/$plugin/commands" ]; then
                    local cmd_count=$(ls -1 "$PLUGINS_DIR/$plugin/commands/"*.md 2>/dev/null | wc -l | tr -d ' ')
                    total_cmds=$((total_cmds + cmd_count))
                fi
            fi
        done

        echo -e "${MAGENTA}${BOLD}  [$category]${NC} ${DIM}($total_cmds commands)${NC}"
        for plugin in $plugins; do
            local layout=$(detect_layout "$plugin")
            [ "$layout" = "none" ] && continue
            echo -e "    ${CYAN}$plugin${NC} ${DIM}[$layout]${NC}"

            if [ "$layout" = "skill" ]; then
                if [ -f "$CLAUDE_COMMANDS_DIR/$plugin.md" ]; then
                    echo -e "      └─ ${GREEN}/$plugin${NC} ${DIM}(installed)${NC}"
                else
                    echo -e "      └─ /$plugin"
                fi
            fi

            if [ -d "$PLUGINS_DIR/$plugin/commands" ]; then
                for cmd in "$PLUGINS_DIR/$plugin/commands/"*.md; do
                    if [ -f "$cmd" ]; then
                        local cmd_name=$(basename "$cmd" .md)
                        if [ -f "$CLAUDE_COMMANDS_DIR/$cmd_name.md" ]; then
                            echo -e "      └─ ${GREEN}/$cmd_name${NC} ${DIM}(installed)${NC}"
                        else
                            echo -e "      └─ /$cmd_name"
                        fi
                    fi
                done
            fi
        done
        echo ""
    done
}

show_status() {
    show_banner
    local installed_count=0
    local total_count=0

    echo -e "${BOLD}Installation Status:${NC}"
    echo ""

    for category in $ALL_CATEGORIES; do
        local plugins=$(get_category_plugins "$category")
        local cat_installed=0
        local cat_total=0

        for plugin in $plugins; do
            local layout=$(detect_layout "$plugin")
            if [ "$layout" = "skill" ]; then
                cat_total=$((cat_total + 1))
                total_count=$((total_count + 1))
                if [ -f "$CLAUDE_COMMANDS_DIR/$plugin.md" ]; then
                    cat_installed=$((cat_installed + 1))
                    installed_count=$((installed_count + 1))
                fi
            fi
            if [ -d "$PLUGINS_DIR/$plugin/commands" ]; then
                for cmd in "$PLUGINS_DIR/$plugin/commands/"*.md; do
                    if [ -f "$cmd" ]; then
                        cat_total=$((cat_total + 1))
                        total_count=$((total_count + 1))
                        local filename=$(basename "$cmd")
                        if [ -f "$CLAUDE_COMMANDS_DIR/$filename" ]; then
                            cat_installed=$((cat_installed + 1))
                            installed_count=$((installed_count + 1))
                        fi
                    fi
                done
            fi
        done

        if [ $cat_installed -eq $cat_total ] && [ $cat_total -gt 0 ]; then
            echo -e "  ${GREEN}[ok]${NC} ${BOLD}$category${NC} — $cat_installed/$cat_total commands"
        elif [ $cat_installed -gt 0 ]; then
            echo -e "  ${YELLOW}[~~]${NC} ${BOLD}$category${NC} — $cat_installed/$cat_total commands"
        else
            echo -e "  ${RED}[  ]${NC} ${BOLD}$category${NC} — $cat_installed/$cat_total commands"
        fi
    done

    echo ""
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "  Total: ${GREEN}$installed_count${NC} / $total_count commands installed"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

interactive_install() {
    show_banner
    echo -e "${BOLD}Select categories to install:${NC}"
    echo ""
    echo -e "  ${CYAN}1${NC}) ${MAGENTA}backend${NC}        — Backend architecture, APIs, database"
    echo -e "  ${CYAN}2${NC}) ${MAGENTA}frontend${NC}       — Components, animations, DOM, 3D, perf"
    echo -e "  ${CYAN}3${NC}) ${MAGENTA}gamedev${NC}        — Unity, Unreal, Three.js, Godot, design"
    echo -e "  ${CYAN}4${NC}) ${MAGENTA}security${NC}       — Red team, pentest, exploit dev, AppSec"
    echo -e "  ${CYAN}5${NC}) ${MAGENTA}blueteam${NC}       — SOC, DFIR, SIEM, threat intel, EDR"
    echo -e "  ${CYAN}6${NC}) ${MAGENTA}reverse${NC}        — Binary, malware, protocol, firmware RE"
    echo -e "  ${CYAN}7${NC}) ${MAGENTA}productivity${NC}   — Memory, context keeper, hallucination guard"
    echo -e "  ${CYAN}8${NC}) ${MAGENTA}systems${NC}        — OS internals, cloud security"
    echo -e "  ${CYAN}9${NC}) ${MAGENTA}compliance${NC}     — SCRMS, SOC 2, ISO 27001, vendor risk, audits"
    echo -e "  ${CYAN}A${NC}) ${GREEN}ALL${NC}            — Install everything"
    echo ""
    echo -e "  Enter choices (comma-separated, e.g. ${BOLD}3,4,5${NC} or ${BOLD}A${NC} for all):"
    echo -n "  > "
    read -r choices

    if [ "$choices" = "A" ] || [ "$choices" = "a" ]; then
        echo ""
        for category in $ALL_CATEGORIES; do
            install_category "$category"
        done
        return
    fi

    echo ""
    # Split by comma
    IFS=',' read -ra selected <<< "$choices"
    for choice in "${selected[@]}"; do
        choice=$(echo "$choice" | tr -d ' ')
        case "$choice" in
            1) install_category "backend" ;;
            2) install_category "frontend" ;;
            3) install_category "gamedev" ;;
            4) install_category "security" ;;
            5) install_category "blueteam" ;;
            6) install_category "reverse" ;;
            7) install_category "productivity" ;;
            8) install_category "systems" ;;
            9) install_category "compliance" ;;
            *) echo -e "${RED}  [-] Invalid choice: $choice${NC}" ;;
        esac
    done
}

# ---- Main ----

FORCE=false
SELECTED_PLUGINS=""
SELECTED_CATEGORIES=""
MODE="all"

while [ $# -gt 0 ]; do
    case $1 in
        --force|-f)
            FORCE=true
            shift
            ;;
        --list|-l)
            show_list
            exit 0
            ;;
        --status|-s)
            show_status
            exit 0
            ;;
        --interactive|-i)
            MODE="interactive"
            shift
            ;;
        --plugin|-p)
            MODE="plugins"
            SELECTED_PLUGINS="$SELECTED_PLUGINS $2"
            shift 2
            ;;
        --category|-c)
            MODE="categories"
            SELECTED_CATEGORIES="$SELECTED_CATEGORIES $2"
            shift 2
            ;;
        --update)
            FORCE=true
            MODE="update"
            shift
            ;;
        --target|-t)
            TARGET="$2"
            case "$TARGET" in
                claude|agents|both) ;;
                *)
                    echo -e "${RED}Invalid target: $TARGET (use: claude, agents, both)${NC}"
                    exit 1
                    ;;
            esac
            shift 2
            ;;
        --help|-h)
            show_help
            exit 0
            ;;
        --uninstall|-u)
            show_banner
            echo -e "${YELLOW}[*] Uninstalling all Skills Plugins...${NC}"
            removed=0
            for dir in "$PLUGINS_DIR"/*/; do
                plugin_name=$(basename "$dir")
                # Skill-rooted: <plugin>.md slash command + plugin dir under agents
                if [ -f "$dir/SKILL.md" ]; then
                    if [ -f "$CLAUDE_COMMANDS_DIR/$plugin_name.md" ]; then
                        rm "$CLAUDE_COMMANDS_DIR/$plugin_name.md"
                        echo -e "${RED}  [-] Removed (claude): /$plugin_name${NC}"
                        removed=$((removed + 1))
                    fi
                    if [ -d "$AGENTS_SKILLS_DIR/$plugin_name" ]; then
                        rm -rf "$AGENTS_SKILLS_DIR/$plugin_name"
                        echo -e "${RED}  [-] Removed (agents): $plugin_name${NC}"
                        removed=$((removed + 1))
                    fi
                fi
                # Subcommands (legacy plugins + skill plugins that have commands/)
                for cmd in "$dir/commands/"*.md; do
                    if [ -f "$cmd" ]; then
                        filename=$(basename "$cmd")
                        skill_name=$(basename "$filename" .md)
                        if [ -f "$CLAUDE_COMMANDS_DIR/$filename" ]; then
                            rm "$CLAUDE_COMMANDS_DIR/$filename"
                            echo -e "${RED}  [-] Removed (claude): /$skill_name${NC}"
                            removed=$((removed + 1))
                        fi
                        if [ -d "$AGENTS_SKILLS_DIR/$skill_name" ]; then
                            rm -rf "$AGENTS_SKILLS_DIR/$skill_name"
                            echo -e "${RED}  [-] Removed (agents): $skill_name${NC}"
                            removed=$((removed + 1))
                        fi
                    fi
                done
            done
            echo ""
            if [ $removed -gt 0 ]; then
                echo -e "${GREEN}[+] Uninstalled $removed command(s).${NC}"
            else
                echo -e "${YELLOW}[*] No installed commands found.${NC}"
            fi
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            echo "Use --help for usage information."
            exit 1
            ;;
    esac
done

# Check for Claude Code
if ! command -v claude > /dev/null 2>&1; then
    echo -e "${YELLOW}[!] Claude Code CLI not detected in PATH.${NC}"
    echo -e "${YELLOW}    Install: ${BOLD}npm install -g @anthropic-ai/claude-code${NC}"
    echo -e "${YELLOW}    Plugins will still install for when you do.${NC}"
    echo ""
fi

# Create target directories
if [ "$TARGET" = "claude" ] || [ "$TARGET" = "both" ]; then
    mkdir -p "$CLAUDE_COMMANDS_DIR"
fi
if [ "$TARGET" = "agents" ] || [ "$TARGET" = "both" ]; then
    mkdir -p "$AGENTS_SKILLS_DIR"
fi

# Track installation
INSTALLED=0
SKIPPED=0
TOTAL=0

show_banner

case "$MODE" in
    interactive)
        interactive_install
        ;;
    plugins)
        echo -e "${BLUE}[*] Installing selected plugins...${NC}"
        echo ""
        for plugin in $SELECTED_PLUGINS; do
            install_plugin "$plugin"
        done
        ;;
    categories)
        echo -e "${BLUE}[*] Installing selected categories...${NC}"
        echo ""
        for category in $SELECTED_CATEGORIES; do
            install_category "$category"
        done
        ;;
    update)
        echo -e "${BLUE}[*] Updating all installed plugins...${NC}"
        echo ""
        for dir in "$PLUGINS_DIR"/*/; do
            plugin=$(basename "$dir")
            for cmd in "$dir/commands/"*.md; do
                if [ -f "$cmd" ] && [ -f "$CLAUDE_COMMANDS_DIR/$(basename "$cmd")" ]; then
                    install_plugin "$plugin"
                    break
                fi
            done
        done
        ;;
    all)
        echo -e "${BLUE}[*] Installing all plugins...${NC}"
        echo ""
        for category in $ALL_CATEGORIES; do
            install_category "$category"
        done
        ;;
esac

# Summary
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}${BOLD}  Installation Complete!${NC}"
echo -e "  ${GREEN}Installed: $INSTALLED${NC} | ${YELLOW}Skipped: $SKIPPED${NC} | Total: $TOTAL"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${BOLD}Quick Start:${NC}"
echo -e "  1. Open Claude Code:  ${CYAN}claude${NC}"
echo -e "  2. Use a slash command: ${CYAN}/gamedev-unity build a 2D platformer controller${NC}"
echo ""
echo -e "${DIM}./install.sh --status   →  See what's installed${NC}"
echo -e "${DIM}./install.sh --list     →  See all available commands${NC}"
echo ""
