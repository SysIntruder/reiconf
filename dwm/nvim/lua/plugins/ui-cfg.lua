return {
	-- Themer
	{
		"themercorp/themer.lua",
		config = function()
			require("themer").setup({
				colorscheme = "dracula",
			})
		end,
	},
}
