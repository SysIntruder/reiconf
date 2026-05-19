return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VimEnter",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					untracked = { text = "+" },
					change = { text = "~" },
					changedelete = { text = "~" },
					delete = { text = "-" },
					topdelete = { text = "-" },
				},
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function opts(desc)
						return { buffer = bufnr, desc = desc }
					end

					vim.keymap.set("n", "<leader>hh", gs.preview_hunk, opts("Preview Hunk"))
					vim.keymap.set("n", "<leader>hb", gs.blame_line, opts("Blame Line"))
				end,
			})
		end,
	},
}
