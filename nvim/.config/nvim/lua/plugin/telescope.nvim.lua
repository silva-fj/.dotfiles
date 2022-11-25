local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
		layout_config = {
			vertical = {
				width = 0.9,
			},
		},
	},
	extensions = {
		fzf = {
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
		},
	},
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("flutter")

vim.api.nvim_set_keymap(
	"n",
	"<Leader>bc",
	"<cmd>lua require('telescope.builtin').git_commits()<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap("n", "<Leader>b", "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>g",
	":Telescope live_grep layout_strategy=vertical prompt_prefix=🔍 <CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>f",
	"<cmd>lua require'telescope.builtin'.grep_string({ only_sort_text = true, search = vim.fn.input('Search 🔍 '), layout_strategy = 'vertical' })<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>ft",
	"<cmd>lua require('telescope').extensions.flutter.commands()<CR>",
	{ noremap = true }
)
