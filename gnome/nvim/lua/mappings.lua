-- Better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down", silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up", silent = true })

-- Remap nav
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "J", "}")
vim.keymap.set("n", "K", "{")
vim.keymap.set("n", "L", "$")

-- Indenting
vim.keymap.set("v", "<", "<gv", { desc = "Increase indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Decrease indent" })

-- Clear search
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<CR><esc>", { desc = "Escape and Clear hlsearch" })

-- Toggle case
vim.keymap.set({ "n", "v" }, "!", "~<Left>", { desc = "Toggle case" })

-- Redo
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Goto mark
vim.keymap.set("n", "M", "`", { desc = "Goto Mark" })

-- Replace word under cursor
vim.keymap.set("n", "X", ":%s/\\<<C-r><C-w>\\>/", { desc = "Replace word under cursor" })

-- Insert mode quit with C-c
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Buffer
vim.keymap.set("n", "<C-Up>", "<cmd>enew<CR>", { desc = "New buffer" })
vim.keymap.set("n", "<C-Down>", "<cmd>confirm bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<C-Left>", "<cmd>bp<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<C-Right>", "<cmd>bn<CR>", { desc = "Next buffer" })

vim.keymap.set("n", "[b", "<cmd>bp<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "]b", "<cmd>bn<CR>", { desc = "Next buffer" })

-- Autopair
local function between_pairs()
	local l = vim.fn.getline(".")
	local c = vim.fn.col(".")
	local p = l:sub(c - 1, c - 1)
	local n = l:sub(c, c)
	local pairs = {
		["{"] = "}",
		["["] = "]",
		["("] = ")",
		['"'] = '"',
		["'"] = "'",
		["`"] = "`",
	}

	return pairs[p] == n
end

function _G.pair_newline()
	if between_pairs() then
		return "<CR><Tab><CR><Esc>kA"
	else
		return "<CR>"
	end
end
vim.keymap.set(
	"i",
	"<CR>",
	"v:lua.pair_newline()",
	{ desc = "Auto indent newline inside pair", expr = true, noremap = true, silent = true }
)

function _G.backspace_empty_pair()
	if between_pairs() then
		return "<BS><Right><BS>"
	else
		return "<BS>"
	end
end
vim.keymap.set(
	"i",
	"<BS>",
	"v:lua.backspace_empty_pair()",
	{ desc = "Auto delete empty pair", expr = true, noremap = true, silent = true }
)

function _G.skip_pair(char)
	local l = vim.fn.getline(".")
	local c = vim.fn.col(".")
	local n = l:sub(c, c)

	if n == char then
		return "<Right>"
	else
		return char
	end
end

function _G.autopair_quote(char)
	local l = vim.fn.getline(".")
	local c = vim.fn.col(".")
	local n = l:sub(c, c)

	if n == char then
		return "<Right>"
	else
		return char .. char .. "<Left>"
	end
end

vim.keymap.set("i", "{", "{}<Left>", { desc = "Autopair {" })
vim.keymap.set("i", "}", "v:lua.skip_pair('}')", { desc = "Skip pair }", expr = true })

vim.keymap.set("i", "[", "[]<Left>", { desc = "Autopair [" })
vim.keymap.set("i", "]", "v:lua.skip_pair(']')", { desc = "Skip pair ]", expr = true })

vim.keymap.set("i", "(", "()<Left>", { desc = "Autopair (" })
vim.keymap.set("i", ")", "v:lua.skip_pair(')')", { desc = "Skip pair )", expr = true })

vim.keymap.set("i", '"', 'v:lua.autopair_quote("\\"")', { desc = 'Autopair "', expr = true })
vim.keymap.set("i", "'", 'v:lua.autopair_quote("\'")', { desc = "Autopair '", expr = true })
vim.keymap.set("i", "`", "v:lua.autopair_quote('`')", { desc = "Autopair `", expr = true })

-- GIT GUD
for _, mode in pairs({ "n", "i", "v", "x" }) do
	-- Ctrl-Arrow used for buffer navigation
	for _, prefix in pairs({ "<", "<S-", "<M-", "<A-" }) do
		for _, key in pairs({ "Up>", "Down>", "Left>", "Right>" }) do
			vim.keymap.set(mode, prefix .. key, "<nop>")
		end
	end
end

-- Remove mapping
vim.keymap.set("i", "<M-e>", "<nop>")
vim.keymap.set("n", "Q", "<nop>")
