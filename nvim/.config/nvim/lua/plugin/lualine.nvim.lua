local function lsp_status()
    return require('lsp-status').status()
end

-- https://github.com/hoob3rt/lualine.nvim/blob/master/THEMES.md
-- Themes: oceanicnext, gruvbox, onedark, nord, dracula, nightfly, codedark, vscode

-- COLORS
-- local gitColors = {added = '#b8bb26', modified = '#8ec07c', removed = '#fb4934'} -- gruvbox
local gitColors = {added = '#99c794', modified = '#f99157', removed = '#ec5f67'} -- oceanicnext
-- local gitColors = {added = '#4EC9B0', modified = '#9CDCFE', removed = '#F44747'} -- codedark
-- local gitColors = {added = '#4B5632', modified = '#264F78', removed = '#FB0101'} -- vscode

require('lualine').setup({
    options = {theme = 'oceanicnext'},
    extensions = {'fugitive'},
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {'branch', icon = ''}, {
                'diff',
                symbols = {added = ' ', modified = ' ', removed = ' '},
                color_added = gitColors.added,
                color_modified = gitColors.modified,
                color_removed = gitColors.removed
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
