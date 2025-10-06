local wezterm = require 'wezterm'

local colors = require 'configs.colors'

local act = wezterm.action
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.window_frame = {
    font = wezterm.font{ family = 'Comic Code Ligatures' },
    font_size = 11, 
}

config.font = wezterm.font{ family = 'Comic Code Ligatures' }
config.font_size = 13

--config.color_scheme = 'Vs Code Dark+'
config.colors = colors
config.automatically_reload_config = true

leader = 'CTRL|ALT'

return config
