#!/usr/bin/env bash

# 1. Tentukan folder wallpaper kamu (UBAH JALUR INI jika berbeda)
WALL_DIR="$HOME/Pictures/i3"

# 2. Jalur ke file tema yang baru dibuat
THEME="$HOME/.config/rofi/wall.rasi"

# Ambil daftar file gambar
files=$(ls "$WALL_DIR" | grep -E ".jpg$|.png$|.jpeg$")

# Cek apakah folder ada isinya
if [[ -z "$files" ]]; then
    notify-send "Wallpaper Error" "Folder $WALL_DIR kosong atau tidak ada."
    exit 1
fi

# Pilih menggunakan Rofi
chosen=$(echo -e "$files" | rofi -dmenu -i -p "Pilih" -theme "$THEME")

# Terapkan wallpaper jika user memilih sesuatu
if [[ -n "$chosen" ]]; then
    # Menggunakan nitrogen untuk set wallpaper (zoom-fill agar penuh)
    nitrogen --set-zoom-fill --save "$WALL_DIR/$chosen"
    
    # Notifikasi kecil di pojok (opsional)
    notify-send "Wallpaper" "Berhasil mengganti ke $chosen"
fi
