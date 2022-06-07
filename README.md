# clrtheme.nvim

Clear dark and light theme for Neovim using [tjdevries/colorbuddy.vim](https://github.com/tjdevries/colorbuddy.vim)

Based on [snazzybuddy by bbenzikry](https://github.com/bbenzikry/snazzybuddy)

## Installation

```vim
" With Vim-Plug
Plug 'tjdevries/colorbuddy.nvim'
Plug 'hiszd/clrtheme.nvim'

" Enable the color scheme
colorscheme clrtheme
```

```lua
-- With packer
use 'tjdevries/colorbuddy.nvim'
use 'hiszd/clrtheme.nvim'
```

```lua
--  in your lua config
require('clrtheme')
```


## Support for web-devicons
clrtheme has built in support for web icons provided in [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons), commonly used with [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)

To enable clrtheme for icons:

```vim
let g:clrtheme_icons = v:true
```

OR 

```lua
vim.g.clrtheme_icons = true
```

## Switching between theme versions

```lua
function ThemeToggle()
    if vim.g.background == 'dark' then
        vim.g.background = 'light'
    else
        vim.g.background = 'dark'
    end
    require('clrtheme').reload()
end

--- ... map this function to any keybinding
```
