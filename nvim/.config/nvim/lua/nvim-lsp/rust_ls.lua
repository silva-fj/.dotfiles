local nvim_lsp = require'lspconfig'

local on_attach = function()
    print("LSP rust_analyzer started.");
end

nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
})
