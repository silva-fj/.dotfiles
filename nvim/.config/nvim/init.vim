"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

" Plugins
source ~/.config/nvim/vim-plug/plugins.vim

" Plugin Config
source ~/.config/nvim/vimscript/vim-vsnip.vim
source ~/.config/nvim/vimscript/vim-startify.vim
source ~/.config/nvim/vimscript/vim-fugitive.vim
source ~/.config/nvim/vimscript/nvim-tree.vim
source ~/.config/nvim/vimscript/rust.vim

" LSP
luafile ~/.config/nvim/lua/nvim-lsp/lsp_config.lua
luafile ~/.config/nvim/lua/nvim-lsp/typescript_ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/efm_ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/json_ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/lua-ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/rust_ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/rust_ls.lua

" Lua plugins config
luafile ~/.config/nvim/lua/plugin/lspsaga.lua
luafile ~/.config/nvim/lua/plugin/cmp.lua
luafile ~/.config/nvim/lua/plugin/nvim-treesitter.lua
luafile ~/.config/nvim/lua/plugin/lualine.nvim.lua
luafile ~/.config/nvim/lua/plugin/nvim-ts-autotag.lua
luafile ~/.config/nvim/lua/plugin/lspkind-nvim.lua
luafile ~/.config/nvim/lua/plugin/nvim-autopairs.lua
luafile ~/.config/nvim/lua/plugin/nvim-lightbulb.lua
luafile ~/.config/nvim/lua/plugin/nvim-comment.lua
luafile ~/.config/nvim/lua/plugin/telescope.nvim.lua
luafile ~/.config/nvim/lua/plugin/lazygit.nvim.lua
luafile ~/.config/nvim/lua/plugin/gitsigns.lua
luafile ~/.config/nvim/lua/plugin/nvim-web-devicons.lua
luafile ~/.config/nvim/lua/plugin/project.nvim.lua
luafile ~/.config/nvim/lua/plugin/trouble.nvim.lua
luafile ~/.config/nvim/lua/plugin/lsp-colors.lua
luafile ~/.config/nvim/lua/plugin/indent-blankline.nvim.lua

" General settings
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/theme.vim
source ~/.config/nvim/general/mappings.vim
source ~/.config/nvim/general/auto-commands.vim
source ~/.config/nvim/general/neovim-terminal.vim
