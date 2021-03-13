" Key Mappings
map <Leader>gs :Git<CR>
nnoremap <Leader>gd :Gdiffsplit<CR>
nnoremap <Leader>gb :Gbrowse<CR>

" Auto commands
autocmd BufReadPost fugitive://* set bufhidden=delete

