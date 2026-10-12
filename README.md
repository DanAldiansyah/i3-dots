# i3wm Dotfiles: Neon Genesis Evangelion

Selamat datang di repository **i3-dots** saya! Ini adalah konfigurasi lingkungan desktop (*desktop environment/rice*) minimalis berbasis **i3wm** yang memadukan estetika **Neon Genesis Evangelion (Asuka & Ayanami)** dengan skema warna **Catppuccin Mocha**.

[![Built with i3wm](https://img.shields.io/badge/WM-i3gaps-b4befe?style=flat-square&logo=i3)](https://i3wm.org/)
[![Color Palette](https://img.shields.io/badge/Palette-Catppuccin_Mocha-1e1e2e?style=flat-square&logo=catppuccin)](https://github.com/catppuccin/catppuccin)
[![OS Support](https://img.shields.io/badge/OS-Linux_Mint-text?style=flat-square&logo=linuxmint&logoColor=white&color=87cf3e)](https://linuxmint.com/)

---

## Pratinjau (Screenshots)

### Asuka Langley

<details>
<summary><b>Polybar</b></summary>

![img](./screenshots/asuka/polybar.png)

</details>

<details>
<summary><b>Rofi</b></summary>

|Launcher|Wallpaper Picker|
|--|--|
|![img](./screenshots/asuka/rofi.png)|![img](./screenshots/asuka/wall-picker.png)|

|Power Menu|Wifi Menu|
|--|--|
|![img](./screenshots/asuka/power-menu.png)|![img](./screenshots/asuka/wifi-menu.png)|

|Screenshot Menu|Theme Selector|
|--|--|
|![img](./screenshots/asuka/screenshot-menu.png)|![img](./screenshots/asuka/theme-selector.png)|

|Music Controller|
|--|
|![img](./screenshots/asuka/music-controller.png)|

</details>

##

### Ayanami Rei

<details>
<summary><b>Polybar</b></summary>

![img](./screenshots/ayanami/polybar.png)

</details>

<details>
<summary><b>Rofi</b></summary>

|Launcher|Wallpaper Picker|
|--|--|
|![img](./screenshots/ayanami/rofi.png)|![img](./screenshots/ayanami/wall-picker.png)|

|Power Menu|Wifi Menu|
|--|--|
|![img](./screenshots/ayanami/power-menu.png)|![img](./screenshots/ayanami/wifi-menu.png)|

|Screenshot Menu|Theme Selector|
|--|--|
|![img](./screenshots/ayanami/screenshot-menu.png)|![img](./screenshots/ayanami/theme-selector.png)|

|Music Controller|
|--|
|![img](./screenshots/ayanami/music-controller.png)|

</details>

---

## Spesifikasi Sistem & Komponen

| Komponen | Aplikasi / Aset yang Digunakan |
| :--- | :--- |
| **OS Base** | Linux Mint (XFCE Edition) |
| **Window Manager** | i3wm / i3-gaps |
| **Status Bar** | Polybar |
| **Application Launcher** | Rofi |
| **Notification Daemon** | Dunst |
| **Terminal Emulator** | WezTerm |
| **Shell Prompt** | Zsh + Starship Prompt |
| **Compositor (Blur/Transparansi)** | Picom |
| **Wallpaper Engine** | Nitrogen |
| **Main Font** | JetBrainsMono Nerd Font |

---

## Cara Instalasi (Installation)

> [!WARNING]
> Harap cadangkan (*backup*) konfigurasi asli Anda di folder `~/.config` sebelum menyalin dotfiles ini untuk menghindari hilangnya data setelan lama.

### 1. Clone Repository
```bash
git clone https://github.com/DanAldiansyah/i3-dots.git
cd i3-dots

```

### 2. Install Package Pendukung

```bash
sudo apt update
sudo apt install i3 polybar rofi picom dunst cava fastfetch nitrogen scrot zsh thunar

```
> [!NOTE]
> Pastikan Anda sudah menginstal **WezTerm** dan **Starship Prompt** secara terpisah sesuai dokumentasi resminya).

### 3. Salin File Konfigurasi

```bash
mkdir -p ~/.config ~/Pictures/i3-wallpapers

# Copy file konfigurasi
cp -r i3 polybar rofi picom dunst wezterm cava fastfetch starship ~/.config/

# Inisialisasi symlink tema default
ln -sf ~/.config/rofi/themes/asuka.rasi ~/.config/rofi/current-theme.rasi
ln -sf ~/.config/dunst/themes/asuka.dunstrc ~/.config/dunst/dunstrc

# Salin Kumpulan Wallpaper
cp i3-wallpapers/* ~/Pictures/i3-wallpapers

```

### 4. Berikan Izin Eksekusi Skrip (*Chmod*)

```bash
chmod +x ~/.config/rofi/scripts/*.sh
chmod +x ~/.config/dunst/scripts/*.sh

```

---

## Pintasan Keyboard Utama (Keybindings)

> [!NOTE]
> Tombol `Mod` pada setup ini dikonfigurasi menggunakan tombol **Super** (Tombol Windows).

### Manajemen Jendela & Workspace

| Kombinasi Tombol | Fungsi / Aksi | Aplikasi |
| --- | --- | --- |
| `Mod + (1-5)` | Berpindah Workspace | i3wm |
| `Mod + SHIFT + (1-5)` | Pindahkan jendela aktif ke Workspace lain | i3wm |
| `Mod + Arrow (Up/Right/Down/Left)` | Mengubah fokus jendela aktif | i3wm |
| `Ctrl + Arrow (Up/Right/Down/Left)` | Mengubah ukuran (*resize*) jendela | i3wm |
| `Mod + Shift + Space` | Mengaktifkan mode Floating Window | i3wm |
| `Mod + Q` | Menutup jendela yang sedang aktif | i3wm |
| `Mod + Shift + C` | Memuat ulang konfigurasi (*Reload*) | i3wm |
| `Mod + Shift + R` | Memuat ulang sesi i3wm (*Restart sesi*) | i3wm |

### Peluncur Aplikasi & Alat Pintas

| Kombinasi Tombol | Fungsi / Aksi | Aplikasi Pendukung |
| --- | --- | --- |
| `Mod + Enter` | Membuka Terminal Emulator | WezTerm |
| `Mod + R` | Membuka Menu Peluncur Aplikasi | Rofi Launcher |
| `Mod + W` | Membuka Menu Pemilih Wallpaper (Visual Grid) | Rofi Wallpaper Script |
| `Mod + E` | Membuka Menu Kontrol Daya (Powermenu) | Rofi Powermenu Script |
| `Mod + M` | Membuka Kontroler Musik | Rofi Music Script |
| `Mod + T` | Membuka Menu Pemilih Tema | Rofi Theme Script |
| `Mod + B` | Membuka Web Browser | Brave Origin |
| `Mod + N` | Membuka Pengatur Jaringan Internet | nmcli / nmtui |

### Tangkapan Layar (Screenshots)

| Kombinasi Tombol | Fungsi / Aksi | Aplikasi |
| --- | --- | --- |
| `PrintScreen` | Membuka Menu Screenshot | Scrot |

---