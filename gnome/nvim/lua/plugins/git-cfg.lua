return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "-" },
					topdelete = { text = "-" },
					changedelete = { text = "~" },
					untracked = { text = "+" },
				},
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function opts(desc)
						return { buffer = bufnr, desc = desc }
					end

					vim.keymap.set("n", "<leader>hr", gs.reset_hunk, opts("Reset Hunk"))
					vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts("Preview Hunk"))
					vim.keymap.set("n", "<leader>hb", gs.blame_line, opts("Blame Line"))
				end,
			})
		end,
	},
}
