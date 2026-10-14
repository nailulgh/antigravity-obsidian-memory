---
title: "Arsitektur Teoretis: Konsep Memori Bersama (Shared Memory) AI Agent Lokal"
id: "konsep-memori-lokal"
memory_type: "procedural"
scope: "ai-architecture/memory"
tags:
  - ai-memory
  - architectural-concept
last_updated: 2026-10-14
status: "reference"
summary: "Konsep dasar keterbatasan stateless LLM dan solusi shared central memory lintas folder/agent berbasis Markdown lokal di Obsidian."
---

# Arsitektur Teoretis: Konsep Memori Bersama (Shared Memory) AI Agent Lokal

## 📌 Ringkasan Inti
Secara alami, **model AI bersifat *stateless*** (tidak menyimpan memori atau ingatan bawaan saat sesi/folder berganti). 

Agar Agent AI di **Folder/Alat Baru (Agent B)** dapat mengetahui dan melanjutkan apa yang telah dikerjakan di **Folder/Alat Sebelumnya (Agent A)**, dibutuhkan **Penyimpanan Terpusat (*Shared Memory*)** yang bertindak sebagai jembatan *state synchronization*.

---

## 🔄 Alur Kerja Siklus 3 Langkah Sederhana

```
[Agent A (Terminal / Workspace 1)] 
       │
       ▼ (Simpan hasil rangkuman: /save-memory)
[Berkas Memori Terpusat (Atlas/AI_Memory)]
       │
       ▼ (Baca Router & Proyek Terkait)
[Agent B (Terminal / Workspace 2)]
```

1. **Penyimpanan Terpusat Berbasis Berkas (Markdown-Native):**
   * Lokasi tetap: `Atlas/AI_Memory/`.
   * Format terbuka, transparan, dan dapat dibaca manusia maupun agen AI apa pun.
2. **Saat Sesi Selesai (Agent A):**
   * Jalankan instruksi `/save-memory`. AI menyaring percakapan menjadi fakta atomik, keputusan, dan *next steps*.
3. **Saat Sesi Baru Dimulai (Agent B):**
   * Agent membaca `00_MEMORY_ROUTER.md` dan langsung memahami status terkini tanpa perlu pengulangan prompt.
