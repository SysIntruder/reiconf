-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/lua_ls.lua
vim.lsp.config("lua_ls", {
	-- sudo pacman -S lua-language-server
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".stylua.toml",
		"stylua.toml",
		".git",
	},
	settings = {
		Lua = {
			codelens = { enable = true },
			hint = { enable = true },
			diagnostics = { globals = { "vim" } },
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					"${3rd}/luv/library",
				},
			},
			telemetry = { enable = false },
		},
	},
})
