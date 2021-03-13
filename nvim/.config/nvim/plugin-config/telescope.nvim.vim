" Key Mappings
map <Leader>bc :lua require('telescope.builtin').git_commits()<CR>
" nnoremap <leader>g :Telescope live_grep<CR>
" https://github.com/nvim-telescope/telescope.nvim/issues/392
" https://github.com/nvim-telescope/telescope.nvim/pull/457
nnoremap <Leader>g :lua require'telescope.builtin'.grep_string{ only_sort_text = true, search = vim.fn.input("Grep For > ") }<CR>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<CR>

" Telescope Configuration
lua << EOF
require('telescope').setup{
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
EOF

