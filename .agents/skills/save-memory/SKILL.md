---
name: save-memory
description: >-
  Merangkum keputusan penting, status, dan milestone dari sesi obrolan aktif ke dalam sistem memori terpusat di Atlas/AI_Memory menggunakan protokol Mem0 (ADD/UPDATE).
---

# Save Memory Skill (`/save-memory`)

Gunakan skill ini untuk menyaring dan menyimpan state percakapan ke dalam sistem memori jangka panjang bersama (*Shared Central Memory*).

## Langkah Operasional

1. **Buka Dokumen SOP Operasional:**
   Baca berkas SOP di `Atlas/AI_Memory/04_Workflows_Procedural/SOP_Memory_Operations.md` (atau path absolutnya).

2. **Identifikasi Proyek & Ekstraksi Fakta:**
   Tentukan proyek apa yang sedang dibahas pada sesi ini.
   Ekstrak fakta atomik:
   - Tujuan sesi
   - Keputusan penting / arsitektur / metode
   - Berkas yang diubah/dibuat
   - Status & langkah berikutnya (*next steps*)

3. **Terapkan Memory Decision Engine (Mem0 Protocol):**
   - **ADD**: Jika proyek baru, buat berkas baru di `Atlas/AI_Memory/02_Projects_Episodic/` menggunakan template di `Atlas/AI_Memory/templates/template_memory_item.md`.
   - **UPDATE**: Jika proyek sudah ada, tambahkan entri `### 📝 Log Sesi: [Tanggal]` di bagian bawah berkas proyek tersebut dan perbarui status di frontmatter YAML.
   - **NOOP**: Jika tidak ada keputusan substantif baru, beritahu pengguna tanpa mengubah berkas.

4. **Perbarui Router:**
   Perbarui baris proyek terkait di:
   `Atlas/AI_Memory/00_MEMORY_ROUTER.md`.

5. **Konfirmasi ke Pengguna:**
   Sampaikan laporan ringkas 3-4 butir poin mengenai apa saja yang berhasil dicatat ke dalam memori.
