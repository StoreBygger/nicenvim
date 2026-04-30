-- vim.g.tex_conceal = ""
-- vim.g.vimtex_syntax_conceal_disable = 1
vim.opt_local.conceallevel = 0
vim.opt_local.concealcursor = ""

-- highlighting
pcall(vim.treesitter.start)

-- folds
vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt_local.foldmethod = "expr"
