vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("henrik.core")
require("henrik.config.lazy")

vim.cmd.colorscheme("vaporwave")
local current = vim.g.colors_name
vim.cmd.colorscheme(current)
