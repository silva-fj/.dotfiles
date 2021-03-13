"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

" Plugins
source ~/.config/nvim/vim-plug/plugins.vim

" Plugin Config
source ~/.config/nvim/plugin-config/coc.vim
source ~/.config/nvim/plugin-config/telescope.nvim.vim
source ~/.config/nvim/plugin-config/vim-startify.vim
source ~/.config/nvim/plugin-config/nerdcommenter.vim
source ~/.config/nvim/plugin-config/dart-vim-plugin.vim
source ~/.config/nvim/plugin-config/fzf.vim
source ~/.config/nvim/plugin-config/vim-fugitive.vim
source ~/.config/nvim/plugin-config/vim-closetag.vim
source ~/.config/nvim/plugin-config/MatchTagAlways.vim
source ~/.config/nvim/plugin-config/undotree.vim
" source ~/.config/nvim/plugin-config/nvim-treesitter.vim
" source ~/.config/nvim/plugin-config/vim-which-key.vim

"General settings
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/theme.vim
source ~/.config/nvim/general/mappings.vim

"Neovim Terminal Configuration
if has('nvim')
    tnoremap <Space><Esc> <C-\><C-n>
endif
if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.ts set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" CocoaPods
au BufNewFile,BufRead Podfile,*.podspec set filetype=ruby

" JenkinsFile
au BufNewFile,BufRead Jenkinsfile set filetype=groovy
