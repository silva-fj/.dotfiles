local nvim_lsp = require 'lspconfig'

local on_attach = function()
    vim.api.nvim_set_keymap("n", "ff", "<cmd>RustFmt<CR>", {noremap = true})
    print("LSP rust_analyzer started.");
end

nvim_lsp.rust_analyzer.setup({on_attach = on_attach})
