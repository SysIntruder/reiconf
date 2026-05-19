return {
	-- LSP package manager
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					border = "single",
				},
				ensure_installed = {
					"gopls",
					"goimports",

					"typescript-language-server",
					"tailwindcss-language-server",

					"emmet-ls",

					"prettier",

					"clangd",
				},
			})
		end,
	},

	-- Formatter
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("conform").setup({
				format_on_save = function(bufnr)
					local disable_filetypes = { c = true, cpp = true }
					return {
						timeout_ms = 500,
						lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
					}
				end,
				formatters_by_ft = {
					lua = { "stylua" },
					go = { "gofmt", "goimports" },
					json = { "prettier" },
				},
				formatters = {
					golines = {
						prepend_args = {
							"--max-len=85",
						},
					},
					clang_format = {
						cwd = require("conform.util").root_file({ ".clang-format" }),
						require_cwd = true,
						prepend_args = { "--style=file", "--fallback-style=Google" },
					},
				},
			})
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VimEnter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = { "lua", "go", "javascript", "typescript", "c", "cpp", "cmake" },
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPost",
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem = {
				documentationFormat = { "markdown", "plaintext" },
				snippetSupport = true,
				preselectSupport = true,
				insertReplaceSupport = true,
				labelDetailsSupport = true,
				deprecatedSupport = true,
				commitCharactersSupport = true,
				tagSupport = { valueSet = { 1 } },
				resolveSupport = {
					properties = {
						"documentation",
						"detail",
						"additionalTextEdits",
					},
				},
			}

			local on_init = function(client, _)
				if client:supports_method("textDocument/semanticTokens") then
					client.server_capabilities.semanticTokensProvider = nil
				end
			end

			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help),
			}

			local lspconfig = require("lspconfig")

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				on_init = on_init,
				handlers = handlers,
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				on_init = on_init,
				handlers = handlers,
				filetypes = {
					"css",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"typescriptreact",
					"vue",
				},
			})

			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				on_init = on_init,
				handlers = handlers,
				filetypes = {
					"css",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"typescriptreact",
					"vue",
				},
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
				on_init = on_init,
				handlers = handlers,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						analyses = {
							unusedParams = true,
						},
					},
				},
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
				on_init = on_init,
				handlers = handlers,
			})

			vim.keymap.set("n", "grr", vim.lsp.buf.definition, { desc = "LSP go to definition" })
			vim.keymap.set("n", "gri", vim.lsp.buf.hover, { desc = "LSP hover information" })
			vim.keymap.set("n", "grt", vim.diagnostic.open_float, { desc = "LSP diagnostic" })
		end,
	},
}
