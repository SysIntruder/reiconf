vim.api.nvim_create_autocmd("BufWritePost", {
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

		vim.system(cmd, {
			stdin = stdin,
			text = true,
		}, function(obj)
			if obj.code ~= 0 or not obj.stdout then
				return
			end

			local new_lines = vim.split(obj.stdout, "\n", { plain = true })
			local stdout = table.concat(new_lines, "\n")

			if stdin == stdout then
				return
			end

			vim.schedule(function()
				local view = vim.fn.winsaveview()

				vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, new_lines)
				vim.bo[args.buf].modified = false

				vim.fn.winrestview(view)
			end)
		end)
	end,
})
