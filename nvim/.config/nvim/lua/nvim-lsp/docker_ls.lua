local on_attach_docker_ls = function(client)
	require("illuminate").on_attach(client)
	print("LSP started. (docker ls)")
end

require("lspconfig").dockerls.setup({
	on_attach = on_attach_docker_ls,
})
