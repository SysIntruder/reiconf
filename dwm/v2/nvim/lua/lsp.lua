vim.lsp.config("*", {
	on_attach = function(client, bufnr)
		vim.lsp.completion.enable(true, client.id, bufnr, {
			autotrigger = true,
		})
	end,
})

require("lsp.lua_ls")
require("lsp.vtsls")
require("lsp.vue_ls")
require("lsp.tailwindcss")

vim.lsp.enable({ "lua_ls", "vtsls", "vue_ls", "tailwindcss" })

vim.keymap.set("n", "grh", function()
	vim.lsp.buf.hover({
    border = "single",
  })
end, { desc = "LSP hover" })

