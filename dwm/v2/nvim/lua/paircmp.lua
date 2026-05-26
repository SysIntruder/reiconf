-- TODO use vim.opt.matchpairs for available pairs
local match_pairs = {
	['"'] = { closing = '"' },
	["'"] = { closing = "'" },
	["`"] = { closing = "`" },
}
for _, v in ipairs(vim.opt.matchpairs:get()) do
	local left, right = unpack(vim.split(v, ":"))
	match_pairs[left] = { closing = right }
	match_pairs[right] = { closing = "" }
end

local function prev_next()
	local line = vim.fn.getline(".")
	local col = vim.fn.col(".")
	local prev_char = line:sub(col - 1, col - 1)
	local next_char = line:sub(col, col)

	return prev_char, next_char
end

local function between_pairs()
	local prev_char, next_char = prev_next()
	local pair = match_pairs[prev_char]

	return pair and pair.closing ~= "" and pair.closing == next_char
end

local function pair_newline()
	if between_pairs() then
		return "<CR><Esc>==O" .. (vim.opt.autoindent and "" or "<Tab>")
	else
		return "<CR>"
	end
end

local function pair_delete()
	if between_pairs() then
		return "<BS><Right><BS>"
	else
		return "<BS>"
	end
end

local function pair_close(char)
	local pair = match_pairs[char]
	if not pair then
		return char
	end

	local is_quote = char == pair.closing
	local is_closing = pair.closing == ""
	local prev_char, next_char = prev_next()

	if
		is_quote
		and prev_char ~= ""
		and prev_char ~= " "
		and prev_char ~= "\t"
		and next_char ~= pair.closing
		and next_char ~= prev_char
		and not between_pairs()
	then
		return char
	end

	if (next_char == char and is_closing) or (next_char == pair.closing and is_quote) then
		return "<Right>"
	end

	return char .. pair.closing .. "<Left>"
end

vim.keymap.set("i", "<CR>", function()
	return pair_newline()
end, { desc = "Auto indent newline inside pair", expr = true, noremap = true, silent = true })
vim.keymap.set("i", "<BS>", function()
	return pair_delete()
end, { desc = "Auto delete empty pair", expr = true, noremap = true, silent = true })
for k, v in pairs(match_pairs) do
	vim.keymap.set("i", k, function()
		return pair_close(k)
	end, {
		desc = "Auto " .. (v.closing ~= "" and "pair " or "skip ") .. k,
		expr = true,
		noremap = true,
		silent = true,
	})
end

