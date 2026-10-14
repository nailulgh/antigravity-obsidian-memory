---
title: "SOP Operasional Memori: Protokol CRUD Memori & Penangkapan Catatan Obsidian"
id: "sop-memory-operations"
memory_type: "procedural"
scope: "global/memory-management"
tags:
  - ai-memory
  - sop
  - mem0-protocol
last_updated: 2026-10-14
status: "active"
summary: "SOP bagi AI Agent untuk membaca router, menjalankan Memory Decision Engine (ADD, UPDATE, DELETE, NOOP) ala Mem0, menangani catatan Obsidian, dan mengatasi perpindahan folder."
---

# SOP Operasional Memori AI Agent (Mem0 Protocol)

Setiap AI Agent (Antigravity CLI/IDE, Cursor, Cline, Ollama) yang berinteraksi dengan workspace ini **WAJIB** mematuhi prosedur berikut untuk menjaga konsistensi memori jangka panjang.

---

## 1. Protokol Memulai Sesi (*Read Phase*)

1. **Titik Awal (Router First):**  
   Selalu baca file ringkas:  
   `./Atlas/AI_Memory/00_MEMORY_ROUTER.md`  
   *(Jangan membaca seluruh subfolder secara acak untuk menghemat token!)*
2. **Pilih Berkas Relevan:**  
   * Jika tugas berkaitan dengan preferensi/gaya penulisan: baca `01_User_Profile/Profile_User.md`.
   * Jika tugas melanjutkan proyek spesifik: baca berkas terkait di `02_Projects_Episodic/`.
3. **Lanjutkan Tugas:**  
   Gunakan konteks yang diperoleh untuk melanjutkan pekerjaan tanpa menanyakan ulang hal-hal yang sudah disepakati di memori.

---

## 2. Protokol Penyimpanan Memori (*Write / Consolidation Phase: `/save-memory`*)

Ketika pengguna mengetik `/save-memory` atau meminta merangkum sesi:

```
[Menerima Perintah: /save-memory]
            │
            ▼
[Identifikasi Scope & Proyek yang Dibahas]
            │
            ▼
[Ekstraksi Fakta Atomik & Keputusan Penting]
            │
            ▼
[Evaluasi Aksi ala Mem0 Decision Engine]
    ├── ADD    : Buat item baru di 02_Projects_Episodic/ jika proyek baru
    ├── UPDATE : Tambahkan log sesi baru & update checklist di file proyek lama
    ├── DELETE : Resolusi informasi yang kedaluwarsa atau kontradiktif
    └── NOOP   : Tidak ada perubahan esensial, konfirmasi tanpa mengubah file
            │
            ▼
[Perbarui Baris Status di 00_MEMORY_ROUTER.md]
            │
            ▼
[Kirimkan Konfirmasi Ringkas ke Pengguna]
```

### Format Entri Log Sesi Proyek:
Saat mengupdate catatan di `02_Projects_Episodic/`:
* Pertahankan frontmatter YAML (perbarui `last_updated` dan `status`).
* Tambahkan entri log sesi baru di bagian bawah:
  ```markdown
  ### 📝 Log Sesi: [Tanggal YYYY-MM-DD]
  * **Tujuan Sesi:** [Ringkasan apa yang dikerjakan]
  * **Keputusan Kunci:** [Keputusan teknis/metodologis/arsitektur]
  * **Berkas yang Diubah/Dibuat:** `[[Nama_Berkas]]`
  * **Status & Next Steps:** 
    - [x] Milestone yang baru saja selesai
    - [ ] Milestone berikutnya yang harus dilanjutkan agent lain
  ```

---

## 3. Protokol Penangkapan Catatan Obsidian (*Capturing Obsidian Notes*)

* **Prinsip Utama:** Folder `Atlas/AI_Memory/` adalah **buku status eksekutif**, bukan tempat kloning catatan harian Obsidian.
* **Cara Menautkan Catatan:**
  * Jika pengguna membuat catatan baru di vault, cukup catat **tautan Obsidian Wikilink** `[[Nama_Catatan]]` pada seksi `related_files` di frontmatter atau tubuh memori proyek.
  * Catat 1–2 kalimat poin kesimpulan dari catatan tersebut ke memori proyek, agar agent berikutnya tahu intinya tanpa harus membaca seluruh file catatan.

---

## 4. Protokol Ketahanan Refaktor Folder (*Refactor Resilience*)

Jika pengguna memindahkan berkas atau mengubah struktur folder di Obsidian:
1. **Prioritaskan Wikilinks & Basename:** Gunakan `[[Nama_File]]` atau `basename`.
2. **Pencarian Berbasis ID:** Jika suatu path tidak ditemukan, cari berkas di vault yang memiliki metadata `id:` yang cocok.
3. **Audit Path Saat Update:** Jika agent mendeteksi bahwa berkas yang ditautkan telah berpindah ke subfolder baru, perbarui referensi path tersebut di memori saat menjalankan `/save-memory`.
