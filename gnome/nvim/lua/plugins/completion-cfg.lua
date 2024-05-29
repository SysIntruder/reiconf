return {
	{
		"saadparwaiz1/cmp_luasnip",
		event = "BufReadPost",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		event = "BufReadPost",
	},
	{
		"hrsh7th/cmp-path",
		event = "BufReadPost",
	},
	{
		"hrsh7th/cmp-buffer",
		event = "BufReadPost",
	},
	{
		"L3MON4D3/LuaSnip",
		event = "BufReadPost",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
