local setup, lualine = pcall(require, "lualine")
if not setup then
	return
end

-- new colors for theme
local new_colors = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
}

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = "nord",
	},
	sections = {
		lualine_c = { {
			"filename",
			file_status = true,
			path = 3,
		} },
	},
})
