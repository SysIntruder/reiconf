return {
	-- TMUX Integration
	{
		"christoomey/vim-tmux-navigator",
		vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "Tmux navigate left" }),
		vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "Tmux navigate down" }),
		vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "Tmux navigate up" }),
		vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "Tmux navigate right" }),
	},

	-- Undotree
	{
		"mbbill/undotree",
		vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Undotree toggle" }),
	},
}
