local status, lazygit = pcall(require, "gitblame")
if not status then
	return
end

vim.cmd([[
let g:gitblame_date_format = '%r'
]])
