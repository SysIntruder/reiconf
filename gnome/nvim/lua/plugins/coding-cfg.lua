return {
	-- Jump
	{
		"folke/flash.nvim",
		event = "BufReadPost",
		config = function()
			require("flash").setup({
				modes = {
					char = {
						enabled = false,
					},
				},
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
