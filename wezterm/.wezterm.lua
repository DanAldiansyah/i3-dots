local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- [[ Appearance ]]
config.color_scheme = 'Argonaut' 
-- Themes: "Dracula", "OneHalfDark", "Ayu Dark (Gogh)"

config.font_size = 10.0

-- JetBrains Mono with fallback 
config.font = wezterm.font_with_fallback({
  'JetBrains Mono',
  'Symbols Nerd Font Mono',
})

-- [[ Window Style ]]
config.window_padding = {
  left = 10,
  right = 10,
  top = 5,
  bottom = 5,
}
config.window_background_opacity = 0.8
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- [[ Cursor & Behavior ]]
config.default_cursor_style = 'BlinkingBar'
config.scrollback_lines = 5000
config.initial_cols = 84
config.initial_rows = 22

-- [[ Performa & Fix Glyphs ]]
config.warn_about_missing_glyphs = false
config.animation_fps = 30

return config
