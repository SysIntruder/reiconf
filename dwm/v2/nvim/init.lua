vim.pack.add({
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/brenoprata10/nvim-highlight-colors",
})
require("nvim-highlight-colors").setup({ render = "virtual" })
require("statusline")

vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "Tmux navigate left" })
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "Tmux navigate down" })
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "Tmux navigate up" })
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "Tmux navigate right" })

require("vim._core.ui2").enable()

vim.cmd.packadd("nvim.undotree")
vim.keymap.set("n", "<leader>u", ":Undotree<CR>", { desc = "Undotree" })

require("options")
require("keymaps")
require("autocmd")

require("lsp")
require("formatter")
require("diagnostic")

require("paircmp")

require("netrw")
vim.keymap.set("n", "-", "<cmd>Explore<CR>", { noremap = true, desc = "Netrw" })

require("pickers")
vim.keymap.set("n", "<leader>fb", ":buffer<Space>", { noremap = true, desc = "Find buffer" })
vim.keymap.set("n", "<leader>ff", ":FindFile<Space>", { noremap = true, desc = "Find file" })
vim.keymap.set("n", "<leader>fw", ":FindWord<Space>", { noremap = true, desc = "Find word" })

