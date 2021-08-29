" Key Mappings
map <Space> <Leader>
map <Leader>qq :qall<CR>
nmap <Leader>w :bd<CR>
nnoremap <space>s :w<CR>
nnoremap <space><space> :nohlsearch<CR>
nnoremap <C-k> :TmuxNavigateUp<CR>
nnoremap U *
nnoremap Y y$
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Keep it centered
" nnoremap n nzzzv
" nnoremap N Nzzzv
" nnoremap J mzJ`z

" Undo break points
" inoremap , ,<c-g>u
" inoremap . .<c-g>u
" inoremap ! !<c-g>u
" inoremap ? ?<c-g>u
" inoremap { {<c-g>u
" inoremap [ [<c-g>u
" inoremap ( (<c-g>u
