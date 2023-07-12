-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- fonts
config.font = wezterm.font {
  family = 'CaskaydiaCove Nerd Font',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}

-- tab bar
-- config.hide_tab_bar_if_only_one_tab = true

-- remove title bar
config.window_decorations = "NONE"

-- background
config.window_background_opacity = 0.8

-- and finally, return the configuration to wezterm
return config
