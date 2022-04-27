require("nvim-treesitter.configs").setup({
	ensure_installed = "all", -- A list of parser names, or "all"
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	context_commentstring = { enable = true, enable_autocmd = false },
	ignore_install = { "vala", "swift" },
})
