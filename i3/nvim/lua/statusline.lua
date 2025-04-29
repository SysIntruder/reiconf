local function lsp()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""

	if count["errors"] ~= 0 then
		errors = "E " .. count["errors"]
	end
	if count["warnings"] ~= 0 then
		warnings = "W " .. count["warnings"]
	end
	if count["hints"] ~= 0 then
		hints = "H " .. count["hints"]
	end
	if count["info"] ~= 0 then
		info = "I " .. count["info"]
	end

	return errors .. " " .. warnings .. " " .. hints .. " " .. info .. string.format(" %s ", vim.bo.filetype):upper()
end

local vcs = function()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end

	local added = git_info.added and ("+" .. git_info.added) or ""
	local changed = git_info.changed and ("~" .. git_info.changed) or ""
	local removed = git_info.removed and ("-" .. git_info.removed) or ""

	if git_info.added == 0 then
		added = ""
	end
	if git_info.changed == 0 then
		changed = ""
	end
	if git_info.removed == 0 then
		removed = ""
	end

	return "(" .. git_info.head .. ") " .. added .. " " .. changed .. " " .. removed
end

Statusline = {}

Statusline.active = function()
	return table.concat({
		"%<%f %h%m%r",
		vcs(),
		"%=",
		lsp(),
		" %-14.(%l,%c%V%) %P",
	})
end

Statusline.inactive = function()
	return "%<%f %h%m%r%=  %-14.(%l,%c%V%) %P"
end

vim.api.nvim_exec(
	[[
  augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  augroup END
]],
	false
)
