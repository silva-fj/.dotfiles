local lsp_config = require('nvim-lsp/lsp_config')

local on_attach_tsserver = function(client, bufnr)
    print("LSP started. (tsserver)");
    lsp_config.on_attach(client, bufnr)
    if client.config.flags then client.config.flags.allow_incremental_sync = true end
    client.resolved_capabilities.document_formatting = false
end

require('lspconfig').tsserver.setup {
    on_attach = on_attach_tsserver
}
