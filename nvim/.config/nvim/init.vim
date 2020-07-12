call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', {'do':{-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'othree/html5.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'nelsyeung/twig.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-rhubarb'
Plug 'tyru/open-browser.vim'
Plug 'jparise/vim-graphql'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-unimpaired'
Plug 'mbbill/undotree'
Plug 'vifm/vifm.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'mhinz/vim-startify'
" ------------ Colorschemas ----------------
" Plug 'morhetz/gruvbox'
" Plug 'arcticicestudio/nord-vim'
" Plug 'joshdick/onedark.vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'
call plug#end()

syntax on
set autoread
set smarttab
set cindent
set autowrite
set wildmenu
set si
set scrolloff=5
set expandtab shiftwidth=4 tabstop=4
set smartindent
set number
set relativenumber
set splitbelow
set splitright
set mouse=a
set clipboard=unnamed
set shell=/bin/zsh
set termguicolors
set nobackup
set nowritebackup
set shortmess+=c
set signcolumn=yes
set hidden
set cmdheight=2
set updatetime=300

" Ignore files/directories from autocomplete and fzf
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/node_modules/*
set wildignore+=*/vendor/bundle/*
set wildignore+=*/vendor/*

" Enable true colors and termguicolors 
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" [ Color Schemes - Themes ]
set background=dark

" colorscheme onedark
" colorscheme gruvbox
" colorscheme nord
" colorscheme dracula

" OceanicNext Theme
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

" Material Hybrid Theme
" colorscheme hybrid_material
" let g:airline_theme = 'hybrid'
" #######################################

let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" Key Mappings
map <Space> <Leader>
map <Leader>bc :BCommits!<CR>
map <Leader>glg :Commits!<CR>
map <Leader>gs :Gstatus<CR>
map <leader>b :Buffers<CR>
map <Leader>qq :qall<CR>
nmap <space>e :CocCommand explorer<CR>
nmap ff :Format<CR>
nmap <Leader>w :bd<CR>
nmap glg :GFiles!?<CR>
nnoremap <space><space> :nohlsearch<CR>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>rt :JSXReplaceTag<CR>
nnoremap <F10> :bnext<CR>
nnoremap <F9> :bprev<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <space>s :w<CR>
nnoremap <space>F :Vifm<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Coc Explorer Configuration
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" FZF Configuration
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_COMMAND="rg --files --hidden"
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

"Neovim Terminal Configuration
if has('nvim')
    tnoremap <Space><Esc> <C-\><C-n>
endif
if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

" Startify configuration
function! s:list_commits()
  let git = 'git -C '. getcwd()
  let commits = systemlist(git .' log --pretty=format:"%h %ad %an%d %Creset%s" --date=short -n10')
  let git = 'G'. git[1:]
  return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

let g:startify_lists = [
    \ { 'type': 'dir', 'header': ['   MUR '. getcwd()] },
    \ { 'type': function('s:list_commits'), 'header': ['   Commits'] },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
    \ ]

let g:startify_bookmarks = [ 
    \ {'c': '~/.config/nvim/init.vim'}, 
    \ {'v': '~/.config/nvim/coc-settings.json'}, 
    \ {'t': '~/.zshrc'},
    \ ]

" NerdCommenter Configuration
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" MatchTagAlways configuration
let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'jsx' : 1,
  \ 'tsx' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'jinja' : 1,
  \}

"COC configuration:
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-git', 
  \ 'coc-highlight', 
  \ 'coc-phpls', 
  \ 'coc-html', 
  \ 'coc-css', 
  \ 'coc-yaml', 
  \ 'coc-lists', 
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>E  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>C  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>A :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>A :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#coc#enabled = 0
let airline#extensions#coc#error_symbol = 'Error:'
let airline#extensions#coc#warning_symbol = 'Warning:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let g:airline_powerline_fonts = 1

" vim-closetag
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx,tsx'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb,*.tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.ts set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" CocoaPods
au BufNewFile,BufRead Podfile,*.podspec set filetype=ruby
