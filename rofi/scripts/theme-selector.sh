#!/usr/bin/env bash

# Main Directory Path
POLY_THEMES_DIR="$HOME/.config/polybar/themes"
POLY_CURRENT_FILE="$HOME/.config/polybar/current-theme.ini"

ROFI_THEMES_DIR="$HOME/.config/rofi/themes"
ROFI_CURRENT_FILE="$HOME/.config/rofi/current-theme.rasi"
ROFI_SELECTOR_THEME="$HOME/.config/rofi/theme-selector.rasi"

DUNST_THEMES_DIR="$HOME/.config/dunst/themes"
DUNST_CURRENT_FILE="$HOME/.config/dunst/dunstrc"

# Wallpaper Folder (Adjust according to your wallpaper folder location)
WALLPAPER_DIR="$HOME/Pictures/i3-wallpapers"

# Scan Polybar theme folder (e.g., Asuka, Ayanami)
THEMES=$(ls -d "$POLY_THEMES_DIR"/*/ | xargs -n 1 basename)

# Show Rofi Selector Menu
SELECTED_THEME=$(echo -e "$THEMES" | rofi -dmenu -p "Select Full Theme" -theme "$ROFI_SELECTOR_THEME")

if [ -n "$SELECTED_THEME" ]; then
    # Format the name to lowercase (example: Asuka -> asuka)
    THEME_LOWER=$(echo "$SELECTED_THEME" | tr '[:upper:]' '[:lower:]')

    # -------------------------------------------------------------------------
    # A. UPDATE POLYBAR THEME
    # -------------------------------------------------------------------------
    POLY_PATH="$POLY_THEMES_DIR/$SELECTED_THEME"
    SPECIFIC_INI=$(find "$POLY_PATH" -maxdepth 1 -type f -name "*.ini" ! -name "colors.ini" | head -n 1)

    cat <<EOF > "$POLY_CURRENT_FILE"
include-file = $POLY_PATH/colors.ini
include-file = $SPECIFIC_INI
EOF

    # -------------------------------------------------------------------------
    # B. UPDATE ROFI THEME (FORCE SYMLINK)
    # -------------------------------------------------------------------------
    TARGET_ROFI="$ROFI_THEMES_DIR/$THEME_LOWER.rasi"
    if [ -f "$TARGET_ROFI" ]; then
        rm -f "$ROFI_CURRENT_FILE"
        ln -s "$TARGET_ROFI" "$ROFI_CURRENT_FILE"
    fi

    # -------------------------------------------------------------------------
    # C. UPDATE DUNST THEME (FORCE SYMLINK)
    # -------------------------------------------------------------------------
    TARGET_DUNST="$DUNST_THEMES_DIR/$THEME_LOWER.dunstrc"
    if [ -f "$TARGET_DUNST" ]; then
        rm -f "$DUNST_CURRENT_FILE"
        ln -s "$TARGET_DUNST" "$DUNST_CURRENT_FILE"
    fi

    # -------------------------------------------------------------------------
    # D. UPDATE WALLPAPER (NITROGEN)
    # -------------------------------------------------------------------------
    # Look for an image matching the theme name (e.g., ayanami.png, asuka.jpg, etc.)
    WALLPAPER_FILE=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "${THEME_LOWER}.jpg" -o -iname "${THEME_LOWER}.png" -o -iname "${THEME_LOWER}.jpeg" -o -iname "${THEME_LOWER}.webp" \) | head -n 1)

    if [ -n "$WALLPAPER_FILE" ]; then
        nitrogen --set-zoom-fill "$WALLPAPER_FILE" --save
    fi

    # -------------------------------------------------------------------------
    # E. RELOAD SERVICES
    # -------------------------------------------------------------------------
    # Reload Polybar
    polybar-msg cmd restart 2>/dev/null || (killall -q polybar && polybar top &)

    # Reload Dunst
    killall -q dunst
    sleep 0.1
    dunst -config "$HOME/.config/dunst/dunstrc" &

    # Send Success Notification
    notify-send -i dialog-information "System Theme" "Successfully applied theme: $SELECTED_THEME"
fi