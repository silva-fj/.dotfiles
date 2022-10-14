local on_attach_tsserver = function(client)
	require("illuminate").on_attach(client)
	print("LSP started. (tsserver)")
	if client.config.flags then
		client.config.flags.allow_incremental_sync = true
	end
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

require("lspconfig").tsserver.setup({ on_attach = on_attach_tsserver })
