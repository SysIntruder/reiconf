return {
	-- Colorscheme
	-- {
	-- 	"RRethy/base16-nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("base16-colorscheme").with_config({
	-- 			telescope = false,
	-- 			indentblankline = true,
	-- 			notify = true,
	-- 			ts_rainbow = true,
	-- 			cmp = true,
	-- 			illuminate = true,
	-- 			dapui = true,
	-- 		})
	--
	-- 		require("base16-colorscheme").setup({
	-- 			base00 = "#1E1E1E", -- Default bg
	-- 			base01 = "#242424", -- Lighter bg (status bar, line number, folding mks)
	-- 			base02 = "#383838", -- Selection bg
	-- 			base03 = "#5E5C64", -- Comments, invisibles, line hl
	-- 			base04 = "#C0BFBC", -- Dark fg (status bars)
	-- 			base05 = "#EBEBEB", -- Default fg (caret, delimiters, Operators)
	-- 			base06 = "#FAFAFA", -- Light fg (not often used)
	-- 			base07 = "#FFFFFF", -- Light bg (not often used)
	-- 			base08 = "#ED333B", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
	-- 			base09 = "#F5C211", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
	-- 			base0A = "#F8E45C", -- Classes, Markup Bold, Search Text Background
	-- 			base0B = "#57E389", -- Strings, Inherited Class, Markup Code, Diff Inserted
	-- 			base0C = "#4FD2FD", -- Support, regex, escape chars
	-- 			base0D = "#51A1FF", -- Function, methods, headings
	-- 			base0E = "#C061CB", -- Keywords
	-- 			base0F = "#B5835A", -- Deprecated, open/close embedded tags
	-- 		})
	-- 	end,
	-- },

	-- Colorizer
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- Which Key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup({
				window = {
					border = "single",
				},
			})
		end,
	},
}
