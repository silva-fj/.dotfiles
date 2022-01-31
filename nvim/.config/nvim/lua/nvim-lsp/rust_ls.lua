local nvim_lsp = require 'lspconfig'

local on_attach = function(client)
    vim.api.nvim_set_keymap("n", "ff", "<cmd>RustFmt<CR>", {noremap = true})
    require'illuminate'.on_attach(client)
    print("LSP rust_analyzer started.");
end

nvim_lsp.rust_analyzer.setup({on_attach = on_attach})
