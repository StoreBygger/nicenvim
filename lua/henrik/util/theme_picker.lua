local M = {}

M.transparent = false

local function set_hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

function M.apply_overrides()
	if M.transparent then
		set_hl("Normal", { bg = "none" })
		set_hl("NormalNC", { bg = "none" })
		set_hl("NormalFloat", { bg = "none" })
		set_hl("FloatBorder", { fg = "#89b4fa", bg = "none" })
		set_hl("SignColumn", { bg = "none" })
		set_hl("EndOfBuffer", { bg = "none" })
		set_hl("StatusLine", { bg = "none" })
		set_hl("StatusLineNC", { bg = "none" })
		set_hl("LineNr", { bg = "none" })
		set_hl("CursorLineNr", { bg = "none" })
		set_hl("NeoTreeNormal", { bg = "none" })
		set_hl("NeoTreeNormalNC", { bg = "none" })
		set_hl("DiagnosticSignInfo", { bg = "none" })
	end

	-- set_hl("FloatBorder", { fg = "#7aa2f6", bg = M.transparent and "none" or nil })
end

function M.set_colorscheme(name)
	vim.cmd.colorscheme(name)
	M.apply_overrides()
end

function M.toggle_transparency()
	M.transparent = not M.transparent
	if M.transparent then
		M.apply_overrides()
	else
		local current = vim.g.colors_name
		if current and current ~= "" then
			vim.cmd.colorscheme(current)
		end
	end
	M.apply_overrides()
	vim.notify("Transparency: " .. (M.transparent and "on" or "off"), vim.log.levels.INFO)
end

function M.open_picker()
	Snacks.picker.colorschemes({
		layout = {
			preset = "vscode",
		},
		preview = true,
		confirm = function(picker, item)
			picker:close()
			picker.preview.state.colorscheme = nil
			if item and item.text then
				M.set_colorscheme(item.text)
			end
		end,
	})
end

function M.setup()
	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = function()
			M.apply_overrides()
		end,
	})
end

return M
