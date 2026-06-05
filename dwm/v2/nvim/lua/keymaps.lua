-- Navigation
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Better down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Better up", expr = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center on scroll down", silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center on scroll up", silent = true })
vim.keymap.set("n", "n", "nzzzv", { desc = "Center on next search", silent = true })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center on prev search", silent = true })
vim.keymap.set({ "n", "v" }, "H", "^", { desc = "Start of line" })
vim.keymap.set({ "n", "v" }, "J", "}", { desc = "Next newline" })
vim.keymap.set({ "n", "v" }, "K", "{", { desc = "Prev newline" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "End of line" })

-- Action
vim.keymap.set("v", "<", "<gv", { desc = "Increase indent", silent = true })
vim.keymap.set("v", ">", ">gv", { desc = "Decrease indent", silent = true })
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<CR><esc>", { desc = "Escape and Clear hlsearch" })
vim.keymap.set({ "i", "n" }, "<C-c>", "<cmd>noh<CR><esc>", { desc = "Escape and Clear hlsearch" })
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Tab
vim.keymap.set("n", "<leader>t", "<cmd>tab split<CR>", { desc = "New tab" })

-- Buffer
vim.keymap.set("n", "<leader>b", "<cmd>buf #<CR>", { desc = "Switch buffer" })

-- Misc
vim.keymap.set("n", "Q", "<nop>")

-- GIT GUD
for _, mode in pairs({ "n", "i", "v", "x" }) do
	for _, prefix in pairs({ "<", "<C-", "<S-", "<M-", "<A-" }) do
		for _, key in pairs({ "Up>", "Down>", "Left>", "Right>" }) do
			vim.keymap.set(mode, prefix .. key, "<nop>")
		end
	end
end

