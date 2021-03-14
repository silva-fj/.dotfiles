" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'junegunn/fzf', {'do':{-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'othree/html5.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'vim-ruby/vim-ruby'
Plug 'mhinz/vim-startify'
Plug 'dart-lang/dart-vim-plugin'
Plug 'Neevash/awesome-flutter-snippets'
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'alDuncanson/react-hooks-snippets'
Plug 'liuchengxu/vim-which-key'
Plug 'udalov/kotlin-vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'christianchiarulli/nvcode-color-schemes.vim'
" Plug 'tomlion/vim-solidity'
Plug 'sheerun/vim-polyglot'
" ------------ Colorschemas ----------------
Plug 'morhetz/gruvbox'
" Plug 'arcticicestudio/nord-vim'
" Plug 'joshdick/onedark.vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'mhartington/oceanic-next'
" Plug 'haishanh/night-owl.vim'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
