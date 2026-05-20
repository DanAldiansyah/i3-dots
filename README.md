# Mochi-i3: Catppuccin Mocha i3wm Dotfiles

Selamat datang di repository **i3-dots** saya! Ini adalah konfigurasi lingkungan desktop (*desktop environment/rice*) minimalis berbasis **i3wm** dengan skema warna **Catppuccin Mocha**. 

---

## Pratinjau (Screenshots)
![My i3wm Rice Showcase]
(<img width="1366" height="768" alt="2026-05-20-111955_screenshot" src="https://github.com/user-attachments/assets/91589c40-a82a-4589-8e65-5e8338fcb3f0" />)
(https://github.com/user-attachments/assets/f27b7753-b54f-4a83-bcc8-bd8bb08d4158)

---

## Spesifikasi Sistem & Komponen
Aplikasi dan komponen utama yang digunakan dalam setup ini:
* **OS:** Linux Mint (XFCE Base)
* **WM:** i3wm
* **Status Bar:** Polybar
* **Application Launcher:** Rofi
* **Terminal Emulator:** WezTerm
* **Font:** JetBrainsMono Nerd Font 
* **Compositor:** Picom 
* **Wallpaper Manager:** Nitrogen

---

## Cara Instalasi (Installation)

> **Peringatan:** Harap backup konfigurasi asli Anda di folder `~/.config` sebelum menyalin dotfiles ini.

### 1. Clone Repository

```bash
git clone [https://github.com/DanAldiansyah/i3-dots.git](https://github.com/DanAldiansyah/i3-dots.git)
cd i3-dots

```

```bash
sudo apt install i3 polybar rofi picom nitrogen scrot 
```

```bash
cp -r i3 polybar rofi cava fastfetch picom ~/.config/
```

```bash
chmod +x ~/.config/rofi/scripts/*.sh
```
## Keybindings
- Mod + (1, 2, 3, 4, 5) -> ganti workspace
- Mod + SHIFT + (1, 2, 3, 4, 5) -> pindahkan aktif windows ke workspace lain
- Mod + arrow(up, right, down, left) -> ganti fokus window
- CTRL + arrow(up, right, down, left) -> resize window
- Mod + Enter -> Buka Terminal (WezTerm)
- Mod + q -> Kill
- Mod + r -> Buka Rofi Application Menu
- Mod + w -> Buka Wallpaper Selector Menu
- Mod + e -> Buka Catppuccin Powermenu (Shutdown/Reboot)
- PrintScreen -> Ambil Tangkapan Layar (Screenshot) Area via Scrot/XFCE
- Mod + SPACE -> Floating window
- Mod + Shift + R -> Restart / Reload i3wm Sesi

