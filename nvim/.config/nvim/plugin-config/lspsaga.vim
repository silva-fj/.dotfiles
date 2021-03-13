nnoremap <silent><leader>r :Lspsaga code_action<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-d> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent> <F2> <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [g :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]g :Lspsaga diagnostic_jump_prev<CR>
