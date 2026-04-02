return {
	{
		"saghen/blink.compat",
		opts = {
			impersonate_nvim_cmp = true,
		},
	},
	{
		"micangl/cmp-vimtex",
		ft = { "tex", "bib" },
	},
	{
		"saghen/blink.cmp",
		-- event = "InsertEnter",
		lazy = false,
		version = "1.*",
		dependencies = {
			"saghen/blink.compat",
			"micangl/cmp-vimtex",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			-- "onsails/lspkind.nvim",
			"xzbdmw/colorful-menu.nvim",
		},
		opts = {
			keymap = {
				preset = "default",
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },
				["<C-y>"] = { "select_and_accept", "fallback" },
				["<C-d>"] = { "scroll_documentation_down" },
				["<C-f>"] = { "scroll_documentation_up" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },
				["<Up>"] = { "select_next", "fallback_to_mappings" },
				["<Down>"] = { "select_prev", "fallback_to_mappings" },
				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },

				["<CR>"] = { "accept", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			cmdline = {
				keymap = {
					preset = "cmdline",
				},
				completion = {
					menu = {
						auto_show = true,
					},

					ghost_text = {
						enabled = true,
					},
				},
			},

			completion = {
				trigger = {
					show_on_keyword = true,
				},
				documentation = {
					auto_show = false,
					auto_show_delay_ms = 150,
					window = {
						border = "rounded",
					},
				},
				ghost_text = {
					enabled = true,
					show_with_menu = true,
				},
				menu = {
					auto_show = true,
					border = "rounded",
					draw = {
						treesitter = { "lsp" },
						columns = {
							{ "kind_icon" },
							{ "label", gap = 1 },
							{ "source_name" },
						},
						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
						},
					},
				},
				list = {
					selection = {
						preselect = false, -- ingen verdier valgt automatisk
						auto_insert = false, -- sett verdien valgt automatisk når hovrer over
					},
				},
			},
			snippets = {
				preset = "luasnip",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					vimtex = {
						name = "vimtex",
						module = "blink.compat.source",
					},
				},
			},

			fuzzy = {
				implementation = "prefer_rust_with_warning",
				sorts = {
					"score",
					"sort_text",
					"label",
				},
			},

			signature = {
				enabled = true,
				trigger = {
					enabled = true,
					show_on_keyword = true,
					show_on_trigger_character = true,
					show_on_insert = true,
					show_on_insert_on_trigger_character = true,
				},
				window = {
					border = "rounded",
					treesitter_highlighting = true,
					show_documentation = true,
				},
			},
		},
		config = function(_, opts)
			require("luasnip.loaders.from_vscode").lazy_load()
			require("colorful-menu").setup()
			require("blink.cmp").setup(opts)
		end,
	},
}
