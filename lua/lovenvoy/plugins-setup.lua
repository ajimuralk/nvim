-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to instal
return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	use("shaunsingh/nord.nvim")

	use({ "kaicataldo/material.vim", branch = "main" })

	use("bluz71/vim-nightfly-guicolors")

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("szw/vim-maximizer") -- maximizes and restores current window

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings
	use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- file explorer
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	})

	-- vs-code like icons
	use("kyazdani42/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	--
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			{ "BurntSushi/ripgrep" },
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	})
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use({ "hrsh7th/cmp-cmdline" })

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets
	use({ "hrsh7th/vim-vsnip" })
	use({ "hrsh7th/cmp-vsnip" })

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
--use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
use({
  "nvimtools/none-ls.nvim",      -- new home
  requires = { "nvim-lua/plenary.nvim" },
})

use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	use("lewis6991/impatient.nvim")

	use("goolord/alpha-nvim")

	use("f-person/git-blame.nvim")

	-- markdown preview
	use({ "toppair/peek.nvim", run = "deno task --quiet build:fast" })

	-- markdown previewer
	use({ "OXY2DEV/markview.nvim", lazy = false })

	-- fold
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- vim.api.nvim_create_autocmd({ "FileType" }, {
	-- 	callback = function()
	-- 		if require("nvim-treesitter.parsers").has_parser() then
	-- 			vim.opt.foldmethod = "expr"
	-- 			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	-- 		else
	-- 			vim.opt.foldmethod = "syntax"
	-- 		end
	-- 	end,
	-- })
  --

  use({
  "CopilotC-Nvim/CopilotChat.nvim",
  requires = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },
  config = function()
    require("CopilotChat").setup({
      debug = true,
      show_help = true,
      prompts = {
        Explain = "Explain how it works by English language.",
        Review = "Review the following code and provide concise suggestions.",
        Tests = "Briefly explain how the selected code works, then generate unit tests.",
        Refactor = "Refactor the code to improve clarity and readability.",
      },
      -- Optionally set proxy and build functions if necessary
      proxy = "******", -- Optional: Set your proxy if needed
      build = function()
        vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
      end,
    })
  end,
})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
