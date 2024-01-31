local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder() then
	config = wezterm.config_builder()
end

function schemeForAppearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Macchiato"
	else
		return "Catppuccin Latte"
	end
end

config.color_scheme = schemeForAppearance(wezterm.gui.get_appearance())

config.font = wezterm.font_with_fallback({
	{
		family = "Rec Mono Custom",
		-- family = "Maple Mono",
	},
	{
		family = "Symbols Nerd Font Mono",
	},
})

config.font_size = 14
-- config.front_end = "OpenGL"
config.freetype_load_flags = "NO_HINTING|NO_AUTOHINT"

config.use_cap_height_to_scale_fallback_fonts = true

config.window_padding = {
	left = 6,
	bottom = 6,
	right = 6,
	top = 6,
}

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

return config
