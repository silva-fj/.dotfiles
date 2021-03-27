"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

" Plugins
source ~/.config/nvim/vim-plug/plugins.vim

" Plugin Config
source ~/.config/nvim/plugin-config/lspsaga.vim
source ~/.config/nvim/plugin-config/vim-vsnip.vim
source ~/.config/nvim/plugin-config/telescope.nvim.vim
source ~/.config/nvim/plugin-config/vim-startify.vim
source ~/.config/nvim/plugin-config/nerdcommenter.vim
source ~/.config/nvim/plugin-config/vim-fugitive.vim
" source ~/.config/nvim/plugin-config/vim-airline.vim
" source ~/.config/nvim/plugin-config/undotree.vim
source ~/.config/nvim/plugin-config/nvim-tree.vim
" source ~/.config/nvim/plugin-config/vim-which-key.vim
luafile ~/.config/nvim/plugin-config/lspsaga.lua
luafile ~/.config/nvim/plugin-config/lspkind-nvim.lua
luafile ~/.config/nvim/plugin-config/nvim-autopairs.lua
luafile ~/.config/nvim/plugin-config/nvim-treesitter.lua
luafile ~/.config/nvim/plugin-config/nvim-lightbulb.lua
" luafile ~/.config/nvim/plugin-config/galaxyline.lua

" LSP
luafile ~/.config/nvim/lua/nvim-lsp/lsp_config.lua
luafile ~/.config/nvim/lua/nvim-lsp/typescript_ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/efm_ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/json_ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/lua-ls.lua

" Lua
luafile ~/.config/nvim/lua/plugin/nvim-compe.lua
luafile ~/.config/nvim/lua/plugin/lualine.nvim.lua
luafile ~/.config/nvim/lua/plugin/nvim-ts-autotag.lua

" General settings
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/theme.vim
source ~/.config/nvim/general/mappings.vim
source ~/.config/nvim/general/auto-commands.vim
source ~/.config/nvim/general/neovim-terminal.vim
