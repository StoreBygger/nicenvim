require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = require("gitsigns")

		local function map(mode, l, r)
			vim.keymap.set(mode, l, r, { buffer = bufnr })
		end

		-- navigasjon
		map("n", "]h", gs.next_hunk)
		map("n", "[h", gs.prev_hunk)

		-- actions
		map("n", "<leader>hs", gs.stage_hunk)
		map("n", "<leader>hr", gs.reset_hunk)

		map("n", "<leader>hS", gs.stage_buffer)
		map("n", "<leader>hu", gs.undo_stage_hunk)

		map("n", "<leader>hp", gs.preview_hunk)

		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)
	end,
})
