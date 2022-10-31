local on_attach_gopls = function()
	print("LSP started. (gopls)")
	vim.api.nvim_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
end

require("lspconfig").gopls.setup({ on_attach = on_attach_gopls })
