local session_dir = vim.fn.stdpath("state") .. "/sessions"
if vim.fn.isdirectory(session_dir) == 0 then
	vim.fn.mkdir(session_dir, "p")
end
local cmd_fdfzf = "fd . " .. session_dir .. " --type f | fzf --filter="

local function session_name()
	local cwd = vim.fn.getcwd()
	local pdir, dir = cwd:match("([^/]+)/([^/]+)$")
	pdir = pdir:gsub("%.", "")
	dir = dir:gsub("%.", "")
	return pdir .. "_" .. dir .. ".vim"
end

vim.opt.sessionoptions = "buffers,curdir,folds,tabpages,winsize,winpos,terminal,localoptions"

vim.api.nvim_create_user_command("SessionSave", function(opts)
	local buf_count = 0
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= "" then
			buf_count = buf_count + 1
		end
	end
	if buf_count == 0 then
		return
	end

	local session = opts.args
	if session == "" or vim.fn.filereadable(session) == 0 then
		session = session_name()
	end

	session = session_dir .. "/" .. session
	vim.cmd("mksession! " .. vim.fn.fnameescape(session))
	vim.notify('session "' .. session .. '" saved')
end, {
	nargs = "?",
	complete = function()
		local name = session_name()
		return { name }
	end,
})

vim.api.nvim_create_user_command("SessionLoad", function(opts)
	local session = opts.args
	if session == "" or vim.fn.filereadable(session) == 0 then
		return
	end

	vim.cmd("silent set winminwidth=1 winwidth=1 winminheight=1 winheight=1")
	vim.cmd("source " .. vim.fn.fnameescape(session))
end, {
	nargs = 1,
	complete = function(cmdarg)
		return vim.fn.systemlist(cmd_fdfzf .. vim.fn.shellescape(cmdarg))
	end,
})

