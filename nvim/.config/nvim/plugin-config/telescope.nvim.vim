" Key Mappings
map <Leader>bc :lua require('telescope.builtin').git_commits()<CR>
map <Leader>m :lua require('telescope').extensions.media_files.media_files()<CR>
" nnoremap <leader>g :Telescope live_grep<CR>
" https://github.com/nvim-telescope/telescope.nvim/issues/392
" https://github.com/nvim-telescope/telescope.nvim/pull/457
nnoremap <Leader>g :lua require'telescope.builtin'.grep_string{ only_sort_text = true, search = vim.fn.input("Grep For > ") }<CR>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<CR>

" Telescope Configuration
lua << EOF
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('media_files')

require('telescope').setup{
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = {"png", "webp", "jpg", "jpeg"},
          find_cmd = "rg" -- find command (defaults to `fd`)
        }
    }
}
EOF

