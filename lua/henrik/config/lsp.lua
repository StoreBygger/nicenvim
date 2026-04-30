local map = vim.keymap.set

-- Fine defaults for diagnostics
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Buffer-local keymaps når LSP faktisk er aktiv
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local opts = { buffer = bufnr, silent = true }

		map("n", "gd", vim.lsp.buf.definition, opts)
		map("n", "gD", vim.lsp.buf.declaration, opts)
		map("n", "gr", vim.lsp.buf.references, opts)
		map("n", "gi", vim.lsp.buf.implementation, opts)
		map("n", "K", vim.lsp.buf.hover, opts)
		map("n", "<leader>rn", vim.lsp.buf.rename, opts)
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		map("n", "<leader>fd", vim.diagnostic.open_float, opts)
		map("n", "[d", function()
			vim.diagnostic.jump({ count = -1 })
		end, opts)

		map("n", "]d", function()
			vim.diagnostic.jump({ count = 1 })
		end, opts)
	end,
})

-- Capabilities (senere kan du merge inn cmp_nvim_lsp hvis du vil)
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- blink.cmp capabilities
local ok, blink = pcall(require, "blink.cmp")
if ok then
	capabilities = blink.get_lsp_capabilities(capabilities)
end

-- KUN FOR NVIM_CMP
-- local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
-- if ok then
-- 	capabilities = cmp_lsp.default_capabilities(capabilities)
-- end

local ok_ops, lsp_ops = pcall(require, "lsp-file-operations")
if ok_ops then
	capabilities = vim.tbl_deep_extend("force", capabilities, lsp_ops.default_capabilities())
end

-- Lua
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					vim.fn.stdpath("config"),
				},
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

-- C / C++
vim.lsp.config("clangd", {
	capabilities = capabilities,
})

-- Python
vim.lsp.config("basedpyright", {
	capabilities = capabilities,
})

-- Bash
vim.lsp.config("bashls", {
	capabilities = capabilities,
})

-- HTML
vim.lsp.config("html", {
	capabilities = capabilities,
})

-- CSS
vim.lsp.config("cssls", {
	capabilities = capabilities,
})

-- JSON
vim.lsp.config("jsonls", {
	capabilities = capabilities,
})

-- Markdown
vim.lsp.config("marksman", {
	capabilities = capabilities,
})

-- LaTeX
vim.lsp.config("texlab", {
	capabilities = capabilities,
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
			forwardSearch = {
				executable = "zathura",
				args = { "--synctex-forward", "%l:1:%f", "%p" },
			},
			chktex = {
				onOpenAndSave = true,
				onEdit = false,
			},
		},
	},
})

-- Docker
vim.lsp.config("dockerls", {
	capabilities = capabilities,
})

-- qmlls
vim.lsp.config("qmlls", {
	cmd = { "qmlls6" },
	filetypes = { "qml", "qmljs" },
	capabilities = capabilities,
})
