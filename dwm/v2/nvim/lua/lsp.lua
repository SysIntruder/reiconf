-- vim.lsp.config("*", {
-- 	on_attach = function(client, bufnr)
-- 		vim.lsp.completion.enable(true, client.id, bufnr, {
-- 			autotrigger = true,
-- 		})
-- 		-- client.server_capabilities.semanticTokensProvider = nil
-- 	end,
-- })

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if not client then
			return
		end

		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, args.buf, {
				autotrigger = true,
			})
		end
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

