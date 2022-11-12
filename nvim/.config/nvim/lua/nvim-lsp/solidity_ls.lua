local on_attach_solidity_ls = function(client)
	require("illuminate").on_attach(client)
	print("LSP started. (solidity)")
end

require("lspconfig").solidity_ls.setup({
	on_attach = on_attach_solidity_ls,
})
