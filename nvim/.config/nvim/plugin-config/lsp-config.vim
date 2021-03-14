" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"map <c-p> to manually trigger completion
imap <silent> <C-space> <Plug>(completion_trigger)

let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert

" " possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'vim-vsnip'

" Auto Commands
autocmd BufWritePre *.js :Prettier
autocmd BufWritePre *.jsx :Prettier
autocmd BufWritePre *.ts :Prettier
autocmd BufWritePre *.tsx :Prettier
autocmd BufEnter * lua require'completion'.on_attach()
