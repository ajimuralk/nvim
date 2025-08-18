vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("n", "<leader>hh", ":nohl<CR>")
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader><C-s>", "<cmd>:w<CR>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------
--
--Lspsaga
keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>")

--gitblame
keymap.set("n", "<leader>bb", ":GitBlameOpenCommitURL") --  opens the commit URL of commit under the cursor

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- toggle term
keymap.set("n", "<leader>tt", ":ToggleTerm size=20 dir=~/Desktop direction=horizontal<CR>")

-- neotree
keymap.set("n", "<leader>e", ":Neotree reveal<CR>") -- toggle file explorer
keymap.set("n", "<leader>E", ":Neotree close<CR>") -- toggle file explorer with open buffer

--telescope
-- require("telescope").load_extension("live_grep_args")
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find string in current working directory as you type
keymap.set(
	"n",
	"<leader>fs",
	"<cmd>:lua require'telescope'.extensions.live_grep_args.live_grep_args()<cr>",
	{ noremap = true }
)
keymap.set("n", "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<cr>") -- find string in current buffer
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>") -- list recent files
keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>") -- list workspace diagnostics files
keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter<cr>") -- list treesitter symbols

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
keymap.set("n", "<leader>gh", "<cmd>Telescope git_stash<cr>") -- list current changes per file with diff preview ["gs" for git status]

keymap.set("n", "<leader>fb", ":Telescope file_browser<cr>", { noremap = true })

-- other git plugins
keymap.set("n", "<leader>gg", ":LazyGit<cr>", { noremap = true })
keymap.set("n", "<leader>gv", ":DiffviewFileHistory ", { noremap = true })
keymap.set("n", "<leader>go", ":DiffviewOpen ", { noremap = true })
keymap.set("n", "<leader>gV", ":DiffviewClose<cr>", { noremap = true })

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

keymap.set("n", "<leader>fp", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
--local opts = { noremap=true, silent=true }
--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

-- Terminal
--vim.keymap.set('t', 'jk', [[<C-\><C-n>]])
keymap.set("n", "<leader>T", "<cmd>:terminal<cr>")
