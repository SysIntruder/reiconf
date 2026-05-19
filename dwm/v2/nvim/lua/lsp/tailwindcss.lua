-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/tailwindcss.lua
vim.lsp.config("tailwindcss", {
	-- pn add -g @tailwindcss/language-server
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = { "html", "css", "javascript", "vue", "typescript", "postcss", "sass", "scss" },
	root_markers = {
		"tailwind.config.js",
		"tailwind.config.cjs",
		"tailwind.config.mjs",
		"tailwind.config.ts",
		"postcss.config.js",
		"postcss.config.cjs",
		"postcss.config.mjs",
		"postcss.config.ts",
		"package-lock.json",
		"pnpm-lock.json",
		"package.json",
		".git",
	},
	workspace_required = true,
	capabilities = {
		workspace = {
			didChangeWatchedFiles = { dynamicRegistration = true },
		},
	},
	settings = {
		tailwindCss = {
			validate = true,
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidScreen = "error",
				invalidVariant = "error",
				invalidConfigPath = "error",
				invalidTailwindDirective = "error",
				recommendedVariantOrder = "warning",
			},
			classAttributes = { "class", "className", "classList" },
			includeLanguages = { templ = "html" },
		},
	},
})
