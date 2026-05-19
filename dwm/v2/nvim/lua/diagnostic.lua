vim.diagnostic.config({
	underline = true,
	severity_sort = true,
	update_in_insert = false,
	float = {
		border = "single",
    source = true,
	},
})

vim.keymap.set("n", "grd", function()
	vim.diagnostic.open_float()
end, { desc = "Diagnostic hover" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)

