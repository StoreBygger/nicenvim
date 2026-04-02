require("trouble").setup({
	focus = false,
	follow = true,
	auto_open = false,
	auto_close = false,
	auto_preview = true,
	auto_refresh = true,

	win = {
		position = "bottom",
		size = 4,
		type = "split",
	},

	modes = {
		diagnostics_split = {
			mode = "diagnostics",
			preview = {
				type = "float",
				relative = "editor",
				border = "rounded",
				title = "Preview",
				title_pos = "center",
				position = { 0, -2 },
				size = { width = 0.3, height = 0.3 },
				zindex = 200,
			},
		},
	},
})
