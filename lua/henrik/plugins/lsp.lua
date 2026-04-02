return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("henrik.config.lsp")
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"clangd",
				"basedpyright",
				"bashls",
				"html",
				"cssls",
				"jsonls",
				"marksman",
				"texlab",
				"dockerls",
				"powershell_es",
				"vimls",
			},

			automatic_enable = {
				exclude = {
					-- servere her for å skru på manuelt
				},
			},
			servers = {
				texlab = {
					settings = {
						texlab = {
							build = {
								executable = "latexmk",
								args = {
									"-pdf",
									"-interaction=nonstopmode",
									"-synctex=1",
									"%f",
								},
								onSave = false,
								forwardSearchAfter = false,
							},
							chktex = {
								onOpenAndSave = true,
								onEdit = false,
							},
							forwardSearch = {
								executable = "zathura",
								args = { "--synctex-forward", "%l:1:%f", "%p" },
							},
						},
					},
				},
			},
		},
	},
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
}
