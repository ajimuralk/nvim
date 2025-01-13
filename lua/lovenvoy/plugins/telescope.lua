-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

local lga_actions = require("telescope-live-grep-args.actions")

-- configure telescope
telescope.setup({
	-- configure custom mappings
	defaults = {
		-- layout_strategy = "vertical",
		layout_config = { mirror = false, prompt_position = "bottom" }, -- mirror preview pane },
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
			},
		},
	},
	pickers = {
		find_files = {
			theme = "ivy",
		},
		live_grep = {
			theme = "ivy",
		},
		grep_string = {
			theme = "ivy",
		},
		oldfiles = {
			theme = "ivy",
		},
		git_status = {
			theme = "ivy",
		},
		git_commits = {
			theme = "ivy",
		},
		git_branches = {
			theme = "ivy",
		},
		git_stash = {
			theme = "ivy",
		},
	},
	extensions = {
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			-- define mappings, e.g.
			mappings = { -- extend mappings
				i = {
					["<S-k>"] = lga_actions.quote_prompt(),
					["<S-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
					["<S-t>"] = lga_actions.quote_prompt({ postfix = " -t " }),
					["<S-e>"] = lga_actions.quote_prompt({ postfix = " --type-add 'ex:*.ex' -tex " }),
					["<S-s>"] = lga_actions.quote_prompt({ postfix = " --type-add 'exs:*.exs' -texs " }),
				},
			},
			-- ... also accepts theme settings, for example:
			theme = "ivy", -- use dropdown theme
			-- layout_strategy = "vertical",
			layout_config = { mirror = false, prompt_position = "bottom" }, -- mirror preview pane },
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")
telescope.load_extension("lazygit")
