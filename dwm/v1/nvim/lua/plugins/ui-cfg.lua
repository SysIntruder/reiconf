return {
	-- Themer
	{
		"themercorp/themer.lua",
		config = function()
			require("themer").setup({
				colorscheme = "dracula",
				remaps = {
					highlights = {
						dracula = {
							base = {
								StatusLine = { bg = "#282a36", fg = "#f8f8f2" },
								StatusLineNC = { bg = "#282a36", fg = "#6272a4" },
							},
						},
					},
				},
			})
		end,
	},
}
