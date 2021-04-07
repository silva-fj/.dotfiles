local function lsp_status()
    return require('lsp-status').status()
end

require('lualine').setup({
    options = {theme = 'oceanicnext'},
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

-- https://github.com/hoob3rt/lualine.nvim/blob/master/THEMES.md
-- Themes: oceanicnext, gruvbox, onedark, nord, dracula, nightfly
