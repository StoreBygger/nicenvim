return {
	{
		"lervag/vimtex",
		ft = { "tex", "plaintex", "bib" },
		init = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_view_forward_search_on_start = 0
			vim.g.vimtex_quickfix_mode = 0
		end,
	},
	{
		"richwomanbtc/overleaf.nvim",
		config = function()
			local ok, private_overleaf = pcall(require, "henrik.private.overleaf-cookie")
			if ok then
				require("overleaf").setup({
					cookie = private_overleaf.overleaf_cookie,
					log_level = "debug",
				})
			end
		end,
	},
}
