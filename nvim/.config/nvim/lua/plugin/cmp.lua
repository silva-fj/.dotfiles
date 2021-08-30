local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

local cmp = require('cmp')
  cmp.setup {
    formatting = {
        format = function(entry, vim_item)
          vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
          vim_item.menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[Lua]",
          })[entry.source.name]
          return vim_item
        end
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<Tab>'] = function(fallback)
          if vim.fn.pumvisible() == 1 then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
          elseif check_back_space() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n')
          elseif vim.fn['vsnip#available']() == 1 then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, true, true), '')
            else
              fallback()
            end
          end,
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      })
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'vsnip' },
      { name = 'path' },
      { name = 'nvim_lua' }
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
  }
