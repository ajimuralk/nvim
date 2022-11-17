local setup, lualine = pcall(require, "lualine")
if not setup then
	return
end

local lualine_nord = require("lualine.themes.nord")

-- new colors for theme
local new_colors = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
}

-- change nord theme colors
lualine_nord.command = {
	a = {
		gui = "bold",
		bg = new_colors.yellow,
		fg = new_colors.black,
	},
}

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = lualine_nord,
	},
	sections = {
		lualine_c = { {
			"filename",
			file_status = true,
			path = 3,
		} },
	},
})
