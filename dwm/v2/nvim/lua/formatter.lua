vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = {
		"*.lua",
		"*.ts",
		"*.tsx",
		"*.js",
		"*.jsx",
		"*.vue",
	},
	group = vim.api.nvim_create_augroup("AutoFormat", {}),
	callback = function(args)
		local cmd
		if args.match:match("%.lua$") then
			cmd = {
				"stylua",
				"--search-parent-directories",
				"--respect-ignores",
				"--stdin-filepath",
				args.file,
				"-",
			}
		elseif args.match:match("%.[jt]sx?$") or args.match:match("%.vue$") then
			cmd = {
				"eslint_d",
				"--stdin",
				"--fix-to-stdout",
				"--stdin-filename",
				args.file,
			}
		end

		local old_lines = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)
		local stdin = table.concat(old_lines, "\n")

		vim.opt.busy = 1
		local result = vim.system(cmd, {
			stdin = stdin,
			text = true,
		}):wait()

		if result.code ~= 0 or not result.stdout then
			vim.opt.busy = 0
			return
		end

		local new_lines = vim.split(result.stdout, "\n", { plain = true })
		vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, new_lines)
		vim.opt.busy = 0
	end,
})

