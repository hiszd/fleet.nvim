augroup ClrThemeNvimTree
        au BufEnter * lua if vim.g.colors_name == 'clrtheme' then require('clrtheme').icon_load() end
augroup end
