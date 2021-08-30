local lsp_config = require('nvim-lsp/lsp_config')

local on_attach_tsserver = function(client, bufnr)
    lsp_config.on_attach(client, bufnr)
    if client.config.flags then client.config.flags.allow_incremental_sync = true end
    client.resolved_capabilities.document_formatting = false
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('lspconfig').tsserver.setup {
    on_attach = on_attach_tsserver,
    capabilities = capabilities
}
