# Antigravity Obsidian Memory Installer (Windows)
# Usage: Run this script inside your target Obsidian Vault, or provide -VaultPath
param (
    [string]$VaultPath = (Get-Location).Path
)

$ErrorActionPreference = "Stop"

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  🧠 Antigravity Obsidian Memory: Quick Installer" -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "📁 Target Obsidian Vault: $VaultPath" -ForegroundColor Green

$ScriptRoot = $PSScriptRoot
$TemplateDir = Join-Path $ScriptRoot "templates\Atlas\AI_Memory"
$TargetMemory = Join-Path $VaultPath "Atlas\AI_Memory"

if (-not (Test-Path $TemplateDir)) {
    Write-Error "Folder template tidak ditemukan di $TemplateDir!"
    exit 1
}

# 1. Salin struktur starter AI_Memory ke Vault jika belum ada
if (-not (Test-Path $TargetMemory)) {
    New-Item -ItemType Directory -Path $TargetMemory -Force | Out-Null
    Copy-Item -Path "$TemplateDir\*" -Destination $TargetMemory -Recurse -Force
    Write-Host "✅ Folder starter Atlas/AI_Memory berhasil dipasang di Vault." -ForegroundColor Green
} else {
    Write-Host "ℹ️ Folder Atlas/AI_Memory sudah ada di Vault. Melewati penyalinan template." -ForegroundColor Gray
}

# 2. Pasang GEMINI.md ke Root Vault jika belum ada
$TargetRule = Join-Path $VaultPath "GEMINI.md"
$SourceRule = Join-Path $ScriptRoot "rules\GEMINI.md"

if ((-not (Test-Path $TargetRule)) -and (Test-Path $SourceRule)) {
    Copy-Item -Path $SourceRule -Destination $TargetRule -Force
    Write-Host "✅ Workspace Rule GEMINI.md berhasil dipasang di Root Vault." -ForegroundColor Green
}

# 3. Pasang Skill save-memory ke Global Antigravity (~/.gemini/config/skills/save-memory)
$GlobalGemini = Join-Path $HOME ".gemini"
$GlobalSkillDir = Join-Path $GlobalGemini "config\skills\save-memory"
$SourceSkill = Join-Path $ScriptRoot ".agents\skills\save-memory\SKILL.md"

if (-not (Test-Path $GlobalSkillDir)) {
    New-Item -ItemType Directory -Path $GlobalSkillDir -Force | Out-Null
}

if (Test-Path $SourceSkill) {
    Copy-Item -Path $SourceSkill -Destination (Join-Path $GlobalSkillDir "SKILL.md") -Force
    Write-Host "✅ Global Skill '/save-memory' berhasil dipasang ke Antigravity." -ForegroundColor Green
}

# 4. Pasang Global Rule (~/.gemini/GEMINI.md)
$GlobalRuleFile = Join-Path $GlobalGemini "GEMINI.md"
$RouterFile = Join-Path $TargetMemory "00_MEMORY_ROUTER.md"
$SopFile = Join-Path $TargetMemory "04_Workflows_Procedural\SOP_Memory_Operations.md"

$templateContent = @'
# Global Antigravity System Rules: Centralized Memory Integration

- **Central Long-Term Memory Location**:
  `{0}\`
- **Router / Memory Map**:
  When starting any new task, context-switching, or needing user/project background, ALWAYS read the router first:
  `{1}`
- **Memory Operations & Auto-Summarization (`/save-memory`)**:
  Whenever the user types `/save-memory`, says "simpan memori", or asks to summarize the session into memory:
  1. Read the standard procedure in `{2}`.
  2. Extract atomic facts, key architectural/research decisions, and next steps from the current session.
  3. Apply Mem0-style decision logic:
     - **ADD**: Create a new project note in `02_Projects_Episodic/` if it's a completely new project.
     - **UPDATE**: Append a structured session log and update the checklist in the corresponding note in `02_Projects_Episodic/`.
     - **NOOP**: If no essential state or decision changed, notify the user without modifying files.
  4. Update the summary status line in `00_MEMORY_ROUTER.md`.
  5. Provide a concise confirmation of what was saved.
- **Obsidian Vault & Refactor Resilience**:
  - The Obsidian vault is an external Knowledge Base; do not dump full raw note contents into memory notes. Store wikilinks `[[Note_Name]]` and executive summaries.
  - If a file path changes within the vault, locate the file by its `basename` or unique metadata `id:` and update the reference in memory.
'@

$ruleText = [string]::Format($templateContent, $TargetMemory, $RouterFile, $SopFile)
[System.IO.File]::WriteAllText($GlobalRuleFile, $ruleText, [System.Text.Encoding]::UTF8)
Write-Host "✅ Global Rule ~/.gemini/GEMINI.md berhasil dikonfigurasikan." -ForegroundColor Green

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "🎉 Instalasi Berhasil! Obsidian Vault Anda sekarang memiliki AI Memory." -ForegroundColor Yellow
Write-Host "Anda dapat menggunakan perintah '/save-memory' kapan saja." -ForegroundColor Gray
Write-Host "==========================================================" -ForegroundColor Cyan
