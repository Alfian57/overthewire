#!/bin/bash

# Script untuk mengganti kata "bandit" menjadi "level" dalam nama file
# Author: Script Generator
# Date: July 15, 2025

echo "Memulai proses penggantian nama file..."
echo "Mengganti kata 'bandit' menjadi 'level' dalam nama file"
echo "----------------------------------------"

# Counter untuk file yang berhasil diubah
count=0

# Loop melalui semua file yang mengandung kata "bandit" dalam nama
for file in *bandit*; do
    # Cek apakah file benar-benar ada (bukan hasil glob expansion kosong)
    if [ -e "$file" ]; then
        # Buat nama file baru dengan mengganti "bandit" menjadi "level"
        new_name=$(echo "$file" | sed 's/bandit/level/g')
        
        # Cek apakah nama file akan berubah
        if [ "$file" != "$new_name" ]; then
            # Cek apakah file dengan nama baru sudah ada
            if [ -e "$new_name" ]; then
                echo "⚠️  File '$new_name' sudah ada, melewati '$file'"
            else
                # Lakukan rename
                mv "$file" "$new_name"
                if [ $? -eq 0 ]; then
                    echo "✅ '$file' → '$new_name'"
                    ((count++))
                else
                    echo "❌ Gagal mengganti nama '$file'"
                fi
            fi
        fi
    fi
done

echo "----------------------------------------"
echo "Proses selesai. Total file yang berhasil diubah: $count"

# Tampilkan daftar file yang mengandung "level" untuk konfirmasi
echo ""
echo "File yang mengandung 'level':"
ls -1 *level* 2>/dev/null || echo "Tidak ada file yang mengandung 'level'"