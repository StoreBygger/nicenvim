return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		config = function()
			require("henrik.config.gitsigns")
		end,
	},
}
