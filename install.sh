#!/usr/bin/env bash
# Antigravity Global Skills Installer for macOS and Linux
# Run: chmod +x install.sh && ./install.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$HOME"

echo "=========================================================="
echo "  Antigravity Global Skills Installer (macOS / Linux)"
echo "=========================================================="
echo "Source directory: $SCRIPT_DIR"
echo "Target home:      $HOME_DIR"

CONFIG_PLUGINS_DIR="$HOME_DIR/.gemini/config/plugins"
CONFIG_SKILLS_DIR="$HOME_DIR/.gemini/config/skills"
CLI_SKILLS_DIR="$HOME_DIR/.gemini/antigravity-cli/skills"
AGENTS_SKILLS_DIR="$HOME_DIR/.agents/skills"

mkdir -p "$CONFIG_PLUGINS_DIR" "$CONFIG_SKILLS_DIR" "$CLI_SKILLS_DIR" "$AGENTS_SKILLS_DIR"

# 1. Install all plugins
for plugin_path in "$SCRIPT_DIR"/*/; do
    [ -d "$plugin_path" ] || continue
    plugin_name="$(basename "$plugin_path")"
    
    case "$plugin_name" in
        ".git"|".github"|"standalone-skills") continue ;;
    esac

    target="$CONFIG_PLUGINS_DIR/$plugin_name"
    ln -sfn "$plugin_path" "$target"
    echo " [+] Installed plugin: $plugin_name"

    # Link nested skills into CLI and universal folders
    skills_dir="$plugin_path/skills"
    if [ -d "$skills_dir" ]; then
        for skill_path in "$skills_dir"/*/; do
            [ -d "$skill_path" ] || continue
            skill_name="$(basename "$skill_path")"
            ln -sfn "$skill_path" "$CLI_SKILLS_DIR/$skill_name"
            ln -sfn "$skill_path" "$AGENTS_SKILLS_DIR/$skill_name"
        done
    fi
done

# 2. Install standalone skills
standalone_dir="$SCRIPT_DIR/standalone-skills"
if [ -d "$standalone_dir" ]; then
    for skill_path in "$standalone_dir"/*/; do
        [ -d "$skill_path" ] || continue
        skill_name="$(basename "$skill_path")"
        ln -sfn "$skill_path" "$CONFIG_SKILLS_DIR/$skill_name"
        ln -sfn "$skill_path" "$CLI_SKILLS_DIR/$skill_name"
        ln -sfn "$skill_path" "$AGENTS_SKILLS_DIR/$skill_name"
        echo " [+] Installed standalone skill: $skill_name"
    done
fi

echo "----------------------------------------------------------"
echo " Installation Complete!"
echo " Plugins in IDE/2.0:  $(find "$CONFIG_PLUGINS_DIR" -mindepth 1 -maxdepth 1 -type l | wc -l)"
echo " Standalone Skills:   $(find "$CONFIG_SKILLS_DIR" -mindepth 1 -maxdepth 1 -type l | wc -l)"
echo " Total Skills in CLI: $(find "$CLI_SKILLS_DIR" -mindepth 1 -maxdepth 1 -type l | wc -l)"
echo "----------------------------------------------------------"
echo "Restart Antigravity IDE / 2.0 or run 'agy' in your terminal."
