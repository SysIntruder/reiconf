return {
	-- FZF
	{
		"ibhagwan/fzf-lua",
		config = function()
			local fzflua = require("fzf-lua")
			local actions = fzflua.actions
			fzflua.setup({
				winopts = {
					border = "single",
				},
				lsp = {
					symbols = {
						symbol_style = 3,
					},
				},
			})

			vim.keymap.set("n", "<leader>fb", fzflua.buffers, { desc = "Fzf buffers" })

			vim.keymap.set("n", "<leader>ff", fzflua.files, { desc = "Fzf files" })
			vim.keymap.set("n", "<leader>fg", fzflua.git_status, { desc = "Fzf git status" })
			vim.keymap.set("n", "<leader>fw", fzflua.live_grep_native, { desc = "Fzf find word" })

			vim.keymap.set("n", "<leader>fd", fzflua.lsp_workspace_diagnostics, { desc = "Fzf lsp diagnostics" })
			vim.keymap.set("n", "<leader>fs", fzflua.lsp_document_symbols, { desc = "Fzf lsp document symbols" })
			vim.keymap.set("n", "<leader>fr", fzflua.lsp_references, { desc = "Fzf lsp references" })
			vim.keymap.set("n", "<leader>fi", fzflua.lsp_implementations, { desc = "Fzf lsp implementations" })
		end,
	},
}
