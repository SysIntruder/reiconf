return {
	-- FZF
	{
		"ibhagwan/fzf-lua",
		config = function()
			local fzflua = require("fzf-lua")
			fzflua.setup()

			vim.keymap.set("n", "<leader>fb", fzflua.buffers, { desc = "Fzf buffers" })

			vim.keymap.set("n", "<leader>ff", fzflua.files, { desc = "Fzf files" })
			vim.keymap.set("n", "<leader>fw", fzflua.live_grep_native, { desc = "Fzf find word" })

			vim.keymap.set(
				"n",
				"<leader>fd",
				fzflua.lsp_workspace_diagnostics,
				{ desc = "Fzf lsp workspace diagnostics" }
			)
			vim.keymap.set("n", "<leader>fc", fzflua.lsp_incoming_calls, { desc = "Fzf lsp incoming calls" })
			vim.keymap.set("n", "<leader>fC", fzflua.lsp_outgoing_calls, { desc = "Fzf lsp outgoing calls" })
		end,
	},
}
