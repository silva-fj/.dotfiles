call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', {'do':{-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
" Plug 'leafgarland/typescript-vim'
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
" Plug 'morhetz/gruvbox'
" Plug 'arcticicestudio/nord-vim'
" Plug 'joshdick/onedark.vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'
Plug 'mhinz/vim-startify'
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

" Ignore files/directories from autocomplete and fzf
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/node_modules/*
set wildignore+=*/vendor/bundle/*
set wildignore+=*/vendor/*

" [ Color Schemes ]
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
" set background=dark
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
nmap glg :GFiles!?<CR>
map <Leader>gs :Gstatus<CR>
nnoremap <C-p> :Files<CR>
map <Leader>qq :qall<CR>
nmap gb <C-o>
nmap ff :Format<CR>
nmap <Leader>w :bd<CR>
nnoremap <space><space> :nohlsearch<CR>
nnoremap <Leader>rt :JSXReplaceTag<CR>
nnoremap <C-m> :NERDTreeFind<CR>
nnoremap <F10> :bnext<CR>
nnoremap <F9> :bprev<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <space>s :w<CR>

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
" ################################################################################################################################

" NERDTree Configuration
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

"opens NERDTree automatically when vim starts up on opening a directory e.g: vim ~/some-directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"closes vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeIgnore=['\.git$', '\.idea$', '\.vscode$', '\.vagrant$', '\.dependabot$']
let g:NERDTreeShowHidden=1
let g:DevIconsEnableFoldersOpenClose = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeRespectWildIgnore = 1

"open NERDTree shortcut
map <C-f> :NERDTreeToggle<CR>
" ###################################################################################################################################

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

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
" ##################################################################################################################################

" NerdCommenter configuration
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1
let g:NERDToggleCheckAllLines = 1

autocmd! VimEnter * call s:fcy_nerdcommenter_map()
function! s:fcy_nerdcommenter_map()
    nmap <leader>cc <plug>NERDCommenterToggle
    vmap <leader>cc <plug>NERDCommenterToggle gv
endfunction
" ###################################################################################################################

" MatchTagAlways configuration
let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'jsx' : 1,
  \ 'tsx' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'jinja' : 1,
  \}

" ###################################################

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

set nobackup
set nowritebackup

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

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
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
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
" #####################################################################################################

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
" ######################################################################################################

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
" ######################################################################################################
"
" " Open Browser Configuration
nnoremap <A-o> <Plug>(openbrowser-open)
nnoremap <A-o> <Plug>(openbrowser-open)
