-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.plugins = {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = false,
				term_colors = false,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
				},
			})
		end,
	},

	{
		"nvim-neorg/neorg",
		ft = "norg",
		build = ":Neorg sync-parsers",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-cmp",
			"nvim-lua/plenary.nvim",
		},
		cmd = "Neorg",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
					["core.integrations.nvim-cmp"] = {},
					["core.concealer"] = { config = { icon_preset = "diamond" } }, -- Adds pretty icons to your documents
					["core.keybinds"] = {
						config = {
							default_keybinds = true,
							neorg_leader = "<Leader><Leader>",
						},
					},
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/notes",
							},
						},
					},
				},
			})
		end,
	},

	{
		"kevinhwang91/nvim-bqf",
		event = { "BufRead", "BufNew" },
		config = function()
			require("bqf").setup({
				auto_enable = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
				},
				func_map = {
					vsplit = "",
					ptogglemode = "z,",
					stoggleup = "",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
	},

	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
	},

	{
		"abecodes/tabout.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
			backwards_tabkey = "", -- key to trigger backwards tabout, set to an empty string to disable
			act_as_tab = false, -- shift content if tab out is not possible
			act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
			default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
			default_shift_tab = "<C-d>", -- reverse shift default action,
			enable_backwards = true, -- well ...
			completion = false, -- if the tabkey is used in a completion pum
			tabouts = {
				{ open = "'", close = "'" },
				{ open = '"', close = '"' },
				{ open = "`", close = "`" },
				{ open = "(", close = ")" },
				{ open = "[", close = "]" },
				{ open = "{", close = "}" },
				{ open = "<", close = ">" },
			},
			ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
			exclude = {}, -- tabout will ignore these filetypes
		},
	},
}

-- Set colorscheme
lvim.colorscheme = "catppuccin"

-- Remap 'jk' to '<esc>'
lvim.keys.insert_mode["jk"] = "<esc>"
-- ToggleTerm options
lvim.builtin.terminal.open_mapping = "<c-t>"

-- fzf-lua options
lvim.builtin.which_key.mappings["t"] = {
	name = "Fzf-Lua",
	b = { "<cmd>lua require('fzf-lua').buffers()<cr>", "Buffers" },
	g = { "<cmd>lua require('fzf-lua').live_grep()<cr>", "Live Grep" },
	o = { "<cmd>lua require('fzf-lua').oldfiles()<cr>", "Oldfiles" },
	l = { "<cmd>lua require('fzf-lua').lines()<cr>", "Open Buffer Lines" },
	r = { "<cmd>lua require('fzf-lua').lsp_references()<cr>", "References" },
	d = { "<cmd>lua require('fzf-lua').lsp_definitions()<cr>", "Definitions" },
	s = { "<cmd>lua require('fzf-lua').lsp_document_symbols()<cr>", "File Symbols" },
	w = { "<cmd>lua require('fzf-lua').lsp_live_workspace_symbols()<cr>", "Workspace Symbols" },
}

-- nvim-tree options
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
