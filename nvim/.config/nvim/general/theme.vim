" [ Color Schemes - Themes ]
" colorscheme gruvbox
" colorscheme onedark
" colorscheme nord
" colorscheme dracula
" colorscheme night-owl
" colorscheme nightfly

" OceanicNext Theme
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

" Nvcode Theme
" colorscheme nvcode
" let g:nvcode_termcolors=256
"
let g:enable_bold_font = 1
let g:enable_italic_font = 1

if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

" Enable true colors and termguicolors 
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
