#!/usr/bin/env bash
# Antigravity Obsidian Memory Installer (macOS & Linux)
# Usage: ./setup.sh [/path/to/obsidian/vault]

set -e

VAULT_PATH="${1:-$(pwd)}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR/templates/Atlas/AI_Memory"
TARGET_MEMORY="$VAULT_PATH/Atlas/AI_Memory"

echo "=========================================================="
echo "  🧠 Antigravity Obsidian Memory: Quick Installer"
echo "=========================================================="
echo "📁 Target Vault: $VAULT_PATH"

if [ ! -d "$TEMPLATE_DIR" ]; then
    echo "❌ Error: Template directory not found at $TEMPLATE_DIR"
    exit 1
fi

# 1. Copy starter AI_Memory structure if not exists
if [ ! -d "$TARGET_MEMORY" ]; then
    mkdir -p "$TARGET_MEMORY"
    cp -r "$TEMPLATE_DIR"/* "$TARGET_MEMORY/"
    echo "✅ Starter Atlas/AI_Memory structure installed."
else
    echo "ℹ️ Folder Atlas/AI_Memory already exists. Skipping starter copy."
fi

# 2. Copy GEMINI.md to Vault root if not exists
if [ ! -f "$VAULT_PATH/GEMINI.md" ] && [ -f "$SCRIPT_DIR/rules/GEMINI.md" ]; then
    cp "$SCRIPT_DIR/rules/GEMINI.md" "$VAULT_PATH/GEMINI.md"
    echo "✅ Workspace Rule GEMINI.md installed in Vault."
fi

# 3. Install skill to ~/.gemini/config/skills/save-memory
GLOBAL_GEMINI="$HOME/.gemini"
GLOBAL_SKILLS="$GLOBAL_GEMINI/config/skills/save-memory"
mkdir -p "$GLOBAL_SKILLS"

if [ -f "$SCRIPT_DIR/.agents/skills/save-memory/SKILL.md" ]; then
    cp "$SCRIPT_DIR/.agents/skills/save-memory/SKILL.md" "$GLOBAL_SKILLS/SKILL.md"
    echo "✅ Global Skill '/save-memory' installed."
fi

# 4. Configure ~/.gemini/GEMINI.md
GLOBAL_RULE="$GLOBAL_GEMINI/GEMINI.md"
cat << EOF > "$GLOBAL_RULE"
# Global Antigravity System Rules: Centralized Memory Integration

- **Central Long-Term Memory Location**:
  \`$TARGET_MEMORY/\`
- **Router / Memory Map**:
  When starting any new task, context-switching, or needing user/project background, ALWAYS read the router first:
  \`$TARGET_MEMORY/00_MEMORY_ROUTER.md\`
- **Memory Operations & Auto-Summarization (\`/save-memory\`)**:
  Whenever the user types \`/save-memory\`, says "simpan memori", or asks to summarize the session into memory:
  1. Read the standard procedure in \`$TARGET_MEMORY/04_Workflows_Procedural/SOP_Memory_Operations.md\`.
  2. Extract atomic facts, key architectural/research decisions, and next steps from the current session.
  3. Apply Mem0-style decision logic:
     - **ADD**: Create a new project note in \`02_Projects_Episodic/\` if it's a completely new project.
     - **UPDATE**: Append a structured session log and update the checklist in the corresponding note in \`02_Projects_Episodic/\`.
     - **NOOP**: If no essential state or decision changed, notify the user without modifying files.
  4. Update the summary status line in \`00_MEMORY_ROUTER.md\`.
  5. Provide a concise confirmation of what was saved.
- **Obsidian Vault & Refactor Resilience**:
  - The Obsidian vault is an external Knowledge Base; do not dump full raw note contents into memory notes. Store wikilinks \`[[Note_Name]]\` and executive summaries.
  - If a file path changes within the vault, locate the file by its \`basename\` or unique metadata \`id:\` and update the reference in memory.
EOF

echo "✅ Global Rule ~/.gemini/GEMINI.md updated."
echo "=========================================================="
echo "🎉 Installation Complete! Use '/save-memory' to retain session state."
echo "=========================================================="
