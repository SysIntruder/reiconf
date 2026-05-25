local session_dir = vim.fn.stdpath("state") .. "/sessions"
if vim.fn.isdirectory(session_dir) == 0 then
	vim.fn.mkdir(session_dir, "p")
end

local function session_name()
	local cwd = vim.fn.getcwd()
	return session_dir .. "/" .. cwd:gsub("/", "%%") .. ".vim"
end

vim.opt.sessionoptions = "buffers,curdir,folds,tabpages,winsize,winpos,terminal,localoptions"

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local session = session_name()
		if vim.fn.filereadable(session) == 1 then
			vim.cmd("silent set winminwidth=1 winwidth=1 winminheight=1 winheight=1")
			vim.cmd("source " .. vim.fn.fnameescape(session))
		end
	end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		local buf_count = 0
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= "" then
				buf_count = buf_count + 1
			end
		end

		if buf_count > 0 then
			vim.cmd("silent mksession! " .. vim.fn.fnameescape(session_name()))
		end
	end,
})

