-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.term = "wezterm"

-- Disable tab bar
config.enable_tab_bar = false

-- Window padding in pixel
config.window_padding = {
	left = "2.5cell",
	right = "2.5cell",
	top = "1cell",
	bottom = "1cell",
}

-- material theme darker color scheme
local colors = {
	black = "#212121",
	red = "#f07178",
	green = "#c3e88d",
	yellow = "#ffcb6b",
	blue = "#82aaff",
	magenta = "#c792ea",
	cyan = "#89ddff",
	white = "#eeffff",
}

local colors_bright = {
	black = "#545454",
	red = colors.red,
	green = colors.green,
	yellow = colors.yellow,
	blue = colors.blue,
	magenta = colors.magenta,
	cyan = colors.cyan,
	white = colors.white,
}

local colors_extra = {
	selection_bg = "rgba(97, 97, 97, 0.31)",
}

config.colors = {
	ansi = {
		colors.black,
		colors.red,
		colors.green,
		colors.yellow,
		colors.blue,
		colors.magenta,
		colors.cyan,
		colors.white,
	},

	brights = {
		colors_bright.black,
		colors_bright.red,
		colors_bright.green,
		colors_bright.yellow,
		colors_bright.blue,
		colors_bright.magenta,
		colors_bright.cyan,
		colors_bright.white,
	},

	foreground = colors.white,
	background = colors.black,
	cursor_fg = colors.black,
	cursor_bg = colors.blue,
	cursor_border = colors.blue,
	compose_cursor = colors.yellow,
	selection_fg = "none",
	selection_bg = colors_extra.selection_bg,
	scrollbar_thumb = colors_bright.black,
	split = colors_bright.black,
}

config.default_cursor_style = "BlinkingUnderline"
config.animation_fps = 1
-- Font config
config.font_size = 11 -- in point
config.underline_position = "-1pt" -- adjust underline position
-- config.underline_thickness = "2pt" -- adjustunderline thickness
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } --disable ligatures
config.font = wezterm.font({
	family = "Fira Code Nerd Font Mono",
	weight = "Regular",
})
config.font_rules = {
	{
		intensity = "Half",
		italic = true,
		font = wezterm.font({
			family = "Fira Code Nerd Font Mono",
			weight = "ExtraLight",
			style = "Italic",
		}),
	},
	{
		intensity = "Half",
		italic = false,
		font = wezterm.font({
			family = "Fira Code Nerd Font Mono",
			weight = "ExtraLight",
		}),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "Fira Code Nerd Font Mono",
			weight = "DemiBold",
			style = "Italic",
		}),
	},
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = "Fira Code Nerd Font Mono",
			weight = "DemiBold",
		}),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = "Fira Code Nerd Font Mono",
			-- style = "Italic", -- disable italic
		}),
	},
}

config.window_frame = {
	font = wezterm.font({
		family = "Inter",
		weight = "Regular",
	}),
}

config.enable_wayland = true
config.xcursor_theme = "Bibata-Modern-Ice"

-- and finally, return the configuration to wezterm
return config
