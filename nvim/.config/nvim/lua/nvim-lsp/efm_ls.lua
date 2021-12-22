local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}
local prettier_global = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

-- General purpose Language Server
require'lspconfig'.efm.setup {
    on_attach = function(client)
        print("LSP efm started.");
        client.resolved_capabilities.document_formatting = true
        client.resolved_capabilities.goto_definition = false
        vim.api.nvim_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true})
    end,
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescript.tsx", "typescriptreact", "yaml",
        "html", "css", "json", "lua"
    },
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=120 --break-after-table-lb",
                    formatStdin = true
                }
            },
            javascript = {prettier},
            javascriptreact = {prettier},
            ["javascript.jsx"] = {prettier},
            typescript = {prettier},
            ["typescript.tsx"] = {prettier},
            typescriptreact = {prettier},
            yaml = {prettier_global},
            html = {prettier_global},
            css = {prettier_global},
            json = {prettier_global}
        }
    }
}

