vim.pack.add({
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/christoomey/vim-tmux-navigator",
})
require("options")
require("keymaps")
require("autocmd")

require("statusline")
vim.api.nvim_set_hl(0, "TabLineSel", {
	bg = "NvimDarkGray4",
})

vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "Tmux navigate left" })
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "Tmux navigate down" })
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "Tmux navigate up" })
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "Tmux navigate right" })

require("vim._core.ui2").enable({
	msg = {
		targets = {
			[""] = "msg",
			empty = "msg",
			bufwrite = "msg",
			echo = "msg",
			echomsg = "msg",
			shell_ret = "msg",
			undo = "msg",
			wmsg = "msg",
			completion = "msg",
			confirm = "dialog",
			confirm_sub = "dialog",
			echoerr = "msg",
			emsg = "msg",
			list_cmd = "pager",
			lua_error = "msg",
			lua_print = "msg",
			progress = "msg",
			quickfix = "msg",
			rpc_error = "msg",
			search_cmd = "msg",
			search_count = "msg",
			shell_cmd = "msg",
			shell_err = "msg",
			shell_out = "msg",
			typed_cmd = "msg",
			verbose = "pager",
			wildlist = "msg",
		},
		cmd = { height = 0.5 },
		dialog = { height = 0.5 },
		msg = { height = 0.5 },
		pager = { height = 0.5 },
	},
})

vim.cmd.packadd("nvim.undotree")
vim.keymap.set("n", "<leader>u", ":Undotree<CR>", { desc = "Undotree" })

require("lsp")
require("formatter")
require("diagnostic")

require("paircmp")
require("session")

require("netrw")
vim.keymap.set("n", "-", "<cmd>Explore<CR>", { noremap = true, desc = "Netrw" })

require("pickers")
vim.keymap.set("n", "<leader>fb", ":buffer<Space>", { noremap = true, desc = "Find buffer" })
vim.keymap.set("n", "<leader>ff", ":FindFile<Space>", { noremap = true, desc = "Find file" })
vim.keymap.set("n", "<leader>fw", ":FindWord<Space>", { noremap = true, desc = "Find word" })

