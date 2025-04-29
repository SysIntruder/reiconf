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
				buffers = {
					actions = {
						["ctrl-x"] = false,
						["ctrl-q"] = { fn = actions.buf_del, reload = true },
					},
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

			vim.keymap.set("n", "<leader>fc", fzflua.lsp_incoming_calls, { desc = "Fzf lsp incoming calls" })
			vim.keymap.set("n", "<leader>fC", fzflua.lsp_outgoing_calls, { desc = "Fzf lsp outgoing calls" })
		end,
	},
}
