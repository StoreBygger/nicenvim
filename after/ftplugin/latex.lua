-- highlighting
pcall(vim.treesitter.start)

-- folds
vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt_local.foldmethod = "expr"
