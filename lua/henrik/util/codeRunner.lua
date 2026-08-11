local M = {}

local fileInfo = {
	fileType = "",
	runMode = "buffer", --- buffer = whole buffer, file = file for file
	file = "",
	root = "",
}

local cfg = {
	browser = "firefox",
	atoDetectFileRunning = true,
	rootFileMarkers = { "Makefile", ".git" },
	mainFileMarkers = { "main", "init" },
	ignoredDirs = {
		[".git"] = true,
		["node_modules"] = true,
		["build"] = true,
		["dist"] = true,
		[".cache"] = true,
		[".build"] = true,
	},
}
local arguments = {}

local fileTypes = {
	c = {
		name = "c",
		mode = "c", --- c = compile, r = run, m = must have Makefile
		ext = "c",
		cc = "gcc",
		cflags = "-Wall",
		autoDetect = true,
	},
	avr = {
		name = "avr",
		mode = "m",
		ext = "c",
		autoDetect = false,
	},
	python = {
		name = "python",
		mode = "r", --- c = compile, r = run
		ext = "py",
		cmd = "python3",
		autoDetect = true,
	},
	lua = {
		name = "lua",
		mode = "r", --- c = compile, r = run
		ext = "lua",
		cmd = "lua",
		autoDetect = true,
	},
	bash = {
		name = "bash",
		mode = "r", --- c = compile, r = run
		ext = "sh",
		cmd = "bash",
		autoDetect = true,
	},
}

local function findRoot()
	local file = vim.api.nvim_buf_get_name(0)
	if file == "" then
		file = vim.loop.cwd()
	end
	local start = (vim.fn.isdirectory(file) == 1) and file or vim.fs.dirname(file)
	local found = vim.fs.find(cfg.rootFileMarkers, { upward = true, path = start })[1]
	if not found then
		return start
	end
	return vim.fs.dirname(found)
end

local function findMain(root)
	root = root or findRoot()

	local current_file = vim.api.nvim_buf_get_name(0)
	local ft = fileTypes[fileInfo.fileType]

	if not ft then
		return current_file
	end

	local found = vim.fs.find(function(name, path)
		-- ignorer filer inni ignored dirs
		for parent in vim.fs.parents(path) do
			local dirname = vim.fs.basename(parent)

			if cfg.ignoredDirs[dirname] then
				return false
			end
		end

		-- split filnavn/ext
		local base, ext = name:match("^(.-)%.([^%.]+)$")

		if not base then
			return false
		end

		-- feil extension
		if ext ~= ft.ext then
			return false
		end

		-- main/init
		for _, marker in ipairs(cfg.mainFileMarkers) do
			if base == marker then
				return true
			end
		end

		return false
	end, {
		path = root,
		type = "file",
		upward = false,
	})[1]

	return found or current_file
end

local function autoSetExt()
	local file = vim.api.nvim_buf_get_name(0)
	local ext = vim.fn.fnamemodify(file, ":e")

	for _, ft in pairs(fileTypes) do
		if ft.autoDetect and ft.ext == ext then
			fileInfo.fileType = ft.name
			vim.notify(ft.name)
			return true
		end
	end

	return false
end

local function changeFileType(file)
	fileInfo.fileType = file.name
end

local function findFileNRunMode()
	autoSetExt()
	fileInfo.root = findRoot()
	fileInfo.file = findMain()

	vim.notify(tostring(fileInfo.root), vim.log.levels.INFO)
	vim.notify(tostring(fileInfo.file), vim.log.levels.INFO)
end

local function makeRunningCommand()
	if not fileInfo.fileType then
		return "false"
	end

	local ft = fileTypes[fileInfo.fileType]

	if ft.mode ~= "r" then
		return "false"
	end

	local runCmd = ft.cmd

	local runArgs = ""

	if arguments[ft.ext] then
		runArgs = arguments[ft.ext]
	end

	vim.notify("RunCMD: " .. runCmd .. " " .. fileInfo.file .. " " .. runArgs)
	return runCmd .. fileInfo.file .. runArgs
end

function M.askFileType()
	local choices = vim.tbl_values(fileTypes)
	vim.ui.select(choices, {
		prompt = "Select which filetype: ",
		format_item = function(item)
			return item["name"]
		end,
	}, function(choice)
		if choice then
			changeFileType(choice)
		end
	end)
end

function M.askRunMode()
	local choices = { "Buffer", "Single file" }
	vim.ui.select(choices, {
		prompt = "Select which run mode: ",
		format_item = function(item)
			return item
		end,
	}, function(choice)
		if choice then
			fileInfo.runMode = choice
		end
	end)
end

function M.run()
	vim.notify("run start", vim.log.levels.INFO)
	if cfg.atoDetectFileRunning then
		findFileNRunMode()
	end

	vim.notify(tostring(makeRunningCommand()), vim.log.levels.INFO)
	vim.notify("run finished", vim.log.levels.INFO)
end

function M.startup()
	findFileNRunMode()
end

function M.setup()
	vim.keymap.set("n", "<C-r>r", function()
		M.run()
	end)
	vim.keymap.set("n", "<C-r>cr", function()
		M.askRunMode()
	end)
	vim.keymap.set("n", "<C-r>cf", function()
		M.askFileType()
	end)
end
return M
