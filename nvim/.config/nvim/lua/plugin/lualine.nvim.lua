local function lsp_status()
    return require('lsp-status').status()
end

-- gruvbox colors
local colors = {green = '#b8bb26', orange = '#8ec07c', red = '#fb4934'}

require('lualine').setup({
    options = {theme = 'gruvbox'},
    extensions = {'fugitive'},
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {'branch', icon = ''}, {
                'diff',
                symbols = {added = ' ', modified = ' ', removed = ' '},
                color_added = colors.green,
                color_modified = colors.orange,
                color_removed = colors.red
            }
        },
        lualine_c = {{'filename', full_path = true}},
        lualine_x = {'filetype'},
        lualine_y = {'progress', 'location'},
        lualine_z = {lsp_status}
        -- lualine_z = {
        --     {
        --         'diagnostics',
        --         sources = {'nvim_lsp'},
        --         symbols = {error = ' ', warn = ' ', info = ' '},
        --         color_error = colors.red,
        --         color_warn = colors.orange,
        --         color_info = colors.green
        --     }
        -- }
    }
})

-- https://github.com/hoob3rt/lualine.nvim/blob/master/THEMES.md
-- Themes: oceanicnext, gruvbox, onedark, nord, dracula, nightfly
