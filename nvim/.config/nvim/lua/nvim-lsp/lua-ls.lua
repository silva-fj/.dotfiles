-- https://github.com/sumneko/lua-language-server/wiki/Getting-Started
require("lspconfig").sumneko_lua.setup({
	on_attach = function(client)
		require("illuminate").on_attach(client)
		vim.api.nvim_set_keymap(
			"n",
			"ff",
			"<cmd>lua vim.lsp.buf.format { async = true }<CR>",
			{ noremap = true, silent = true }
		)
		print("LSP lua started.")
	end,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				maxPreload = 4000,
				preloadFileSize = 4000,
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
