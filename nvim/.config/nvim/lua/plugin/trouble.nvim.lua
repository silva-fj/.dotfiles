require("trouble").setup()

vim.api.nvim_set_keymap("n", "<leader>ge", "<cmd>Trouble lsp_document_diagnostics<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<leader>gE", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "gr", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)
