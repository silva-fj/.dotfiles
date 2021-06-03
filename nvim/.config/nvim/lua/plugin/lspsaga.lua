local saga = require 'lspsaga'

saga.init_lsp_saga()

vim.api.nvim_set_keymap("n", "<Leader>a", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<Leader>a", "<cmd>lua require('lspsaga.codeaction').range_code_action()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua require('lspsaga.rename').rename()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>cd", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "]g", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "[g", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>",
                        {noremap = true, silent = true})
