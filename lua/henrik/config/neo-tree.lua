require("neo-tree").setup({
	close_if_last_window = true,
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,

	filesystem = {
		hijack_netrw_behavior = "open_default",
		filtered_items = {
			visible = false,
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_hidden = false,
		},
		follow_current_file = {
			enabled = true,
			leave_dirs_open = false,
		},
		use_libuv_file_watcher = true,
		window = {
			position = "right",
			width = 24,
			mappings = {
				["<space>"] = "none",
				["<cr>"] = "open",
				["l"] = "open",
				["h"] = "close_node",
				["z"] = "close_all_nodes",
				["R"] = "refresh",
				["a"] = "add",
				["A"] = "add_directory",
				["d"] = "delete",
				["r"] = "rename",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["c"] = "copy",
				["m"] = "move",
				["q"] = "close_window",
				["P"] = { "toggle_preview", config = { use_float = true, use_snacks_image = true } },
				["w"] = "open_with_window_picker",
				["s"] = "open_split",
				["v"] = "open_vsplit",
			},
		},
	},

	buffers = {
		follow_current_file = {
			enabled = true,
			leave_dirs_open = false,
		},
		group_empty_dirs = true,
		show_unloaded = true,
		window = {
			position = "right",
			width = 24,
		},
	},

	git_status = {
		window = {
			position = "float",
		},
	},

	default_component_configs = {
		container = {
			enable_character_fade = true,
		},
		indent = {
			with_expanders = true,
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "󰜌",
			default = "*",
		},
		modified = {
			symbol = "[+]",
		},
		git_status = {
			symbols = {
				added = "",
				deleted = "",
				modified = "",
				renamed = "➜",
				untracked = "?",
				ignored = "",
				unstaged = "!",
				staged = "",
				conflict = "",
			},
		},
		diagnostics = {
			symbols = {
				hint = "H",
				info = "I",
				warn = "W",
				error = "E",
			},
		},
	},

	window = {
		mappings = {
			["<esc>"] = "cancel",
		},
	},
})
