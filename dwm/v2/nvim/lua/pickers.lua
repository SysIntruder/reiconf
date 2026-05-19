local cmd_fdfzf = "fd . --type f | fzf --filter="
local cmd_rg = "rg --vimgrep --smart-case "

vim.api.nvim_create_user_command("FindFile", function(opts)
	local file = opts.args
	if file == "" then
		return
	end
	vim.cmd("edit " .. vim.fn.fnameescape(file))
end, {
	nargs = 1,
	complete = function(cmdarg)
		return vim.fn.systemlist(cmd_fdfzf .. vim.fn.shellescape(cmdarg))
	end,
})

vim.api.nvim_create_user_command("FindWord", function(opts)
	local item = opts.args
	if item == "" then
		return
	end
	local file, line, col = item:match("^(.-):(%d+):(%d+):")
	if file == "" then
		return
	end
	vim.cmd("edit " .. vim.fn.fnameescape(file))
	vim.api.nvim_win_set_cursor(0, { tonumber(line), tonumber(col) - 1 })
end, {
	nargs = "*",
	complete = function(cmdarg)
		return vim.fn.systemlist(cmd_rg .. vim.fn.shellescape(cmdarg))
	end,
})
