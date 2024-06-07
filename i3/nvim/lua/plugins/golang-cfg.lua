return {
	{
		"simondrake/gomodifytags",
		dependencies = { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		ft = "go",
		config = function()
			local opt = { transformation = "snakecase", skip_unexported = false }
			vim.keymap.set("n", "<leader>gtd", function()
				require("gomodifytags").GoAddTags("db", opt)
			end, { desc = "Gomodifytags add db tag" })
			vim.keymap.set("n", "<leader>gtj", function()
				require("gomodifytags").GoAddTags("json", opt)
			end, { desc = "Gomodifytags add json tag" })
			vim.keymap.set("n", "<leader>gtq", function()
				require("gomodifytags").GoAddTags("query", opt)
			end, { desc = "Gomodifytags add query tag" })
			vim.keymap.set("n", "<leader>gtf", function()
				require("gomodifytags").GoAddTags("form", opt)
			end, { desc = "Gomodifytags add form tag" })
		end,
	},
}
