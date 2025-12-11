local wezterm = require 'wezterm'

local colors = require 'configs.colors'

local act = wezterm.action
local mux = wezterm.mux
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.window_decorations = "RESIZE"

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

config.initial_cols = 120
config.initial_rows = 28

config.window_frame = {
    font = wezterm.font_with_fallback({
        'Comic Code Ligatures',
        'Comic Shanns Mono Nerd Font'
    }),
    font_size = 11, 
}

config.font = wezterm.font_with_fallback({
        'Comic Code Ligatures',
        'Comic Shanns Mono Nerd Font'
})
config.font_size = 15

config.front_end = "Software"

config.colors = colors
config.window_background_opacity = 0.95
config.window_background_gradient = {
    colors = {
        '#1e1e1e',
        '#1e1e1e',
    }
}

leader = 'CTRL|ALT'

return config
