#!/bin/bash

# Loop dari 0 sampai 32
for i in $(seq -w 0 32); do
    # Hitung angka berikutnya (i + 1), dan format ke dua digit
    j=$(printf "%02d" $((10#$i + 1)))
    
    # Buat file dengan nama sesuai format
    filename="bandit-${i}_bandit-${j}.txt"
    user_num=$((10#$i + 1))  # Hilangkan leading zero untuk user
    echo "user      : bandit$user_num" >> "$filename"
    echo "password  : " >> "$filename"
    echo "File created: $filename"
done
