-- telescope keybinds
vim.keymap.set("n", "<leader>tf", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>tcs", "<cmd>Telescope colorscheme<cr>", { desc = "Colorscheme" })

vim.keymap.set("n", "<leader>th", function()
	require("telescope.builtin").find_files({
		hidden = true,
		no_ignore = true,
	})
end, { desc = "Find hidden files" })

vim.keymap.set("n", "<leader>tb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>thh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>tr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
vim.keymap.set("n", "<leader>tc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
vim.keymap.set("n", "<leader>ts", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search in buffer" })

-- conform keybinds
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
	})
end, { desc = "Format buffer or range" })

-- remove /<search> patterns
vim.keymap.set({ "n", "v" }, "<leader>n", ":nohlsearch<CR>", { desc = " remove search patterns" })

--BufferLine keymaps
vim.keymap.set("n", "<C-h>", function()
	require("bufferline").cycle(-1)
end, { desc = " move to previous bufferline" })
vim.keymap.set("n", "<C-l>", function()
	require("bufferline").cycle(1)
end, { desc = " move to next bufferline" })
vim.keymap.set("n", "<leader>bp", ":BufferLineTogglePin<CR>", { desc = " toggle bufferline pin" })
vim.keymap.set("n", "<leader>bl", ":BufferLineMoveNext<CR>", { desc = " Move tab left" })
vim.keymap.set("n", "<leader>bh", ":BufferLineMovePrev<CR>", { desc = " Move tab right" })
vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { desc = " Pick tab to go to" })
vim.keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>", { desc = " Pick tab to close" })

-- save file keymaps
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = " save current file" })
vim.keymap.set("n", "<C-a>s", ":wa<CR>", { desc = " save all files" })
vim.keymap.set("n", "<C-a>q", ":qa<CR>", { desc = " quit all files" })

-- theme picker
local theme = require("henrik.util.theme_picker")

vim.keymap.set("n", "<leader>ut", theme.open_picker, { desc = "Open theme picker" })
vim.keymap.set("n", "<leader>uT", theme.toggle_transparency, { desc = "Toggle transparency" })

-- edgy with toggleterm and trouble in it

vim.keymap.set("n", "<leader>tt", "<cmd>TermSelect<cr>", { desc = "Select terminal" })
vim.keymap.set("n", "<leader>tn", "<cmd>TermNew<cr>", { desc = "New terminal" })
vim.keymap.set("n", "<leader>tr", "<cmd>ToggleTermSetName<cr>", { desc = "Rename terminal" })
vim.keymap.set("n", "<leader>te", function()
	require("edgy").select("bottom")
end, { desc = "Select bottom panel" })

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- noice (notifications)
vim.keymap.set("n", "<C-n>p", ":Noice pick<CR>", { desc = "Noice pick - show history" })
vim.keymap.set("n", "<C-n>d", ":Noice dismiss<CR>", { desc = "Noice dismiss messages" })
vim.keymap.set("n", "<C-n>l", ":Noice last<CR>", { desc = "Noice show last message" })
vim.keymap.set("n", "<C-n>e", ":Noice errors<CR>", { desc = "Noice show errors" })

-- session manager
vim.keymap.set("n", "<leader>ss", ":SessionManager save_current_session<CR>", { desc = "Session Save Current" })
vim.keymap.set("n", "<leader>sll", ":SessionManager load_last_session<CR>", { desc = "Session Load Last" })
vim.keymap.set("n", "<leader>sls", ":SessionManager load_session<CR>", { desc = "Session Load Session" })
vim.keymap.set("n", "<leader>slg", ":SessionManager load_git_session<CR>", { desc = "Session Load Git Session" })
vim.keymap.set(
	"n",
	"<leader>slc",
	":SessionManager load_current_dir_session<CR>",
	{ desc = "Session Load CWD Session" }
)
vim.keymap.set("n", "<leader>sd", ":SessionManager delete_session<CR>", { desc = "Session Delete" })
