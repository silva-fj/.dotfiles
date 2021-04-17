require('telescope').setup {
    extensions = {fzf = {override_generic_sorter = false, override_file_sorter = true, case_mode = "smart_case"}}
}

require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap("n", "<Leader>bc", "<cmd>lua require('telescope.builtin').git_commits()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>b", "<cmd>lua require('telescope.builtin').buffers()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>g", ":Telescope live_grep<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>f",
                        "<cmd>lua require'telescope.builtin'.grep_string{ only_sort_text = true, search = vim.fn.input('Grep For > ') }<CR>",
                        {noremap = true})
