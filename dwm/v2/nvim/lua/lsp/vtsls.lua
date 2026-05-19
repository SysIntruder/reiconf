-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/vtsls.lua
vim.lsp.config("vtsls", {
	-- pn add -g @@vtsls/language-server
	cmd = { "vtsls", "--stdio" },
	filetypes = { "typescript", "javascript", "vue" },
	root_markers = {
		"package-lock.json",
		"pnpm-lock.json",
		"package.json",
		".git",
	},
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					{
						name = "@vue/typescript-plugin",
						location = vim.fn.expand(
							"$HOME/.local/share/pnpm/global/v11/46eb-19e36588eb1/node_modules/@vue/typescript-plugin"
						),
						languages = { "vue" },
						configNamespace = "typescript",
					},
				},
			},
		},
	},
	init_options = {
		hostInfo = "neovim",
	},
})
