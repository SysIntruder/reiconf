return {
	-- Jump
	{
		"folke/flash.nvim",
		event = "BufReadPost",
		config = function()
			require("flash").setup({
				prompt = {
					enabled = false,
				},
			})

			local flash = require("flash")

			vim.keymap.set({ "n", "x", "o" }, "s", function()
				flash.jump()
			end, { desc = "Flash" })
			vim.keymap.set("o", "S", function()
				flash.remote()
			end, { desc = "Flash remote" })
		end,
	},

	-- Fold
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		event = "BufReadPost",
		config = function()
			require("ufo").setup({
				provider_seleclor = function(_, ft, _)
					local lspWithOutFolding = { "markdown", "sh", "css", "html", "python" }
					if vim.tbl_contains(lspWithOutFolding, ft) then
						return { "treesitter", "indent" }
					end
					return { "lsp", "indent" }
				end,
				close_fold_kinds_for_ft = {
					default = { "comment" },
				},
				open_fold_hl_timeout = 800,
			})
		end,
	},

	-- File Manager
	{
		"stevearc/oil.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				view_options = {
					show_hidden = true,
				},
			})

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
}
