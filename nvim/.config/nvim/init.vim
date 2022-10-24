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

" LSP
luafile ~/.config/nvim/lua/nvim-lsp/lsp_config.lua
luafile ~/.config/nvim/lua/nvim-lsp/typescript_ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/json_ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/lua-ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/rust_ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/clangd_ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/null_ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/tailwindcss_ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/docker_ls.lua
luafile ~/.config/nvim/lua/nvim-lsp/go_ls.lua

" Lua plugins config
luafile ~/.config/nvim/lua/plugin/lspsaga.lua
luafile ~/.config/nvim/lua/plugin/cmp.lua
luafile ~/.config/nvim/lua/plugin/nvim-treesitter.lua
luafile ~/.config/nvim/lua/plugin/lualine.nvim.lua
luafile ~/.config/nvim/lua/plugin/nvim-ts-autotag.lua
luafile ~/.config/nvim/lua/plugin/lspkind-nvim.lua
luafile ~/.config/nvim/lua/plugin/nvim-autopairs.lua
luafile ~/.config/nvim/lua/plugin/nvim-lightbulb.lua
luafile ~/.config/nvim/lua/plugin/kommentary.lua
luafile ~/.config/nvim/lua/plugin/telescope.nvim.lua
luafile ~/.config/nvim/lua/plugin/lazygit.nvim.lua
luafile ~/.config/nvim/lua/plugin/gitsigns.lua
luafile ~/.config/nvim/lua/plugin/nvim-web-devicons.lua
luafile ~/.config/nvim/lua/plugin/project.nvim.lua
luafile ~/.config/nvim/lua/plugin/trouble.nvim.lua
luafile ~/.config/nvim/lua/plugin/lsp-colors.lua
luafile ~/.config/nvim/lua/plugin/indent-blankline.nvim.lua
luafile ~/.config/nvim/lua/plugin/flutter-tools.lua
luafile ~/.config/nvim/lua/plugin/nvim-tree.lua
luafile ~/.config/nvim/lua/plugin/vim-fugitive.lua
luafile ~/.config/nvim/lua/plugin/goto-preview.lua

" General settings
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/theme.vim
source ~/.config/nvim/general/mappings.vim
source ~/.config/nvim/general/auto-commands.vim
source ~/.config/nvim/general/neovim-terminal.vim
