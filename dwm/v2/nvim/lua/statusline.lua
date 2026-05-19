require("gitsigns").setup({
	signs = {
		add = { text = "A" },
		untracked = { text = "A" },
		change = { text = "M" },
		changedelete = { text = "M" },
		topdelete = { text = "D" },
		delete = { text = "D" },
	},
	signs_staged = {
		add = { text = "A" },
		untracked = { text = "A" },
		change = { text = "M" },
		changedelete = { text = "M" },
		topdelete = { text = "D" },
		delete = { text = "D" },
	},
	status_formatter = function(status)
		local added, changed, removed = status.added, status.changed, status.removed
		local status_txt = {}
		if added and added > 0 then
			table.insert(status_txt, "%#GitSignsAdd#" .. "A:" .. added)
		end
		if changed and changed > 0 then
			table.insert(status_txt, "%#GitSignsChange#" .. "M:" .. changed)
		end
		if removed and removed > 0 then
			table.insert(status_txt, "%#GitSignsDelete#" .. "D:" .. removed)
		end
		return table.concat(status_txt, " ") .. "%#StatusLine#"
	end,
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function opts(desc)
			return { buffer = bufnr, desc = desc }
		end

		vim.keymap.set("n", "<leader>gh", gs.preview_hunk, opts("Git Hunk"))
		vim.keymap.set("n", "<leader>gb", gs.blame_line, opts("Git Blame"))
	end,
})

vim.opt.statusline = "[%n] " .. vim.opt.statusline:get() .. "%{%get(b:,'gitsigns_status','')%} %-18.(Ln %l, Col %c%) %y"
vim.api.nvim_set_hl(0, "StatusLine", {
	bg = "None",
	ctermbg = "None",
})
vim.api.nvim_set_hl(0, "StatusLineNC", {
	bg = "None",
	ctermbg = "None",
})

