local npairs = require('nvim-autopairs')
local ts_conds = require('nvim-autopairs.ts-conds')
local Rule = require('nvim-autopairs.rule')

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add pair on that treesitter node
        javascript = {'template_string'},
        typescript = {'template_string'},
    },
    disable_filetype = {"TelescopePrompt", "vim"},
    html_break_line_filetype = {
        'html', 'vue', 'typescriptreact', 'typescript.tsx', 'javascript.jsx', 'svelte', 'javascriptreact'
    }
})

npairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})
