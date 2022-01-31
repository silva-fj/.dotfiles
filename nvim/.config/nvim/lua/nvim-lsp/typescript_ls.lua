local on_attach_tsserver = function(client)
    require'illuminate'.on_attach(client)
    print("LSP started. (tsserver)");
    if client.config.flags then client.config.flags.allow_incremental_sync = true end
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

require('lspconfig').tsserver.setup {on_attach = on_attach_tsserver}
