" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.config/nvim/autoload/plugged')

" General utils
Plug 'ahmedkhalf/project.nvim'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tyru/open-browser.vim'
Plug 'mhinz/vim-startify'
Plug 'windwp/nvim-autopairs'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'b3nj5m1n/kommentary'
Plug 'lukas-reineke/indent-blankline.nvim'

" File explorer
Plug 'kyazdani42/nvim-tree.lua'

" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Status line and status bar
Plug 'romgrk/barbar.nvim'
Plug 'hoob3rt/lualine.nvim'

" Tags
 Plug 'windwp/nvim-ts-autotag'

" Snippets
Plug 'alDuncanson/react-hooks-snippets'
" Plug 'Neevash/awesome-flutter-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Git 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'kdheepak/lazygit.nvim'
" Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'

" LSP
Plug 'nvim-lua/lsp-status.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'kosayoda/nvim-lightbulb'
Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'folke/trouble.nvim'

" Colorschemas
Plug 'folke/lsp-colors.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mhartington/oceanic-next'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'haishanh/night-owl.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasiser/vim-code-dark'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jparise/vim-graphql'
" Plug 'mustache/vim-mustache-handlebars'
Plug 'rust-lang/rust.vim'
" Plug 'pantharshit00/vim-prisma'
Plug 'tomlion/vim-solidity'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
