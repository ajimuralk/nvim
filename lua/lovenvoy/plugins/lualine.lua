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

vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
local git_blame = require("gitblame")

local function short_branch()
  local branch = vim.b.gitsigns_head or ''
  if #branch > 15 then
    return branch:sub(1, 20) .. '..'
  end
  return branch
end

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = "nord",
	},
	sections = {
		lualine_b = { short_branch, "diff", "diagnostics" },
		lualine_c = {
			-- {
			-- 	"filename",
			-- 	file_status = true,
			-- 	path = 3,
			-- },
			{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
		},
	},
})
