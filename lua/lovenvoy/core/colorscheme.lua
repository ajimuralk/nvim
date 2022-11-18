vim.g.nord_italic = false
vim.g.nord_contrast = false
vim.g.nord_borders = true
vim.g.nord_bold = false
vim.g.nord_disable_background = false
vim.g.nord_uniform_diff_background = false
vim.g.nord_enable_sidebar_background = false
vim.g.nord_cursorline_transparent = false

local status, _ = pcall(vim.cmd, "colorscheme nord")
if not status then
	print("Colorscheme not found")
	return
end
