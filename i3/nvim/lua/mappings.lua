vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down", silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up", silent = true })

vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "J", "}")
vim.keymap.set("n", "K", "{")
vim.keymap.set("n", "L", "$")

vim.keymap.set("v", "<", "<gv", { desc = "Increase indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Decrease indent" })

vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<CR><esc>", { desc = "Escape and Clear hlsearch" })

vim.keymap.set({ "n", "v" }, "!", "~<Left>", { desc = "Toggle case" })

vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

vim.keymap.set("n", "M", "`", { desc = "Goto Mark" })

vim.keymap.set("n", "X", ":%s/\\<<C-r><C-w>\\>/", { desc = "Replace word under cursor" })

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>b", ":e %:p:h/", { desc = "New file buffer wd" })
vim.keymap.set("n", "<leader>B", ":e ", { desc = "New file from cwd" })
vim.keymap.set("n", "[b", "<cmd>bp<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "]b", "<cmd>bn<CR>", { desc = "Next buffer" })

vim.keymap.set("n", "<leader>t", "<cmd>$tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "[t", "<cmd>tabp<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "]t", "<cmd>tabn<CR>", { desc = "Next buffer" })

vim.keymap.set("n", "<leader><CR>", "<cmd>te<CR>", { desc = "New terminal" })
vim.keymap.set("n", "<leader>S", "<C-w>s<cmd>te<CR>", { desc = "New split terminal" })
vim.keymap.set("n", "<leader>V", "<C-w>v<cmd>te<CR>", { desc = "New vertical terminal" })
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Terminal navigate left" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Terminal navigate down" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Terminal navigate up" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Terminal navigate right" })
vim.keymap.set("t", "<C-c>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>X", "<cmd>bd!<CR>", { desc = "Force close buffer" })

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

vim.keymap.set("n", "Q", "<nop>")

function _G.sectionize_selection()
	local section = vim.fn.input("Section name: ")

	local start_section = string.format("%s START", section)
	local end_section = string.format("%s END", section)

	return "dO" .. start_section .. "<CR><C-c>o" .. end_section .. "<C-c>O<C-c>O<C-c>Vp"
end

vim.keymap.set(
	"v",
	"<leader>w",
	"v:lua.sectionize_selection()",
	{ desc = "Wrap with section", expr = true, silent = true }
)

-- GIT GUD
for _, mode in pairs({ "n", "i", "v", "x" }) do
	for _, prefix in pairs({ "<", "<C-", "<S-", "<M-", "<A-" }) do
		for _, key in pairs({ "Up>", "Down>", "Left>", "Right>" }) do
			vim.keymap.set(mode, prefix .. key, "<nop>")
		end
	end
end
