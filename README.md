# Antigravity Obsidian Memory 🧠⚡

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Antigravity Plugin](https://img.shields.io/badge/Antigravity-Plugin-4285F4.svg)](https://antigravity.google)
[![Obsidian Compatible](https://img.shields.io/badge/Obsidian-Compatible-7C3AED.svg)](https://obsidian.md)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

> **Shared Long-Term Memory & Multi-Agent Synchronization Plugin** that turns your local **Obsidian Vault** into a persistent, token-efficient cognitive brain for Google Antigravity (and other local AI coding agents).

Inspired by the **[Mem0](https://github.com/mem0ai/mem0)** decision engine protocol and **[CoALA](https://arxiv.org/abs/2309.02427)** Cognitive Architecture for Language Agents.

---

## 🌟 Why Antigravity Obsidian Memory?

Modern Large Language Models (LLMs) and AI Agents are **stateless**. Every time you switch folders, close the terminal, or launch a new agent, the AI forgets your preferences, project decisions, and milestones.

### Common Pitfalls:
* ❌ **Chat History Stuffing:** Feeding full chat transcripts burns thousands of tokens, increases costs, and causes the *"Lost in the Middle"* context degradation problem.
* ❌ **Proprietary Vector DB Lock-in:** Storing memories in complex external vector databases prevents you from viewing, editing, or owning your data locally in your Markdown notes.

### The Solution:
`antigravity-obsidian-memory` bridges your human-readable **Obsidian Vault** with your **AI Agents**:
* 🚀 **Token-Efficient Router (< 40 lines):** Agents read a single Map-of-Content router first, saving >90% tokens by loading only relevant context on demand.
* 🔄 **Mem0-Style Decision Engine:** Uses structured **ADD**, **UPDATE**, and **NOOP** logic when saving memories (`/save-memory`).
* 🤝 **Multi-Agent Portability:** Connects Antigravity CLI/IDE, Cursor, Cline, or local LLMs to a shared single source of truth.
* 🛡️ **Refactor-Resilient:** Uses Obsidian `[[wikilinks]]` and unique `id:` tags, so your memory remains intact even if you move folders or switch laptops.

---

## 🏗️ Architecture: 4 Cognitive Memory Tiers

```
Vault/Atlas/AI_Memory/
├── 00_MEMORY_ROUTER.md             # [Router / Working Gateway] Rapid lookup under 40 lines
│
├── 01_User_Profile/                # [User Scope] Persona, research focus, coding rules
│   └── Profile_User.md
│
├── 02_Projects_Episodic/           # [Session / Episodic Scope] Active tasks, decisions & next steps
│   └── Project_Alpha.md
│
├── 03_Knowledge_Semantic/          # [Semantic Knowledge] Facts, guidelines, target criteria
│   └── Standards.md
│
├── 04_Workflows_Procedural/        # [Procedural Workflows] SOPs, runbooks & Mem0 rules
│   └── SOP_Memory_Operations.md
│
└── templates/                      # [Standard Frontmatter] Reusable YAML schemas
    └── template_memory_item.md
```

---

## 🚀 Quick Start & Installation

### Option 1: Official Antigravity Plugin CLI (Recommended)
Inside your Antigravity terminal:
```bash
agy plugin install https://github.com/nailulgh/antigravity-obsidian-memory
```

### Option 2: 1-Click Installer for Your Obsidian Vault

#### Windows (PowerShell):
Open PowerShell in your Obsidian Vault directory and run:
```powershell
# Clone the repo temporarily or download setup.ps1
irm https://raw.githubusercontent.com/nailulgh/antigravity-obsidian-memory/main/setup.ps1 | iex
```
*(Or clone this repository and execute `./setup.ps1 -VaultPath "C:\path\to\your\vault"`)*

#### macOS / Linux:
```bash
curl -fsSL https://raw.githubusercontent.com/nailulgh/antigravity-obsidian-memory/main/setup.sh | bash
```

---

## 🎮 How to Use

### 1. Starting a New Session
Simply prompt your agent in any workspace:
> *"Continue working on Project Alpha based on the latest memory state."*

The agent checks `00_MEMORY_ROUTER.md`, finds the relevant project note, and resumes without you needing to re-explain anything.

### 2. Saving State at the End of a Session (`/save-memory`)
When you are done with a task or discussion, just type:
```text
/save-memory
```
*(or type: "simpan memori sesi ini" / "save our progress to memory")*

**What happens automatically:**
1. AI identifies the active project.
2. Extracts atomic facts, decisions, and files changed.
3. Applies Mem0 decision logic (**ADD** new file or **UPDATE** existing project checklist).
4. Updates the summary line in `00_MEMORY_ROUTER.md`.
5. Returns a concise confirmation report.

---

## 📱 Mobile & Cloud Sync (Syncthing / GitHub)

Because this plugin stores all data as pure Markdown notes:
* **Obsidian Mobile (Android / iOS):** Reads and renders all memory files seamlessly.
* **Sync Engines (Syncthing, Git, iCloud):** Memory stays synced across all your laptops and mobile devices without proprietary databases.

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check [issues page](https://github.com/nailulgh/antigravity-obsidian-memory/issues).

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

Distributed under the **MIT License**. See `LICENSE` for more information.

Developed with ❤️ by **[Muhammad Nailul Ghufron Majid](https://github.com/nailulgh)**.
