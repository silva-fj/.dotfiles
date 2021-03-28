require('telescope').load_extension('fzy_native')
-- require('telescope').load_extension('media_files')

require('telescope').setup {
    extensions = {
        fzy_native = {override_generic_sorter = false, override_file_sorter = true}
        -- media_files = {
        -- filetypes whitelist
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        -- filetypes = {"png", "webp", "jpg", "jpeg"},
        -- find_cmd = "rg" -- find command (defaults to `fd`)
        -- }
    }
}

vim.api.nvim_set_keymap("n", "<Leader>bc", "<cmd>lua require('telescope.builtin').git_commits()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>g", ":Telescope live_grep<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>b", "<cmd>lua require('telescope.builtin').buffers()<CR>", {noremap = true})

-- " https://github.com/nvim-telescope/telescope.nvim/issues/392
-- " https://github.com/nvim-telescope/telescope.nvim/pull/457
-- vim.api.nvim_set_keymap("n", "<Leader>g",
--                         "<cmd>lua require'telescope.builtin'.grep_string{ only_sort_text = true, search = vim.fn.input('Grep For > ') }<CR>",
--                         {noremap = true})
