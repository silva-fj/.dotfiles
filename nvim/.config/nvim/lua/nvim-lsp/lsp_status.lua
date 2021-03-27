local lsp_status = {}

local g_lsp_status = require('lsp-status')

local kind_labels_mt = {
    __index = function(_, k)
        return k
    end
}

local kind_labels = {}

setmetatable(kind_labels, kind_labels_mt)

g_lsp_status.register_progress()

g_lsp_status.config({
    kind_labels = kind_labels,
    indicator_errors = "",
    indicator_warnings = "",
    indicator_info = "",
    indicator_hint = "",
    -- the default is a wide codepoint which breaks absolute and relative
    -- line counts if placed before airline's Z section
    status_symbol = ""
})

function lsp_status.on_attach(client, buf)
    return g_lsp_status.on_attach(client, buf)
end

function lsp_status.get_capabilities()
    return g_lsp_status.capabilities
end

return lsp_status
