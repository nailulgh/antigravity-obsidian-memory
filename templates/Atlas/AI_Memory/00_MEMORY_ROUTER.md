---
title: "AI Memory Router & Map of Content"
id: "memory-router"
memory_type: "router"
scope: "global"
tags:
  - ai-memory
  - router
  - moc
last_updated: 2026-10-14
status: "active"
summary: "Peta navigasi utama memori AI Agent lintas folder dan multi-agent. Baca file ini terlebih dahulu untuk menentukan konteks yang dibutuhkan."
---

# 🧠 AI Memory Router & Map of Content

> **Panduan untuk AI Agent:**  
> Anda berada di hub memori sentral. File ini adalah gerbang utama (*router*).  
> **Hemat Token:** Jangan membaca semua file secara acak. Pindai tabel di bawah dan baca **hanya** file yang relevan dengan tugas yang sedang Anda kerjakan!

---

## 📌 Indeks Memori Berdasarkan Lingkup (Scope)

### 1. User Profile (Lingkup Personal & Global)
| File & Tautan | Deskripsi Singkat / Ringkasan Isi | Kapan Harus Dibaca? |
| :--- | :--- | :--- |
| `[[Profile_User]]`<br>`01_User_Profile/Profile_User.md` | Profil pengguna, domain minat/keahlian, preferensi gaya komunikasi, dan standar asistensi. | Saat memulai sesi baru untuk menjaga konsistensi persona & preferensi. |

### 2. Episodic Projects (Lingkup Proyek & Milestone Aktif)
| File & Tautan | ID Proyek | Status Terkini | Next Step Kunci |
| :--- | :--- | :---: | :--- |
| *(Daftar proyek akan otomatis terisi dan diperbarui di sini saat Anda menggunakan `/save-memory`)* | - | - | - |

### 3. Semantic Knowledge (Lingkup Basis Pengetahuan & Referensi)
| File & Tautan | ID | Kategori | Ringkasan Inti |
| :--- | :--- | :--- | :--- |
| *(Catatan fakta domain, pedoman, atau referensi penting dapat ditambahkan di folder ini)* | - | - | - |

### 4. Procedural Workflows (Lingkup SOP & Panduan Operasional)
| File & Tautan | ID | Deskripsi Prosedur |
| :--- | :--- | :--- |
| `[[SOP_Memory_Operations]]`<br>`04_Workflows_Procedural/SOP_Memory_Operations.md` | `sop-memory-operations` | **SOP Wajib:** Protokol ADD/UPDATE/NOOP ala Mem0 saat user mengetik `/save-memory`, integrasi catatan Obsidian, dan mitigasi refaktor folder. |
| `[[Konsep_Memori_Lokal]]`<br>`04_Workflows_Procedural/Konsep_Memori_Lokal.md` | `konsep-memori-lokal` | Dasar teori statelessness LLM dan konsep sinkronisasi memori multi-agent berbasis Markdown. |

---

## ⚡ Perintah Cepat Pengguna
* **Simpan / Rangkum Sesi:** Ketik `/save-memory` atau *"simpan memori sesi ini"*.
* **Tautkan Catatan Obsidian Baru:** Ketik *"Tautkan catatan `[[Nama_Catatan]]` ke memori proyek [Nama Proyek]"*.
