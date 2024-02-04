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
		family = "IBM Plex Mono",
		weight = 450,
		harfbuzz_features = { "ss01", "ss02", "zero" },
	},
	{
		family = "Symbols Nerd Font Mono",
		scale = 0.75,
	},
})

config.font_size = 14
config.freetype_load_flags = "NO_HINTING|NO_AUTOHINT"

config.window_padding = {
	left = 6,
	bottom = 6,
	right = 6,
	top = 6,
}

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- Make wezterm use WSL 2 Ubuntu
config.default_domain = "WSL:Ubuntu"

config.window_background_opacity = 0.9

return config
