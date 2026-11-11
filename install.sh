#!/usr/bin/env bash
# Universal AI Global Skills Installer for macOS and Linux
# Compatible with: Antigravity, Claude Code, OpenCode, VS Code
# Run: chmod +x install.sh && ./install.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$HOME"

echo "=========================================================="
echo "  Universal AI Global Skills Installer (macOS / Linux)"
echo "  Surfaces: Antigravity, Claude Code, OpenCode, VS Code"
echo "=========================================================="
echo "Source directory: $SCRIPT_DIR"
echo "Target home:      $HOME_DIR"

CONFIG_PLUGINS_DIR="$HOME_DIR/.gemini/config/plugins"
CONFIG_SKILLS_DIR="$HOME_DIR/.gemini/config/skills"
CLI_SKILLS_DIR="$HOME_DIR/.gemini/antigravity-cli/skills"
AGENTS_SKILLS_DIR="$HOME_DIR/.agents/skills"
CLAUDE_SKILLS_DIR="$HOME_DIR/.claude/skills"
OPENCODE_CONFIG_DIR="$HOME_DIR/.config/opencode/skills"
OPENCODE_ALT_DIR="$HOME_DIR/.opencode/skills"

mkdir -p "$CONFIG_PLUGINS_DIR" "$CONFIG_SKILLS_DIR" "$CLI_SKILLS_DIR" "$AGENTS_SKILLS_DIR" "$CLAUDE_SKILLS_DIR" "$OPENCODE_CONFIG_DIR" "$OPENCODE_ALT_DIR"

safe_link() {
    local src="${1%/}"
    local dest="${2%/}"

    [ -e "$src" ] || return 0

    # If destination is already a symlink (valid or broken), remove it first so we link cleanly
    if [ -L "$dest" ]; then
        rm -f "$dest"
    elif [ -d "$dest" ]; then
        # If destination is an existing real directory, do not overwrite or nest inside it
        return 0
    fi

    ln -s "$src" "$dest" 2>/dev/null || true
}

# 1. Install all plugins
for plugin_path in "$SCRIPT_DIR"/*/; do
    [ -d "$plugin_path" ] || continue
    plugin_name="$(basename "$plugin_path")"
    
    case "$plugin_name" in
        ".git"|".github"|"standalone-skills") continue ;;
    esac

    target="$CONFIG_PLUGINS_DIR/$plugin_name"
    safe_link "$plugin_path" "$target"
    echo " [+] Processed plugin: $plugin_name"

    # Link nested skills into all AI tool roots
    skills_dir="$plugin_path/skills"
    if [ -d "$skills_dir" ]; then
        for skill_path in "$skills_dir"/*/; do
            [ -d "$skill_path" ] || continue
            skill_name="$(basename "$skill_path")"
            safe_link "$skill_path" "$CONFIG_SKILLS_DIR/$skill_name"
            safe_link "$skill_path" "$CLI_SKILLS_DIR/$skill_name"
            safe_link "$skill_path" "$AGENTS_SKILLS_DIR/$skill_name"
            safe_link "$skill_path" "$CLAUDE_SKILLS_DIR/$skill_name"
            safe_link "$skill_path" "$OPENCODE_CONFIG_DIR/$skill_name"
            safe_link "$skill_path" "$OPENCODE_ALT_DIR/$skill_name"
        done
    fi
done

# 2. Install standalone skills
standalone_dir="$SCRIPT_DIR/standalone-skills"
if [ -d "$standalone_dir" ]; then
    for skill_path in "$standalone_dir"/*/; do
        [ -d "$skill_path" ] || continue
        skill_name="$(basename "$skill_path")"
        safe_link "$skill_path" "$CONFIG_SKILLS_DIR/$skill_name"
        safe_link "$skill_path" "$CLI_SKILLS_DIR/$skill_name"
        safe_link "$skill_path" "$AGENTS_SKILLS_DIR/$skill_name"
        safe_link "$skill_path" "$CLAUDE_SKILLS_DIR/$skill_name"
        safe_link "$skill_path" "$OPENCODE_CONFIG_DIR/$skill_name"
        safe_link "$skill_path" "$OPENCODE_ALT_DIR/$skill_name"
        echo " [+] Installed standalone skill: $skill_name"
    done
fi

# 3. Aliases
if [ -d "$SCRIPT_DIR/agent-skills/skills/test-driven-development" ]; then
    safe_link "$SCRIPT_DIR/agent-skills/skills/test-driven-development" "$CONFIG_SKILLS_DIR/addy-tdd"
    safe_link "$SCRIPT_DIR/agent-skills/skills/test-driven-development" "$CLI_SKILLS_DIR/addy-tdd"
    safe_link "$SCRIPT_DIR/agent-skills/skills/test-driven-development" "$AGENTS_SKILLS_DIR/addy-tdd"
    safe_link "$SCRIPT_DIR/agent-skills/skills/test-driven-development" "$CLAUDE_SKILLS_DIR/addy-tdd"
fi
if [ -d "$SCRIPT_DIR/ecc/skills/design-system" ]; then
    safe_link "$SCRIPT_DIR/ecc/skills/design-system" "$CONFIG_SKILLS_DIR/ecc-design-system"
    safe_link "$SCRIPT_DIR/ecc/skills/design-system" "$CLI_SKILLS_DIR/ecc-design-system"
    safe_link "$SCRIPT_DIR/ecc/skills/design-system" "$AGENTS_SKILLS_DIR/ecc-design-system"
    safe_link "$SCRIPT_DIR/ecc/skills/design-system" "$CLAUDE_SKILLS_DIR/ecc-design-system"
fi

# 4. Install Proactive Directive in ~/.claude/CLAUDE.md and ~/.agents/AGENTS.md
if [ -f "$SCRIPT_DIR/CLAUDE.md" ] && [ ! -f "$HOME_DIR/.claude/CLAUDE.md" ]; then
    mkdir -p "$HOME_DIR/.claude"
    cp "$SCRIPT_DIR/CLAUDE.md" "$HOME_DIR/.claude/CLAUDE.md"
    echo " [✔] Installed universal proactive directive in ~/.claude/CLAUDE.md"
fi
if [ -f "$SCRIPT_DIR/AGENTS.md" ] && [ ! -f "$HOME_DIR/.agents/AGENTS.md" ]; then
    mkdir -p "$HOME_DIR/.agents"
    cp "$SCRIPT_DIR/AGENTS.md" "$HOME_DIR/.agents/AGENTS.md"
    echo " [✔] Installed universal proactive directive in ~/.agents/AGENTS.md"
fi

echo "----------------------------------------------------------"
echo " Global Installation Complete!"
echo " Total Plugins in Antigravity: $(find "$CONFIG_PLUGINS_DIR" -mindepth 1 -maxdepth 1 \( -type l -o -type d \) | wc -l | tr -d ' ')"
echo " Total Skills in Antigravity:  $(find "$CLI_SKILLS_DIR" -mindepth 1 -maxdepth 1 \( -type l -o -type d \) | wc -l | tr -d ' ')"
echo " Total Universal (.agents):    $(find "$AGENTS_SKILLS_DIR" -mindepth 1 -maxdepth 1 \( -type l -o -type d \) | wc -l | tr -d ' ')"
echo " Total Skills in Claude Code:  $(find "$CLAUDE_SKILLS_DIR" -mindepth 1 -maxdepth 1 \( -type l -o -type d \) | wc -l | tr -d ' ')"
echo "----------------------------------------------------------"
echo "Restart Antigravity, VS Code, Cursor, Claude Code, or OpenCode to begin using them immediately!"
