local wezterm = require 'wezterm'

wezterm.on('gui-startup', function()
 local tab, pane, window = mux.spawn_window({})
 window:gui_window():maximize()
end)

local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 22.0
config.color_scheme = 'Catppuccin Mocha'
config.use_dead_keys = false
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
-- BACKGROUND
local dimmer = { brightness = 0.1 }
config.background = {
    {
        source = {
            File = '/Users/marshar/bg_1.jpg',
        },
        width = '100%',
        repeat_x = 'Mirror',
        hsb = dimmer,
        attachment = { Parallax = 5 },
    }
}
config.window_frame = {
 font = wezterm.font { family = 'Noto Sans', weight = 'Regular' },
}

return config
