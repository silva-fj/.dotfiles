-- JSON server
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client)
	vim.api.nvim_set_keymap("n", "ff", "<cmd>Format<CR>", { noremap = true })
	require("illuminate").on_attach(client)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
	print("LSP started. (json)")
end

require("lspconfig").jsonls.setup({
	cmd = { "vscode-json-language-server", "--stdio" },
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "json", "jsonc" },
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
			end,
		},
	},

	settings = {
		json = {
			-- Schemas https://www.schemastore.org
			schemas = {
				{ fileMatch = { "package.json" }, url = "https://json.schemastore.org/package.json" },
				{ fileMatch = { "tsconfig*.json" }, url = "https://json.schemastore.org/tsconfig.json" },
				{
					fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
					url = "https://json.schemastore.org/prettierrc.json",
				},
				{ fileMatch = { ".eslintrc", ".eslintrc.json" }, url = "https://json.schemastore.org/eslintrc.json" },
				{
					fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
					url = "https://json.schemastore.org/babelrc.json",
				},
				{ fileMatch = { "lerna.json" }, url = "https://json.schemastore.org/lerna.json" },
				{ fileMatch = { "now.json", "vercel.json" }, url = "https://json.schemastore.org/now.json" },
				{
					fileMatch = { ".stylelintrc", ".stylelintrc.json", "stylelint.config.json" },
					url = "http://json.schemastore.org/stylelintrc.json",
				},
			},
		},
	},
})
