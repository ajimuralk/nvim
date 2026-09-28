local status, lazygit = pcall(require, "lazygit")
if not status then
	return
end

local keymap = vim.keymap -- for conciseness

local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }
	-- set keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
end

vim.cmd([[
let g:lazygit_floating_window_winblend = 0 " -- transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " -- scaling factor for floating window
let g:lazygit_floating_window_border_corners = ['╭', '╮', '╰', '╯'] " -- customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " -- use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " --fallback to 0 if neovim-remote is not installed
]])

-- open files from lazygit's `e` in the window lazygit was launched from (see os.edit in lazygit config.yml)
local pending_edit = nil

function LazygitOpenAfterExit(file, line)
	pending_edit = { file = file, line = tonumber(line) or 1 }
	return ""
end

vim.g.lazygit_on_exit_callback = function()
	if not pending_edit then
		return
	end
	local edit = pending_edit
	pending_edit = nil
	vim.schedule(function()
		vim.cmd.edit(vim.fn.fnameescape(edit.file))
		pcall(vim.api.nvim_win_set_cursor, 0, { edit.line, 0 })
		vim.cmd("normal! zz")
	end)
end
