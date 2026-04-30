return {
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		lazy = true,
		priority = 1000,
		config = function() end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- fast i stedet for "auto"
				-- transparent_background = true,
				-- float = {
				-- 	transparent = true,
				-- 	solid = true,
				-- },
				auto_integrations = true,
				integrations = {
					neotree = true,
					treesitter_context = true,
					rainbow_delimiters = true,
					window_picker = true,
					blink_cmp = {
						style = "rounded",
					},
					style = "rounded",
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			--vim.cmd.colorscheme("tokyonight")
		end,
	},

	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = true,
		priority = 1000,
		config = function() end,
	},

	{
		"navarasu/onedark.nvim",
		name = "onedark",
		style = "warm",
		lazy = true,
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "deep",
				transparent = false,
				term_colors = true,
				ending_tiles = false,
			})
			-- require("onedark").load()
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		priority = 1000,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = true,
		priority = 1000,
	},
	{
		"sainnhe/everforest",
		lazy = true,
		priority = 1000,
	},
	{
		"sainnhe/edge",
		lazy = true,
		priority = 1000,
	},
	{
		"sainnhe/sonokai",
		lazy = true,
		priority = 1000,
	},
	{
		"morhetz/gruvbox",
		lazy = true,
		priority = 1000,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"olimorris/onedarkpro.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"marko-cerovac/material.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"ribru17/bamboo.nvim",
		lazy = true,
		priority = 1000,
	},
}
