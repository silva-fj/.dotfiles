local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintIgnoreExitCode = true
}

local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}
local prettier_global = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

-- General purpose Language Server
require'lspconfig'.efm.setup {
    on_attach = function(client)
        print("LSP efm started.");
        client.resolved_capabilities.document_formatting = true
        client.resolved_capabilities.goto_definition = false
    end,
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {
        "lua", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescript.tsx", "typescriptreact",
        "yaml", "html", "css", "json"
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
            javascript = {eslint, prettier},
            javascriptreact = {eslint, prettier},
            ["javascript.jsx"] = {eslint, prettier},
            typescript = {eslint, prettier},
            ["typescript.tsx"] = {eslint, prettier},
            typescriptreact = {eslint, prettier},
            yaml = {prettier_global},
            html = {prettier_global},
            css = {prettier_global},
            json = {prettier_global}
        }
    }
}
