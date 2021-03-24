vim.fn.sign_define("LspDiagnosticsSignError",
                   {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint",
                   {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"})

local lspconfig = require('lspconfig')

local lsp_status = require('lsp-status')
local kind_labels_mt = {
    __index = function(_, k)
        return k
    end
}
local kind_labels = {}
setmetatable(kind_labels, kind_labels_mt)

lsp_status.register_progress()
lsp_status.config({
    kind_labels = kind_labels,
    indicator_errors = "",
    indicator_warnings = "",
    indicator_info = "",
    indicator_hint = "",
    -- the default is a wide codepoint which breaks absolute and relative
    -- line counts if placed before airline's Z section
    status_symbol = ""
})

local on_attach = function(client, bufnr)
    print("LSP started.");

    lsp_status.on_attach(client, bufnr)

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)

    end
end

local on_attach_tsserver = function(client, bufnr)
    print("LSP tsserver started.");

    if client.config.flags then client.config.flags.allow_incremental_sync = true end
    client.resolved_capabilities.document_formatting = false

    lsp_status.on_attach(client, bufnr)

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
           hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
           hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
           hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
           augroup lsp_document_highlight
              autocmd! * <buffer>
              autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
              autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
           augroup END
        ]], false)
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = vim.tbl_extend('keep', capabilities or {}, lsp_status.capabilities)

-- Use a loop to conveniently both setup defined servers and map buffer local keybindings when the language server attaches
local servers = {"cssls", "intelephense", "vimls", "yamlls", "html"}

for _, lsp in ipairs(servers) do lspconfig[lsp].setup {on_attach = on_attach, capabilities = capabilities} end

require'lspconfig'.tsserver.setup {on_attach = on_attach_tsserver}

-- JSON server
require'lspconfig'.jsonls.setup {
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
            end
        }
    }
}

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
