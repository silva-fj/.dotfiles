" Key Mappings
map <Space> <Leader>
map <Leader>qq :qall<CR>
nmap <Leader>w :bd<CR>
nnoremap <space>s :w<CR>
nnoremap <space><space> :nohlsearch<CR>
nnoremap U *
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <C-k> :TmuxNavigateUp<CR>
