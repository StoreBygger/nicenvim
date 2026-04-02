vim.opt.clipboard = "unnamedplus" -- use system keyboard for yank
vim.opt.nu = true -- set line numbers -- line numbers
vim.opt.relativenumber = true -- use relative line numbers
-- set tab size to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.incsearch = true -- incremental search
vim.opt.termguicolors = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99 -- start ikke foldet
vim.opt.foldenable = true

vim.opt.scrolloff = 10

-- Ungå konflikter med nvim-tree, og telescope
vim.g.loaded_netrw = 1 -- disable netrw at start of init.lua
vim.g.loaded_netrwPlugin = 1

vim.opt.winborder = "rounded"

-- for theme select see first init.lua
