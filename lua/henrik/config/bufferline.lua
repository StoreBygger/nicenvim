require("bufferline").setup({
	options = {
		offsets = {
			filetype = "neo-tree",
			text = "File Explorer",
			highlight = "Directory",
			text_align = "left",
			separator = true,
			highlights = require("catppuccin.special.bufferline").get_theme(),
		},
	},
})
