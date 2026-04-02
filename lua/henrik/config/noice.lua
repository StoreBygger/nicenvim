require("noice").setup({
	cmdline = {
		enabled = true,
		view = "cmdline_popup",
	},

	views = {
		cmdline_popup = {
			position = {
				row = 5,
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
			-- win_options = {
			-- 	winhighlight = {
			-- 		Normal = "DiagnosticSignInfo",
			-- 		FloatBorder = "DiagnosticSignInfo",
			-- 	},
			-- },
		},
		popupmenu = {
			relative = "editor",
			position = {
				row = 8,
				col = "50%",
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = "rounded",
				padding = { 0, 1 },
			},
			-- win_options = {
			-- 	winhighlight = { Normal = "DiagnosticSignInfo", FloatBorder = "FloatBorder" },
			-- },
		},

		mini_notify = {
			backend = "notify",
			format = "message",
			timeout = 1000,
			replace = true,
			merge = true,
		},
	},

	routes = {
		{
			view = "notify",
			filter = {
				event = "msg_showmode",
				find = "recording",
			},
		},
		{
			filter = {
				event = "msg_showmode",
			},
			opts = { skip = true },
		},
	},
})

require("notify").setup({
	stages = "fade",
	background_color = "#000000",
	render = "wrapped-compact",
	timeout = 1200,
})
