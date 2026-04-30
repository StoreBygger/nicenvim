return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("henrik.config.lualine")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("henrik.config.bufferline")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		keys = {
			{ "<leader>o", false },
			{ "<leader>e", false },
			{ "<C-t>t", "<cmd>Neotree toggle right<cr>", desc = "Toggle Neotree explorer" },
			{ "<C-t>f", "<cmd>Neotree focus<cr>", desc = "Focus Neotree" },
			{ "<C-t>b", "<cmd>Neotree buffers<cr>", desc = "Neo tree open buffers" },
			{ "<C-t>F", "<cmd>Neotree toggle float<cr>", desc = "Open Neotree float" },
			{ "<C-t>g", "<cmd>Neotree git_status<cr>", desc = "Neo Tree git status" },
			{ "<C-t>c", "<cmd>Neotree action=close<cr>", desc = "Close neo tree" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"s1n7ax/nvim-window-picker",
			"antosha417/nvim-lsp-file-operations",
			"folke/snacks.nvim",
		},
		config = function()
			require("henrik.config.neo-tree")
		end,
	},
	{
		"s1n7ax/nvim-window-picker",
		version = "2.*",
		opts = {
			hint = "floating-big-letter",
			filter_rules = {
				include_current_win = false,
				autoselect_one = true,
				bo = {
					filetype = { "neo-tree", "neo-tree-popup", "notify" },
					buftype = { "terminal", "quickfix" },
				},
			},
		},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			image = {
				enabled = true,
				math = {
					enabled = false,
				},
				doc = {
					enabled = false,
				},
			},
			rename = { enabled = true },
			bigfile = {
				notify = true,
				size = 1.5 * 1024 * 1024, -- 1,5 MB
				line_length = 1000,
			},
			dashboard = { enabled = true },
			input = {
				enabled = true,
				position = "float",
				border = true,
				title_pos = "center",
			},
			lazygit = { enabled = true },
			notifier = { enabled = false },
			quickfile = { enabled = true },
			picker = {
				enabled = true,
			},
		},
		config = function(_, opts)
			require("snacks").setup(opts)
		end,
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics_split toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics_split toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
		config = function()
			require("henrik.config.trouble")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "BufReadPost",
		---@module "ibl"
		---@type ibl.config
		opts = {
			indent = {
				char = "│",
			},
			scope = {
				enabled = true,
				highlight = {
					"RainbowRed",
					"RainbowYellow",
					"RainbowBlue",
					"RainbowOrange",
					"RainbowGreen",
					"RainbowViolet",
					"RainbowCyan",
				},
			},
		},
		config = function(_, opts)
			local hooks = require("ibl.hooks")

			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
				vim.api.nvim_set_hl(0, "IblScope", { bold = true })
			end)
			vim.g.rainbow_delimiters = { highlight = opts.scope.highlight }
			require("ibl").setup(opts)

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("henrik.config.noice")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		cmd = {
			"ToggleTerm",
			"TermExec",
			"TermSelect",
			"TermNew",
			"ToggleTermSetName",
			"ToggleTermToggleAll",
		},
		keys = {
			{ [[<c-\>]], "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
		},
		opts = {
			start_in_insert = true,
			persist_mode = true,
			direction = "horizontal",
			shade_terminals = false,
		},
	},
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		init = function()
			vim.opt.laststatus = 3
			vim.opt.splitkeep = "screen"
		end,
		opts = {
			close_when_all_hidden = false,
			wo = {
				winbar = true,
				winhighlight = "WinSeparator:EdgySeparator",
			},
			keys = {
				["[w"] = function(win)
					win:prev()
				end,
				["]w"] = function(win)
					win:next()
				end,
				["q"] = function(win)
					win:close()
				end,
			},
			bottom = {
				{
					ft = "toggleterm",
					title = function()
						local id = vim.b.toggle_number or "?"
						local name = vim.b.term_title or "Terminal"
						return ("Term %s: %s"):format(id, name)
					end,
					size = { height = 0.1 },
					filter = function(_, win)
						return vim.api.nvim_win_get_config(win).relative == ""
					end,
				},
				{
					ft = "trouble",
					title = "Diagnostics",
					filter = function(_, win)
						return vim.w[win].trouble
							and vim.w[win].trouble.position == "bottom"
							and vim.w[win].trouble.type == "split"
							and vim.w[win].trouble.relative == "editor"
							and not vim.w[win].trouble_preview
					end,
				},
			},
		},
	},
}
