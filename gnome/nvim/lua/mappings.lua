-- Better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus bottom window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus top window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right window", remap = true })

-- Move line
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

-- Insert mode quit with C-c
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Buffer
vim.keymap.set("n", "<C-Up>", "<cmd>enew<CR>", { desc = "New buffer" })
vim.keymap.set("n", "<C-Down>", "<cmd>confirm bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<C-Left>", "<cmd>bp<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<C-Right>", "<cmd>bn<CR>", { desc = "Next buffer" })

-- Quickfix
vim.keymap.set("n", "<leader>q", "<cmd>copen<CR>", { desc = "Quickfix List" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>", { desc = "Prev quickfix" })
vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Next quickfix" })

-- Clear search
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Indenting
vim.keymap.set("v", "<", "<gv", { desc = "Increase indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Decrease indent" })

-- Search word
vim.keymap.set("n", "*", "*N", { desc = "Search forward word under cursor" })
vim.keymap.set("n", "#", "#n", { desc = "Search backward word under cursor" })

-- Add newline
vim.keymap.set("n", "go", "<cmd>call append(line('.'), repeat([''], v:count1))<CR>", { desc = "Add newline below" })
vim.keymap.set("n", "gO", "<cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = "Add newline above" })

-- GIT GUD
for _, mode in pairs({ "n", "i", "v", "x" }) do
	-- Ctrl-Arrow used for buffer navigation
	for _, prefix in pairs({ "<", "<S-", "<M-", "<A-" }) do
		for _, key in pairs({ "Up>", "Down>", "Left>", "Right>" }) do
			vim.keymap.set(mode, prefix .. key, "<nop>")
		end
	end
end

-- remove mapping
vim.keymap.set("i", "<M-e>", "<nop>")
vim.keymap.set("n", "Q", "<nop>")
