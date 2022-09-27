local on_attach_tailwindcss_server = function(client)
	require("illuminate").on_attach(client)
	print("LSP started. (tailwindcss ls)")
end

require("lspconfig").tailwindcss.setup({
	on_attach = on_attach_tailwindcss_server,
	filetypes = {
		"html",
		"markdown",
		"mustache",
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
		"svelte",
	},
})
