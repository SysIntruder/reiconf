vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = vim.api.nvim_create_augroup("AutoCreateDir", {}),
	callback = function(event)
		if event.match:match("^%w%w+:[/][/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = vim.api.nvim_create_augroup("AutoReloadFile", {}),
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", {}),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

vim.api.nvim_create_autocmd("CmdlineChanged", {
	pattern = ":",
	group = vim.api.nvim_create_augroup("TriggerWildmenu", {}),
	callback = function()
		local cmd = vim.fn.getcmdline()
		if cmd:match("%s$") then
			return
		end
		local last = cmd:match("([^%s]+)$") or ""
		if #last < 4 then
			return
		end
		vim.fn.wildtrigger()
	end,
})

