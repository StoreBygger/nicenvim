local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format", "black" },
    c = { "clang_format" },
    cpp = { "clang_format" },

    -- greit å ha når du senere tar dem i bruk
    json = { "prettier" },
    markdown = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
  },

  format_on_save = function(bufnr)
    return {
      timeout_ms = 1000,
      lsp_format = "fallback",
    }
  end,
})
