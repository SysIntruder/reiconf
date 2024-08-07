return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					file_sorter = require("telescope.sorters").get_fuzzy_files,
					file_ignore_patterns = { "node_modules" },
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					path_display = { "truncate" },
					winblend = 0,
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
					mappings = {
						n = { ["x"] = require("telescope.actions").delete_buffer },
					},
				},
				pickers = {
					buffers = {
						initial_mode = "normal",
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope keymap cheatsheet" })

			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope list buffers" })
			vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Telescope list marks" })

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope find oldfiles" })

			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope list lsp diagnostics" })
			vim.keymap.set("n", "<leader>fc", builtin.lsp_incoming_calls, { desc = "Telescope list incoming calls" })
			vim.keymap.set("n", "<leader>fC", builtin.lsp_outgoing_calls, { desc = "Telescope list outgoing calls" })
			vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Telescope list symbols" })
			vim.keymap.set("n", "<leader>fS", builtin.treesitter, { desc = "Telescope list symbols (treesitter)" })

			vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope find word" })
			vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Telescope buffer fzf" })
		end,
	},
}
