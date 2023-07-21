-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- fonts
config.font = wezterm.font {
    family = "CaskaydiaCove Nerd Font",
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
}

-- hide tab bar if only one tab
config.hide_tab_bar_if_only_one_tab = true

-- remove title bar
-- config.window_decorations = "NONE"

-- background opacity
local opacity = 0.8
config.window_background_opacity = opacity

-- toggle opacity
wezterm.on("toggle-opacity", function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.window_background_opacity then
        -- if no override is setup, override the default opacity value with 1.0
        overrides.window_background_opacity = 1.0
    else
        -- if there is an override, make it nil so the opacity goes back to the default
        overrides.window_background_opacity = nil
    end
    window:set_config_overrides(overrides)
end)

config.keys = {
    {
        key = "O",
        mods = "CTRL",
        action = wezterm.action.EmitEvent("toggle-opacity"),
    },
}

-- and finally, return the configuration to wezterm
return config
