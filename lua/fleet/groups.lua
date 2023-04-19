return {
  ---@param c {[string]: string}
  load = function(c)
    local groups = {
          ["Italic"] = { fg = c.none, bg = c.none },
          ["WhiteSpace"] = { fg = c.gray, bg = c.none },
          ["Constant"] = { fg = c.violet, bg = c.none },                  -- any constant
          ["String"] = { fg = c.pink, bg = c.none },                      -- this is a string
          ["Character"] = { fg = c.yellow, bg = c.none },                 -- a character constant: 'c', '\n'
          ["Boolean"] = { fg = c.cyan, bg = c.none },                     -- a boolean constant: TRUE, false
          ["Number"] = { fg = c.yellow, bg = c.none },                    -- a boolean constant: TRUE, false
          ["Float"] = { fg = c.violet, bg = c.none },                     -- a floating point constant: 2.3e10
          ["Identifier"] = { fg = c.gray_120, bg = c.none },              -- any variable name
          ["Function"] = { fg = c.yellow, bg = c.none },                  -- function name (also: methods for classes)
          ["Statement"] = { fg = c.Statement, bg = c.none },              -- any statement
          ["Conditional"] = { fg = c.Conditional, bg = c.none },          -- if, then, else, endif, switch, etc.
          ["Repeat"] = { fg = c.cyan, bg = c.none },                      -- for, do, while, etc.
          ["Label"] = { fg = c.yellow, bg = c.none },                     -- case, default, etc.
          ["Operator"] = { fg = c.cyan, bg = c.none },                    -- sizeof', '+', '*', etc.
          ["Keyword"] = { fg = c.cyan, bg = c.none },                     -- any other keyword
          ["Exception"] = { fg = c.Exception, bg = c.none },              -- try, catch, throw
          ["PreProc"] = { fg = c.PreProc, bg = c.none },                  -- generic Preprocessor
          ["Include"] = { fg = c.Include, bg = c.none },                  -- preprocessor #include
          ["Define"] = { fg = c.lime, bg = c.none },                      -- preprocessor #define
          ["Macro"] = { fg = c.lime, bg = c.none },                       -- same as Define
          ["PreCondit"] = { fg = c.lime, bg = c.none },                   -- preprocessor #if, #else, #endif, etc.
          ["Type"] = { fg = c.blue, bg = c.none },                        -- int, long, char, etc.
          ["StorageClass"] = { fg = c.cyan, bg = c.none },                -- static, register, volatile, etc.
          ["Structure"] = { fg = c.blue, bg = c.none },                   -- struct, union, enum, etc.
          ["Typedef"] = { fg = c.yellow, bg = c.none },                   -- A typedef
          ["Special"] = { fg = c.yellow, bg = c.none },                   -- any special symbol
          ["SpecialChar"] = { fg = c.yellow, bg = c.none, underline = true }, -- special character in a constant
          ["Tag"] = { fg = c.Tag, bg = c.none },                          -- you can use CTRL-] on this
          ["Delimiter"] = { fg = c.Delimiter, bg = c.none },              -- character that needs attention
          ["SpecialComment"] = { fg = c.violet, bg = c.none },            -- special things inside a comment
          ["Debug"] = { fg = c.Debug, bg = c.none },                      -- debugging statements
          ["Underlined"] = { fg = c.Underlined, bg = c.none, underline = true }, -- text that stands out, HTML links
          ["Ignore"] = { fg = c.disabled, bg = c.none },                  -- left blank, hidden
          ["Error"] = { fg = c.error, bg = c.none },                      -- any erroneous construct, also -- see: https://github.com/neovim/neovim/issues/13746
          ["Todo"] = { fg = c.violet, bg = c.none, bold = true, italic = true }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
          ["Comment"] = { fg = c.gray_90, bg = c.none },                  -- any comment
      -- Barbar highlighting
          ["BufferInactive"] = { fg = c.gray1, bg = c.linebg },
          ["BufferInactiveIndex"] = { fg = c.Special, bg = c.linebg },
          ["BufferInactiveMod"] = { fg = c.gray1, bg = c.linebg },
          ["BufferInactiveSign"] = { fg = c.gray1, bg = c.linebg },
          ["BufferInactiveTarget"] = { fg = c.red, bg = c.linebg },
          ["BufferCurrent"] = { fg = c.fg, bg = c.bg },
          ["BufferVisible"] = { fg = c.fg, bg = c.bg },
          ["BufferVisibleIndex"] = { fg = c.Special, bg = c.bg },
          ["BufferVisibleMod"] = { fg = c.fg, bg = c.bg },
          ["BufferVisibleSign"] = { fg = c.fg, bg = c.bg },
          ["BufferVisibleTarget"] = { fg = c.red, bg = c.bg },
          ["ColorColumn"] = { fg = c.none, bg = c.gray_20 },                            --  used for the columns set with 'colorcolumn'
          ["Conceal"] = { fg = c.blue, bg = c.none },                                   -- placeholder characters substituted for concealed text (see 'conceallevel')
          ["Cursor"] = { reverse = true },                                              -- the character under the cursor
          ["CursorIM"] = { reverse = true },                                            -- like Cursor, but used when in IME mode
          ["Directory"] = { fg = c.violet, bg = c.none, bold = true },                  -- directory names (and other special names in listings)
          ["DiffAdd"] = { fg = c.green, bg = c.none },                                  -- diff mode: Added line
          ["DiffChange"] = { fg = c.orange, bg = c.none },                              --  diff mode: Changed line
          ["DiffDelete"] = { fg = c.red, bg = c.none },                                 -- diff mode: Deleted line
          ["DiffText"] = { fg = c.blue, bg = c.none },                                  -- diff mode: Changed text within a changed line
          ["EndOfBuffer"] = { fg = c.invisibles, bg = c.none },                         -- filler lines (~) after the last line in the buffer
          ["ErrorMsg"] = { fg = c.fg1, bg = c.bg },                                     -- error messages on the command line
          ["VertSplit"] = { fg = c.selection, bg = c.none },                            -- the column separating verti-- cally split windows
          ["Folded"] = { fg = c.gray_70, bg = c.none, italic = true },                  -- line used for closed folds
          ["FoldColumn"] = { fg = c.gray_50, bg = c.none },                             -- 'foldcolumn'
          ["SignColumn"] = { fg = c.gray_50, bg = c.none },                             -- column where signs are displayed
          ["IncSearch"] = { fg = c.selection, bg = c.incsearch, reverse = true, bold = true }, -- 'incsearch' highlighting; also used for the text replaced with ':s///c'
          ["LineNr"] = { fg = c.gray_70, bg = c.none },                                 -- Line number for ':number' and ':#' commands, and when 'number' or 'relativenumber' option is set.
          ["CursorLineNr"] = { fg = c.gray_110, bg = c.none },                          -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
          ["MatchParen"] = { fg = c.cyan, bg = c.none, bold = true },                   -- The character under the cursor or just before it, if it is a paired bracket, and its match.
          ["ModeMsg"] = { fg = c.green, bg = c.none },                                  -- 'showmode' message (e.g., '-- INSERT --')
          ["MoreMsg"] = { link = "ModeMsg" },                                           -- more-prompt
          ["NonText"] = { fg = c.fg1, bg = c.none },                                    -- '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., '>' displayed when a double-wide character doesn't fit at the end of the line).
          ["Normal"] = { fg = c.gray_120, bg = c.gray_10 },                             -- normal text
          ["NormalFloat"] = { fg = c.gray_120, bg = c.gray_10 },                        -- normal text
      -- Popup Menu colors(e.g. nvim-cmp)
          ["Menu"] = { fg = c.fg1, bg = c.bg1 },                                        -- Popup menu: normal item.
          ["Pmenu"] = { fg = c.fg1, bg = c.bg1 },                                       -- Popup menu: normal item.
          ["PmenuSel"] = { fg = c.selection, bg = c.bg },                               -- Popup menu: selected item.
          ["PmenuSbar"] = { fg = c.fg1, bg = c.bg1 },                                   -- Popup menu: scrollbar.
          ["PmenuThumb"] = { fg = c.fg1, bg = c.accent },                               -- Popup menu: Thumb of the scrollbar.
          ["Question"] = { fg = c.blue, bg = c.none, bold = true },                     -- hit-enter prompt and yes/opts = {} questions
          ["QuickFixLine"] = { fg = c.fg1, bg = c.bg1, bold = true },                   -- Current quickfix item in the quickfix window.
          ["qfLineNr"] = { link = "Type" },
          ["Search"] = { fg = c.selection, bg = c.search, reverse = true, bold = true }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
          ["SpecialKey"] = { fg = c.gray, bg = c.none },                                -- Meta and special keys listed with ':map', also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
          ["SpellBad"] = { fg = c.red, bg = c.none, italic = true, undercurl = true },  -- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
          ["SpellCap"] = { fg = c.blue, bg = c.none, italic = true, undercurl = true }, -- Word that should start with a capital. This will be combined with the highlighting used otherwise.
          ["SpellLocal"] = { fg = c.cyan, bg = c.none, italic = true, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
          ["SpellRare"] = { fg = c.purple, bg = c.none, italic = true, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
          ["StatusLine"] = { fg = c.fg1, bg = c.bg1 },                                  -- status line of current window
          ["StatusLineNC"] = { fg = c.comments, bg = c.selection },                     -- status lines of not-current windows Note: if this is equal to 'StatusLine' Vim will use '^^^' in the status line of the current window.
          ["StatusLineTerm"] = { fg = c.bg, bg = c.green, link = "StatusLine" },        -- status line of current :terminal window
          ["StatusLineTermNC"] = { link = "StatusLineNC" },                             -- status line of non-current :terminal window
          ["TabLineFill"] = { fg = c.fg1, bg = c.bg1 },
          ["TabLineSel"] = { fg = c.fg1, bg = c.bg },
          ["TabLine"] = { fg = c.blue2, bg = c.bg1 },
          ["Title"] = { fg = c.blue, bg = c.none, bold = true }, -- titles for output from ':set all', ':autocmd' etc.
          ["Visual"] = { fg = c.none, bg = c.selection },        -- Visual mode selection
          ["VisualNOS"] = { link = "Visual" },                   -- Visual mode selection when vim is 'Not Owning the Selection'. Only X11 Gui's gui-x11 and xterm-clipboard supports this.
          ["WarningMsg"] = { fg = c.red, bg = c.none },          --  warning messages
          ["WildMenu"] = { fg = c.red, bg = c.selection, bold = true }, --  current match in 'wildmenu' completion
          ["CursorColumn"] = { fg = c.none, bg = c.none },       -- Current cursor column highlight
          ["CursorLine"] = { fg = c.none, bg = c.gray_20 },      -- Current cursor line highlight
          ["ToolbarLine"] = { fg = c.fg1, bg = c.disabled },
          ["ToolbarButton"] = { fg = c.fg1, bg = c.bg, bold = true },
          ["NormalMode"] = { fg = c.accent, bg = c.none, reverse = true },
          ["InsertMode"] = { fg = c.green, bg = c.none, reverse = true },
          ["ReplaceMode"] = { fg = c.red, bg = c.none, reverse = true },
          ["VisualMode"] = { fg = c.purple, bg = c.none, reverse = true },
          ["CommandMode"] = { fg = c.gray, bg = c.none, reverse = true },
          ["Warnings"] = { fg = c.orange, bg = c.none, reverse = true },
      -- Plugin highlight

      -- CMP
          ["CmpItemMenu"] = { fg = c.blue, bg = c.bg1 },
          ["CmpItemSel"] = { fg = c.orange, bg = c.bg1, undercurl = true },
          ["CmpItemAbbr"] = { fg = c.fg, bg = c.none },
          ["CmpItemKind"] = { fg = c.blue, bg = c.none },
          ["CmpItemAbbrDeprecated"] = { fg = c.gray, bg = c.none },
          ["CmpItemAbbrMatch"] = { fg = c.blue, bg = c.none },
          ["CmpItemAbbrMatchFuzzy"] = { fg = c.cyan, bg = c.none },
          ["CmpItemKindVariable"] = { fg = c.cyan, bg = c.none },
          ["CmpItemKindInterface"] = { fg = c.cyan, bg = c.none },
          ["CmpItemKindText"] = { fg = c.cyan, bg = c.none },
          ["CmpItemKindFunction"] = { fg = c.red, bg = c.none },
          ["CmpItemKindMethod"] = { fg = c.red, bg = c.none },
          ["CmpItemKindKeyword"] = { fg = c.fg, bg = c.none },
          ["CmpItemKindProperty"] = { fg = c.fg, bg = c.none },
          ["CmpItemKindUnit"] = { fg = c.fg, bg = c.none },
          ["CmpItemKindField"] = { fg = c.bg1, bg = c.orange },
          ["CmpItemKindEvent"] = { fg = c.fg1, bg = c.none },
          ["CmpItemKindEnum"] = { fg = c.bg1, bg = c.green },
          ["CmpItemKindConstant"] = { fg = c.bg1, bg = c.orange },
          ["CmpItemKindConstructor"] = { fg = c.bg1, bg = c.brown },
          ["CmpItemKindReference"] = { fg = c.bg1, bg = c.yellow },
          ["CmpItemKindStruct"] = { fg = c.bg1, bg = c.purple },
          ["CmpItemKindClass"] = { fg = c.bg1, bg = c.purple },
          ["CmpItemKindModule"] = { fg = c.fg1, bg = c.none },
          ["CmpItemKindOperator"] = { fg = c.fg1, bg = c.none },
          ["CmpItemKindFile"] = { fg = c.bg1, bg = c.grey },
          ["CmpItemKindSnippet"] = { fg = c.fg1, bg = c.none },
          ["CmpItemKindFolder"] = { fg = c.fg1, bg = c.none },
          ["CmpItemKindValue"] = { fg = c.blue, bg = c.none },
          ["CmpItemKindEnumMember"] = { fg = c.blue, bg = c.none },
          ["CmpItemKindColor"] = { fg = c.bg1, bg = c.blue2 },
          ["CmpItemKindTypeParameter"] = { fg = c.blue_light, bg = c.cyan },
      -- Telescope
          ["TelescopeSelection"] = { fg = c.purple, bg = c.none, bold = true }, -- selected item
          ["TelescopeSelectionCaret"] = { fg = c.green, bg = c.none },   -- selection caret
      -- Group.new('TelescopeMultiSelection', c.brown, c.none) -- multisections
      -- Group.new('TelescopeNormal', g.Normal, c.g.Normal) --  floating windows created by telescope.
          ["TelescopeMatching"] = { fg = c.orange, bg = c.none },
      -- Group.new('TelescopePromptPrefix', c.none, c.none)

      -- --  Telescope Border highlight groups.
          ["TelescopeBorder"] = { fg = c.fg1, bg = c.none, bold = true }, -- selected item
      -- Group.new('TelescopePromptBorder', c.orange, c.none, bold=true) -- selected item
      -- Group.new('TelescopeResultsBorder', c.orange, c.none, bold=true) -- selected item
      -- Group.new('TelescopePreviewBorder', c.orange, c.none, bold=true) -- selected item

      -- +- Neovim Support -+
          ["healthError"] = { fg = c.error, bg = c.fg2 },
          ["healthSuccess"] = { fg = c.green, bg = c.bg },
          ["healthWarning"] = { fg = c.yellow, bg = c.bg },
          ["TermCursorNC"] = { fg = c.fg1, bg = c.bg },
      -- LSP Groups ( see `:h lsp-highlight`)
          ["LspDiagnosticsDefaultError"] = { fg = c.error, bg = c.none }, -- Base highlight for errors
          ["LspDiagnosticsDefaultWarning"] = { fg = c.yellow, bg = c.none }, -- Base highlight for warnings
          ["LSPDiagnosticsDefaultInformation"] = { fg = c.blue, bg = c.none }, -- Base highlight for info
          ["LspDiagnosticsDefaultHint"] = { fg = c.green, bg = c.none }, -- Base highlight for hints
          ["LspReferenceText"] = { fg = c.none, bg = c.lsp_background }, -- used for highlighting 'text' references
          ["LspReferenceRead"] = { fg = c.none, bg = c.lsp_background }, -- used for highlighting 'read' references
          ["LspReferenceWrite"] = { fg = c.none, bg = c.lsp_background }, -- used for highlighting 'write' references
      -- Treesitter rainbow parentheses (https://github.com/p00f/nvim-ts-rainbow)
          ["rainbowcol1"] = { fg = c.blue, bg = nil },
          ["rainbowcol2"] = { fg = c.orange, bg = nil },
          ["rainbowcol3"] = { fg = c.green, bg = nil },
          ["rainbowcol4"] = { fg = c.red, bg = nil },
          ["rainbowcol5"] = { fg = c.purple, bg = nil },
          ["rainbowcol6"] = { fg = c.cyan, bg = nil },
          ["rainbowcol7"] = { fg = c.brown, bg = nil },
      -- Treesitter Defs
          ["@type.return"] = { fg = c.blue_light, bg = c.none },
          ["@type.parameter"] = { fg = c.blue_light, bg = c.none },
          ["@constructor"] = { fg = c.yellow, bg = c.none },
          ["@constant"] = { fg = c.violet, bg = c.none },
          ["@constant.builtin.boolean"] = { fg = c.cyan, bg = c.none },
          ["@constant.character"] = { fg = c.yellow, bg = c.none },
          ["@constant.character.escape"] = { fg = c.cyan, bg = c.none },
          ["@constant.numeric"] = { fg = c.yellow, bg = c.none },
          ["@punctuation.bracket"] = { fg = c.gray_120 },
          ["@string"] = { fg = c.pink, bg = c.none },
          ["@string.regexp"] = { fg = c.cyan, bg = c.none },
          ["@string.special"] = { fg = c.yellow, underline = true },
          ["@comment"] = { fg = c.gray_90, bg = c.none },
          ["@variable"] = { fg = c.gray_120, bg = c.none },
          ["@variable.builtin"] = { fg = c.coral },
          ["@variable.other.member"] = { fg = c.violet },
          ["@label"] = { fg = c.yellow },
          ["@keyword"] = { fg = c.cyan },
          ["@function"] = { fg = c.yellow },
          ["@function.declaration"] = { fg = c.gray_130 },
          ["@function.macro"] = { fg = c.lime },
          ["@function.builtin"] = { fg = c.lime },
          ["@function.special"] = { fg = c.lime },
          ["@tag"] = { fg = c.blue },
          ["@special"] = { fg = c.lime },
          ["@namespace"] = { fg = c.blue },
          ["@field"] = { fg = c.violet },
          ["@brack"] = { fg = c.gray_120 },
          ["@lsp.type.property"] = { fg = c.violet },
          ["@lsp.type.typeParameter"] = { link = "Type" },
          ["@lsp.type.decorator"] = {},
    }

    return groups
  end,
}
