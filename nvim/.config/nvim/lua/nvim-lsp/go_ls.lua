local on_attach_gopls = function()
	print("LSP started. (gopls)")
end

require("lspconfig").gopls.setup({ on_attach = on_attach_gopls })
