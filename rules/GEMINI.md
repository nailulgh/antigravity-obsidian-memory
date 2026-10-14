# Workspace Rule: Ideaverse Memory Integration

- **Central Long-Term Memory Location**:
  `Atlas/AI_Memory/` (Path relatif terhadap root vault: `./Atlas/AI_Memory/`)
- **Memory Router**:
  Saat memulai percakapan baru atau membutuhkan latar belakang profil pengguna/proyek, selalu periksa `Atlas/AI_Memory/00_MEMORY_ROUTER.md` terlebih dahulu.
- **Auto-Summarize (/save-memory)**:
  Jika pengguna mengetik `/save-memory`, `simpan memori`, atau meminta merangkum sesi:
  1. Jalankan alur di `Atlas/AI_Memory/04_Workflows_Procedural/SOP_Memory_Operations.md`.
  2. Ekstrak fakta atomik, keputusan penting, dan status berkas.
  3. Lakukan ADD/UPDATE pada berkas di `Atlas/AI_Memory/02_Projects_Episodic/`.
  4. Perbarui `Atlas/AI_Memory/00_MEMORY_ROUTER.md`.
- **Refactor & Path Resilience**:
  Gunakan penautan Wikilinks `[[...]]` dan identitas metadata `id:` agar memori tetap sinkron meskipun berkas di vault dipindahkan ke subdirektori lain atau dibuka di mesin laptop dengan username yang berbeda.
