local function lsp_status()
    return require('lsp-status').status()
end

require('lualine').setup({
    options = {theme = 'gruvbox'},
    extensions = {'fugitive'},
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            'branch', {
                'diff',
                symbols = {added = ' ', modified = ' ', removed = ' '},
                color_added = '#98c379',
                color_modified = '#e5c07b',
                color_removed = '#e06c75'
            }
        },
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress', 'location'},
        lualine_z = {lsp_status}
    }
})

-- https://github.com/hoob3rt/lualine.nvim/blob/master/THEMES.md
-- Themes: oceanicnext, gruvbox, onedark, nord, dracula, nightfly
