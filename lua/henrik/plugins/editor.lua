return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"Shatur/neovim-session-manager",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local config = require("session_manager.config")
			require("session_manager").setup({
				sessions_dir = vim.fn.expand("~/.config/nvim/sessions/"),
				autoload_mode = config.AutoloadMode.Disabled,
				autosave_last_session = true,
				autosave_only_in_session = false,
				autosave_ignore_not_normal = true,
				autosave_ignore_filetypes = {
					"gitcommit",
					"gitrebase",
				},
			})
		end,
	},
}
