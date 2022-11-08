require("flutter-tools").setup({})

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>r", ":FlutterRun<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rr", ":FlutterRestart<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>D", ":FlutterDevices<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>G", ":FlutterPubGet<CR>", opts)

-- LSP Mappings
vim.api.nvim_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>d", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
vim.api.nvim_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
