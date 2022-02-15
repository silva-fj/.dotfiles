require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	context_commentstring = { enable = true, enable_autocmd = false },
	ignore_install = { "vala" },
})
