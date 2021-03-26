local function lsp_status()
    return require('lsp-status').status()
end

require('lualine').setup({
    theme = 'gruvbox',
    extensions = {'fugitive'},
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress', 'location'},
        lualine_z = {lsp_status}
    }
})
