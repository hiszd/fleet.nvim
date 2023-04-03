return {
  load = function(c)
    local groups = {
      ["Italic"] = { fg = c.none, bg = c.none },
      ["WhiteSpace"] = { fg = c.gray, bg = c.none },
      ["Constant"] = { fg = c.Constant, bg = c.none }, -- any constant
      ["String"] = { fg = c.String, bg = c.none }, -- this is a string
      ["Character"] = { fg = c.Character, bg = c.none }, -- a character constant: 'c', '\n'
      ["Boolean"] = { fg = c.Boolean, bg = c.none }, -- a boolean constant: TRUE, false
      ["Number"] = { fg = c.Number, bg = c.none }, -- a boolean constant: TRUE, false
      ["Float"] = { fg = c.Float, bg = c.none }, -- a floating point constant: 2.3e10
      ["Identifier"] = { fg = c.Identifier, bg = c.none }, -- any variable name
      ["Function"] = { fg = c.Function, bg = c.none }, -- function name (also: methods for classes)
      ["Statement"] = { fg = c.Statement, bg = c.none }, -- any statement
      ["Conditional"] = { fg = c.Conditional, bg = c.none }, -- if, then, else, endif, switch, etc.
      ["Repeat"] = { fg = c.Repeat, bg = c.none }, -- for, do, while, etc.
      ["Label"] = { fg = c.Label, bg = c.none }, -- case, default, etc.
      ["Operator"] = { fg = c.Operator, bg = c.none }, -- sizeof', '+', '*', etc.
      ["Keyword"] = { fg = c.Keyword, bg = c.none }, -- any other keyword
      ["Exception"] = { fg = c.Exception, bg = c.none }, -- try, catch, throw
      ["PreProc"] = { fg = c.PreProc, bg = c.none }, -- generic Preprocessor
      ["Include"] = { fg = c.Include, bg = c.none }, -- preprocessor #include
      ["Define"] = { fg = c.Define, bg = c.none }, -- preprocessor #define
      ["Macro"] = { fg = c.Macro, bg = c.none }, -- same as Define
      ["PreCondit"] = { fg = c.PreCondit, bg = c.none }, -- preprocessor #if, #else, #endif, etc.
      ["Type"] = { fg = c.Type, bg = c.none }, -- int, long, char, etc.
      ["StorageClass"] = { fg = c.StorageClass, bg = c.none }, -- static, register, volatile, etc.
      ["Structure"] = { fg = c.Structure, bg = c.none }, -- struct, union, enum, etc.
      ["Typedef"] = { fg = c.Typedef, bg = c.none }, -- A typedef
      ["Special"] = { fg = c.Special, bg = c.none }, -- any special symbol
      ["SpecialChar"] = { fg = c.SpecialChar, bg = c.none }, -- special character in a constant
      ["Tag"] = { fg = c.Tag, bg = c.none }, -- you can use CTRL-] on this
      ["Delimiter"] = { fg = c.Delimiter, bg = c.none }, -- character that needs attention
      ["SpecialComment"] = { fg = c.SpecialComment, bg = c.none }, -- special things inside a comment
      ["Debug"] = { fg = c.Debug, bg = c.none }, -- debugging statements
      ["Underlined"] = { fg = c.Underlined, bg = c.none, underline = true }, -- text that stands out, HTML links
      ["Ignore"] = { fg = c.disabled, bg = c.none }, -- left blank, hidden
      ["Error"] = { fg = c.error, bg = c.none }, -- any erroneous construct, also -- see: https://github.com/neovim/neovim/issues/13746
      ["Todo"] = { fg = c.Todo, bg = c.none, bold = true, italic = true }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

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

      ["ColorColumn"] = { fg = c.fg3, bg = c.bg }, --  used for the columns set with 'colorcolumn'
      ["Conceal"] = { fg = c.blue, bg = c.bg }, -- placeholder characters substituted for concealed text (see 'conceallevel')
      ["Cursor"] = { fg = c.bg, bg = c.fg1, bold = true, reverse = true }, -- the character under the cursor
      ["CursorIM"] = { fg = c.fg1, bg = c.none, reverse = true }, -- like Cursor, but used when in IME mode
      -- Group.new('InvisibleCursor', c.red, c.red, bold=true) -- like Cursor, but used when in IME mode
      ["Directory"] = { fg = c.blue, bg = c.none, bold = true }, -- directory names (and other special names in listings)
      ["DiffAdd"] = { fg = c.green, bg = c.none }, -- diff mode: Added line
      ["DiffChange"] = { fg = c.orange, bg = c.none }, --  diff mode: Changed line
      ["DiffDelete"] = { fg = c.red, bg = c.none }, -- diff mode: Deleted line
      ["DiffText"] = { fg = c.blue, bg = c.none }, -- diff mode: Changed text within a changed line
      ["EndOfBuffer"] = { fg = c.invisibles, bg = c.none }, -- filler lines (~) after the last line in the buffer
      ["ErrorMsg"] = { fg = c.fg1, bg = c.bg }, -- error messages on the command line
      ["VertSplit"] = { fg = c.selection, bg = c.none }, -- the column separating verti-- cally split windows
      ["Folded"] = { fg = c.gray, bg = c.bg, italic = true }, -- line used for closed folds
      ["FoldColumn"] = { fg = c.blue, bg = c.none }, -- 'foldcolumn'
      ["SignColumn"] = { fg = c.fg1, bg = c.bg }, -- column where signs are displayed
      ["IncSearch"] = { fg = c.selection, bg = c.incsearch, reverse = true, bold = true }, -- 'incsearch' highlighting; also used for the text replaced with ':s///c'
      ["LineNr"] = { fg = c.line_numbers, bg = c.bg }, -- Line number for ':number' and ':#' commands, and when 'number' or 'relativenumber' option is set.
      ["CursorLineNr"] = { fg = c.accent, bg = c.bg }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
      ["MatchParen"] = { fg = c.cyan, bg = c.none, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match.
      ["ModeMsg"] = { fg = c.green, bg = c.none }, -- 'showmode' message (e.g., '-- INSERT --')
      ["MoreMsg"] = { link = "ModeMsg" }, -- more-prompt
      ["NonText"] = { fg = c.fg1, bg = c.none }, -- '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., '>' displayed when a double-wide character doesn't fit at the end of the line).
      ["Normal"] = { fg = c.fg1, bg = c.bg }, -- normal text
      ["NormalFloat"] = { fg = c.fg1, bg = c.bg }, -- normal text

      -- Popup Menu colors(e.g. nvim-cmp)
      ["Menu"] = { fg = c.fg1, bg = c.bg1 }, -- Popup menu: normal item.
      ["Pmenu"] = { fg = c.fg1, bg = c.bg1 }, -- Popup menu: normal item.
      ["PmenuSel"] = { fg = c.selection, bg = c.bg }, -- Popup menu: selected item.
      ["PmenuSbar"] = { fg = c.fg1, bg = c.bg1 }, -- Popup menu: scrollbar.
      ["PmenuThumb"] = { fg = c.fg1, bg = c.accent }, -- Popup menu: Thumb of the scrollbar.

      ["Question"] = { fg = c.blue, bg = c.none, bold = true }, -- hit-enter prompt and yes/opts = {} questions
      ["QuickFixLine"] = { fg = c.fg1, bg = c.bg1, bold = true }, -- Current quickfix item in the quickfix window.
      ["qfLineNr"] = { link = "Type" },
      ["Search"] = { fg = c.selection, bg = c.search, reverse = true, bold = true }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
      ["SpecialKey"] = { fg = c.gray, bg = c.none }, -- Meta and special keys listed with ':map', also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
      ["SpellBad"] = { fg = c.red, bg = c.none, italic = true, undercurl = true }, -- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
      ["SpellCap"] = { fg = c.blue, bg = c.none, italic = true, undercurl = true }, -- Word that should start with a capital. This will be combined with the highlighting used otherwise.
      ["SpellLocal"] = { fg = c.cyan, bg = c.none, italic = true, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
      ["SpellRare"] = { fg = c.purple, bg = c.none, italic = true, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
      ["StatusLine"] = { fg = c.fg1, bg = c.bg1 }, -- status line of current window
      ["StatusLineNC"] = { fg = c.comments, bg = c.selection }, -- status lines of not-current windows Note: if this is equal to 'StatusLine' Vim will use '^^^' in the status line of the current window.
      ["StatusLineTerm"] = { fg = c.bg, bg = c.green, link = "StatusLine" }, -- status line of current :terminal window
      ["StatusLineTermNC"] = { link = "StatusLineNC" }, -- status line of non-current :terminal window
      ["TabLineFill"] = { fg = c.fg1, bg = c.bg1 },
      ["TabLineSel"] = { fg = c.fg1, bg = c.bg },
      ["TabLine"] = { fg = c.blue2, bg = c.bg1 },
      ["Title"] = { fg = c.blue, bg = c.none, bold = true }, -- titles for output from ':set all', ':autocmd' etc.
      ["Visual"] = { fg = c.none, bg = c.selection }, -- Visual mode selection
      ["VisualNOS"] = { link = "Visual" }, -- Visual mode selection when vim is 'Not Owning the Selection'. Only X11 Gui's gui-x11 and xterm-clipboard supports this.
      ["WarningMsg"] = { fg = c.red, bg = c.none }, --  warning messages
      ["WildMenu"] = { fg = c.red, bg = c.selection, bold = true }, --  current match in 'wildmenu' completion
      ["CursorColumn"] = { fg = c.none, bg = c.selection }, -- Current cursor column highlight
      ["CursorLine"] = { fg = c.none, bg = c.cursorline }, -- Current cursor line highlight
      ["ToolbarLine"] = { fg = c.fg1, bg = c.disabled },
      ["ToolbarButton"] = { fg = c.fg1, bg = c.bg, bold = true },
      ["NormalMode"] = { fg = c.accent, bg = c.none, reverse = true },
      ["InsertMode"] = { fg = c.green, bg = c.none, reverse = true },
      ["ReplaceMode"] = { fg = c.red, bg = c.none, reverse = true },
      ["VisualMode"] = { fg = c.purple, bg = c.none, reverse = true },
      ["CommandMode"] = { fg = c.gray, bg = c.none, reverse = true },
      ["Warnings"] = { fg = c.orange, bg = c.none, reverse = true },

      -- Language-specific highlighting

      -- C
      ["cOperator"] = { fg = c.cyan, bg = c.none },
      ["cStructure"] = { fg = c.yellow, bg = c.none },
      -- CoffeeScript
      ["coffeeExtendedOp"] = { fg = c.fg1, bg = c.none },
      ["coffeeSpecialOp"] = { fg = c.fg2, bg = c.none },
      ["coffeeCurly"] = { fg = c.orange, bg = c.none },
      ["coffeeParen"] = { fg = c.fg3, bg = c.none },
      ["coffeeBracket"] = { fg = c.orange, bg = c.none },
      -- Clojure
      -- Note that these won't have an effect if using treesitter
      ["clojureKeyword"] = { fg = c.blue, bg = c.none },
      ["clojureCond"] = { fg = c.orange, bg = c.none },
      ["clojureSpecial"] = { fg = c.orange, bg = c.none },
      ["clojureDefine"] = { fg = c.orange, bg = c.none },
      ["clojureFunc"] = { fg = c.purple, bg = c.none },
      ["clojureSymbol"] = { fg = c.purple, bg = c.none },
      ["clojureRepeat"] = { fg = c.yellow, bg = c.none },
      ["clojureCharacter"] = { fg = c.cyan, bg = c.none },
      ["clojureStringEscape"] = { fg = c.cyan, bg = c.none },
      ["clojureException"] = { fg = c.red, bg = c.none },
      ["clojureRegexp"] = { fg = c.cyan, bg = c.none },
      ["clojureRegexpEscape"] = { fg = c.cyan, bg = c.none },
      ["clojureRegexpCharClass"] = { fg = c.fg3, bg = c.none, bold = true },
      ["clojureRegexpMod"] = { link = "clojureRegexpCharClass" },
      ["clojureRegexpQuantifier"] = { link = "clojureRegexpCharClass" },
      ["clojureParen"] = { fg = c.fg3, bg = c.none },
      ["clojureAnonArg"] = { fg = c.yellow, bg = c.none },
      ["clojureVariable"] = { fg = c.blue, bg = c.none },
      ["clojureMacro"] = { fg = c.orange, bg = c.none },
      ["clojureMeta"] = { fg = c.yellow, bg = c.none },
      ["clojureDeref"] = { fg = c.yellow, bg = c.none },
      ["clojureQuote"] = { fg = c.yellow, bg = c.none },
      ["clojureUnquote"] = { fg = c.yellow, bg = c.none },
      -- CSS
      ["cssBraces"] = { fg = c.blue, bg = c.none },
      ["cssFunctionName"] = { fg = c.yellow, bg = c.none },
      ["cssIdentifier"] = { fg = c.orange, bg = c.none },
      ["cssClassName"] = { fg = c.purple, bg = c.none },
      ["cssColor"] = { fg = c.blue, bg = c.none },
      ["cssSelectorOp"] = { fg = c.blue, bg = c.none },
      ["cssSelectorOp2"] = { fg = c.blue, bg = c.none },
      ["cssImportant"] = { fg = c.green, bg = c.none },
      ["cssVendor"] = { fg = c.fg1, bg = c.none },
      ["cssTextProp"] = { fg = c.cyan, bg = c.none },
      ["cssAnimationProp"] = { fg = c.cyan, bg = c.none },
      ["cssUIProp"] = { fg = c.yellow, bg = c.none },
      ["cssTransformProp"] = { fg = c.cyan, bg = c.none },
      ["cssTransitionProp"] = { fg = c.cyan, bg = c.none },
      ["cssPrintProp"] = { fg = c.cyan, bg = c.none },
      ["cssPositioningProp"] = { fg = c.yellow, bg = c.none },
      ["cssBoxProp"] = { fg = c.cyan, bg = c.none },
      ["cssFontDescriptorProp"] = { fg = c.cyan, bg = c.none },
      ["cssFlexibleBoxProp"] = { fg = c.cyan, bg = c.none },
      ["cssBorderOutlineProp"] = { fg = c.cyan, bg = c.none },
      ["cssBackgroundProp"] = { fg = c.cyan, bg = c.none },
      ["cssMarginProp"] = { fg = c.cyan, bg = c.none },
      ["cssListProp"] = { fg = c.cyan, bg = c.none },
      ["cssTableProp"] = { fg = c.cyan, bg = c.none },
      ["cssFontProp"] = { fg = c.cyan, bg = c.none },
      ["cssPaddingProp"] = { fg = c.cyan, bg = c.none },
      ["cssDimensionProp"] = { fg = c.cyan, bg = c.none },
      ["cssRenderProp"] = { fg = c.cyan, bg = c.none },
      ["cssColorProp"] = { fg = c.cyan, bg = c.none },
      ["cssGeneratedContentProp"] = { fg = c.cyan, bg = c.none },
      -- DTD
      ["dtdFunction"] = { fg = c.gray, bg = c.none },
      ["dtdTagName"] = { fg = c.purple, bg = c.none },
      ["dtdParamEntityPunct"] = { fg = c.gray, bg = c.none },
      ["dtdParamEntityDPunct"] = { fg = c.gray, bg = c.none },
      -- Diff
      ["diffAdded"] = { fg = c.green, bg = c.none },
      ["diffRemoved"] = { fg = c.red, bg = c.none },
      ["diffChanged"] = { fg = c.cyan, bg = c.none },
      ["diffFile"] = { fg = c.orange, bg = c.none },
      ["diffNewFile"] = { fg = c.green, bg = c.none },
      ["diffLine"] = { fg = c.blue, bg = c.none },
      -- Elixir
      ["elixirDocString"] = { link = "Comment" },
      ["elixirStringDelimiter"] = { fg = c.green, bg = c.none },
      ["elixirInterpolationDelimiter"] = { fg = c.cyan, bg = c.none },
      ["elixirModuleDeclaration"] = { fg = c.yellow, bg = c.none },
      -- Go
      ["goDirective"] = { fg = c.cyan, bg = c.none },
      ["goConstants"] = { fg = c.purple, bg = c.none },
      ["goDeclaration"] = { link = "Keyword" },
      ["goDeclType"] = { fg = c.blue, bg = c.none },
      ["goBuiltins"] = { fg = c.orange, bg = c.none },
      -- Haskell
      ["haskellType"] = { fg = c.fg1, bg = c.none },
      ["haskellIdentifier"] = { fg = c.fg1, bg = c.none },
      ["haskellSeparator"] = { fg = c.fg1, bg = c.none },
      ["haskellDelimiter"] = { fg = c.fg3, bg = c.none },
      ["haskellOperators"] = { fg = c.blue, bg = c.none },
      ["haskellBacktick"] = { fg = c.orange, bg = c.none },
      ["haskellStatement"] = { fg = c.orange, bg = c.none },
      ["haskellConditional"] = { fg = c.orange, bg = c.none },
      ["haskellLet"] = { fg = c.cyan, bg = c.none },
      ["haskellDefault"] = { fg = c.cyan, bg = c.none },
      ["haskellWhere"] = { fg = c.cyan, bg = c.none },
      ["haskellBottom"] = { fg = c.cyan, bg = c.none },
      ["haskellBlockKeywords"] = { fg = c.cyan, bg = c.none },
      ["haskellImportKeywords"] = { fg = c.cyan, bg = c.none },
      ["haskellDeclKeyword"] = { fg = c.cyan, bg = c.none },
      ["haskellDeriving"] = { fg = c.cyan, bg = c.none },
      ["haskellAssocType"] = { fg = c.cyan, bg = c.none },
      ["haskellNumber"] = { fg = c.purple, bg = c.none },
      ["haskellPragma"] = { fg = c.purple, bg = c.none },
      ["haskellString"] = { fg = c.green, bg = c.none },
      ["haskellChar"] = { fg = c.green, bg = c.none },

      -- C#
      ["csClass"] = { fg = c.yellow, bg = c.none },
      ["csAttribute"] = { fg = c.yellow, bg = c.none },
      ["csModifier"] = { fg = c.purple, bg = c.none },
      ["csType"] = { fg = c.red, bg = c.none },
      ["csUnspecifiedStatement"] = { fg = c.blue, bg = c.none },
      ["csContextualStatement"] = { fg = c.purple, bg = c.none },
      ["csNewDecleration"] = { fg = c.red, bg = c.none },

      -- HTML (keep consistent with Markdown, below)
      ["htmlTag"] = { fg = c.blue, bg = c.none },
      ["htmlEndTag"] = { fg = c.blue, bg = c.none },
      ["htmlTagName"] = { fg = c.red, bg = c.none },
      ["htmlArg"] = { fg = c.cyan, bg = c.none },
      ["htmlScriptTag"] = { fg = c.purple, bg = c.none },
      ["htmlTagN"] = { fg = c.fg1, bg = c.none },
      ["htmlSpecialTagName"] = { fg = c.cyan, bg = c.none, bold = true },
      ["htmlLink"] = { fg = c.link, bg = c.none, underline = true },
      ["htmlSpecialChar"] = { fg = c.orange, bg = c.none },
      ["htmlBold"] = { fg = c.htmlBold, bg = c.none, bold = true },
      ["htmlBoldUnderline"] = { fg = c.fg2, bg = c.none, bold = true, underline = true },
      ["htmlBoldItalic"] = { fg = c.fg1, bg = c.none, bold = true, italic = true },
      ["htmlBoldUnderlineItalic"] = {
        fg = c.fg2,
        bg = c.none,
        bold = true,
        italic = true,
        underline = true,
      },
      ["htmlUnderline"] = { fg = c.fg1, bg = c.none, underline = true },
      ["htmlUnderlineItalic"] = { fg = c.fg2, bg = c.none, italic = true, underline = true },
      ["htmlItalic"] = { fg = c.purple, bg = c.none, italic = true },
      ["htmlH1"] = { fg = c.heading, bg = c.none, bold = true },
      ["htmlH2"] = { fg = c.heading, bg = c.none, bold = true },
      ["htmlH3"] = { fg = c.heading, bg = c.none, bold = true },
      ["htmlH4"] = { fg = c.heading, bg = c.none, bold = true },
      ["htmlH5"] = { fg = c.heading, bg = c.none },
      ["htmlH6"] = { fg = c.heading, bg = c.none },
      -- Java
      ["javaAnnotation"] = { fg = c.blue, bg = c.none },
      ["javaDocTags"] = { fg = c.cyan, bg = c.none },
      ["javaParen"] = { fg = c.fg3, bg = c.none },
      ["javaParen1"] = { fg = c.fg3, bg = c.none },
      ["javaParen2"] = { fg = c.fg3, bg = c.none },
      ["javaParen3"] = { fg = c.fg3, bg = c.none },
      ["javaParen4"] = { fg = c.fg3, bg = c.none },
      ["javaParen5"] = { fg = c.fg3, bg = c.none },
      ["javaOperator"] = { fg = c.orange, bg = c.none },
      ["javaVarArg"] = { fg = c.green, bg = c.none },
      -- JavaScript
      ["javaScriptBraces"] = { fg = c.fg1, bg = c.none },
      ["javaScriptFunction"] = { fg = c.cyan, bg = c.none },
      ["javaScriptIdentifier"] = { fg = c.red, bg = c.none },
      ["javaScriptMember"] = { fg = c.blue, bg = c.none },
      ["javaScriptNumber"] = { fg = c.purple, bg = c.none },
      ["javaScriptNull"] = { fg = c.purple, bg = c.none },
      ["javaScriptParens"] = { fg = c.fg3, bg = c.none },
      ["javascriptImport"] = { fg = c.cyan, bg = c.none },
      ["javascriptExport"] = { fg = c.cyan, bg = c.none },
      ["javascriptClassKeyword"] = { fg = c.cyan, bg = c.none },
      ["javascriptClassExtends"] = { fg = c.cyan, bg = c.none },
      ["javascriptDefault"] = { fg = c.cyan, bg = c.none },
      ["javascriptClassName"] = { fg = c.yellow, bg = c.none },
      ["javascriptClassSuperName"] = { fg = c.yellow, bg = c.none },
      ["javascriptGlobal"] = { fg = c.yellow, bg = c.none },
      ["javascriptEndColons"] = { fg = c.fg1, bg = c.none },
      ["javascriptFuncArg"] = { fg = c.fg1, bg = c.none },
      ["javascriptGlobalMethod"] = { fg = c.fg1, bg = c.none },
      ["javascriptNodeGlobal"] = { fg = c.fg1, bg = c.none },
      ["javascriptBOMWindowProp"] = { fg = c.fg1, bg = c.none },
      ["javascriptArrayMethod"] = { fg = c.fg1, bg = c.none },
      ["javascriptArrayStaticMethod"] = { fg = c.fg1, bg = c.none },
      ["javascriptCacheMethod"] = { fg = c.fg1, bg = c.none },
      ["javascriptDateMethod"] = { fg = c.fg1, bg = c.none },
      ["javascriptMathStaticMethod"] = { fg = c.fg1, bg = c.none },
      ["javascriptURLUtilsProp"] = { fg = c.fg1, bg = c.none },
      ["javascriptBOMNavigatorProp"] = { fg = c.fg1, bg = c.none },
      ["javascriptDOMDocMethod"] = { fg = c.fg1, bg = c.none },
      ["javascriptDOMDocProp"] = { fg = c.fg1, bg = c.none },
      ["javascriptBOMLocationMethod"] = { fg = c.fg1, bg = c.none },
      ["javascriptBOMWindowMethod"] = { fg = c.fg1, bg = c.none },
      ["javascriptStringMethod"] = { fg = c.fg1, bg = c.none },
      ["javascriptVariable"] = { fg = c.orange, bg = c.none },
      ["javascriptIdentifier"] = { fg = c.orange, bg = c.none },
      ["javascriptClassSuper"] = { fg = c.orange, bg = c.none },
      ["javascriptFuncKeyword"] = { fg = c.cyan, bg = c.none },
      ["javascriptAsyncFunc"] = { fg = c.cyan, bg = c.none },
      ["javascriptClassStatic"] = { fg = c.orange, bg = c.none },
      ["javascriptOperator"] = { fg = c.red, bg = c.none },
      ["javascriptForOperator"] = { fg = c.red, bg = c.none },
      ["javascriptYield"] = { fg = c.red, bg = c.none },
      ["javascriptExceptions"] = { fg = c.red, bg = c.none },
      ["javascriptMessage"] = { fg = c.red, bg = c.none },
      ["javascriptTemplateSB"] = { fg = c.cyan, bg = c.none },
      ["javascriptTemplateSubstitution"] = { fg = c.fg1, bg = c.none },
      ["javascriptLabel"] = { fg = c.fg1, bg = c.none },
      ["javascriptObjectLabel"] = { fg = c.fg1, bg = c.none },
      ["javascriptPropertyName"] = { fg = c.fg1, bg = c.none },
      ["javascriptLogicSymbols"] = { fg = c.fg1, bg = c.none },
      ["javascriptArrowFunc"] = { fg = c.yellow, bg = c.none },
      ["javascriptDocParamName"] = { fg = c.fg3, bg = c.none },
      ["javascriptDocTags"] = { fg = c.fg3, bg = c.none },
      ["javascriptDocNotation"] = { fg = c.fg3, bg = c.none },
      ["javascriptDocParamType"] = { fg = c.fg3, bg = c.none },
      ["javascriptDocNamedParamType"] = { fg = c.fg3, bg = c.none },
      ["javascriptBrackets"] = { fg = c.fg1, bg = c.none },
      ["javascriptDOMElemAttrs"] = { fg = c.fg1, bg = c.none },
      ["javascriptDOMEventMethod"] = { fg = c.fg1, bg = c.none },
      ["javascriptDOMNodeMethod"] = { fg = c.fg1, bg = c.none },
      ["javascriptDOMStorageMethod"] = { fg = c.fg1, bg = c.none },
      ["javascriptHeadersMethod"] = { fg = c.fg1, bg = c.none },
      ["javascriptAsyncFuncKeyword"] = { fg = c.red, bg = c.none, bold = true },
      ["javascriptAwaitFuncKeyword"] = { fg = c.red, bg = c.none, bold = true },
      ["jsClassKeyword"] = { link = "Keyword" },
      ["jsExtendsKeyword"] = { link = "Keyword" },
      ["jsExportDefault"] = { fg = c.blue, bg = c.none, bold = true },
      ["jsTemplateBraces"] = { fg = c.cyan, bg = c.none },
      ["jsGlobalNodeObjects"] = { link = "Keyword" },
      ["jsGlobalObjects"] = { link = "Keyword" },
      ["jsFunction"] = { link = "Function" },
      ["jsFuncParens"] = { fg = c.orange, bg = c.none },
      ["jsParens"] = { fg = c.red, bg = c.none },
      ["jsNull"] = { fg = c.purple, bg = c.none },
      ["jsUndefined"] = { link = "ErrorMsg" },
      ["jsClassDefinition"] = { fg = c.yellow, bg = c.none },
      ["jsObjectProp"] = { link = "Identifier" },
      ["jsObjectKey"] = { fg = c.blue, bg = c.none },
      ["jsFunctionKey"] = { fg = c.blue, bg = c.none },
      ["jsBracket"] = { fg = c.red, bg = c.none },
      ["jsObjectColon"] = { fg = c.red, bg = c.none },
      ["jsFuncBraces"] = { fg = c.blue, bg = c.none },
      ["jsVariableDef"] = { fg = c.fg1, bg = c.none },
      ["jsObjectBraces"] = { link = "Special" },
      ["jsObjectValue"] = { fg = c.green, bg = c.none },
      ["jsClassBlock"] = { fg = c.blue, bg = c.none },
      ["jsFutureKeys"] = { fg = c.orange, bg = c.none, bold = true },
      ["jsFuncArgs"] = { fg = c.blue, bg = c.none },
      ["jsStorageClass"] = { fg = c.blue, bg = c.none },
      ["jsxRegion"] = { fg = c.blue, bg = c.none },
      -- JSON
      ["jsonKeyword"] = { fg = c.green, bg = c.none },
      ["jsonQuote"] = { fg = c.green, bg = c.none },
      ["jsonBraces"] = { fg = c.fg1, bg = c.none },
      ["jsonString"] = { fg = c.fg1, bg = c.none },
      -- Lua
      ["luaIn"] = { fg = c.red, bg = c.none },
      ["luaFunction"] = { fg = c.red, bg = c.none },
      ["luaTable"] = { fg = c.orange, bg = c.none },
      ["luaLabel"] = { fg = c.purple, bg = c.none },

      -- Markdown (keep consistent with HTML, above
      ["markdownItalic"] = { fg = c.fg3, bg = c.none, italic = true },
      ["markdownH1"] = { link = "htmlH1" },
      ["markdownH2"] = { link = "htmlH2" },
      ["markdownH3"] = { link = "htmlH3" },
      ["markdownH4"] = { link = "htmlH4" },
      ["markdownH5"] = { link = "htmlH5" },
      ["markdownH6"] = { link = "htmlH6" },
      ["markdownCode"] = { fg = c.fg1, bg = c.none },
      ["mkdCode"] = { link = "markdownCode" },
      ["markdownCodeBlock"] = { fg = c.purple, bg = c.none },
      ["markdownCodeDelimiter"] = { fg = c.codeDelimiter, bg = c.none },
      ["mkdCodeDelimiter"] = { link = "markdownCodeDelimiter" },
      ["markdownBlockquote"] = { fg = c.gray, bg = c.none },
      ["markdownListMarker"] = { fg = c.gray, bg = c.none },
      ["markdownOrderedListMarker"] = { fg = c.gray, bg = c.none },
      ["markdownRule"] = { fg = c.gray, bg = c.none },
      ["markdownHeadingRule"] = { fg = c.gray, bg = c.none },
      ["markdownUrlDelimiter"] = { fg = c.fg3, bg = c.none },
      ["markdownLinkDelimiter"] = { fg = c.fg3, bg = c.none },
      ["markdownLinkTextDelimiter"] = { fg = c.fg3, bg = c.none },
      ["markdownHeadingDelimiter"] = { fg = c.blue, bg = c.none },
      ["markdownUrl"] = { fg = c.url, bg = c.none, bold = true },
      ["mkdUrl"] = { link = "markdownUrl" },

      ["markdownUrlTitleDelimiter"] = { fg = c.green, bg = c.none },
      ["markdownLinkText"] = { link = "htmlLink" },
      ["mkdLink"] = { link = "htmlLink" },

      ["markdownIdDeclaration"] = { link = "markdownLinkText" },
      -- MoonScript
      ["moonSpecialOp"] = { fg = c.fg3, bg = c.none },
      ["moonExtendedOp"] = { fg = c.fg3, bg = c.none },
      ["moonFunction"] = { fg = c.fg3, bg = c.none },
      ["moonObject"] = { fg = c.yellow, bg = c.none },
      -- Objective-C
      ["objcTypeModifier"] = { fg = c.red, bg = c.none },
      ["objcDirective"] = { fg = c.blue, bg = c.none },
      -- PureScript
      ["purescriptModuleKeyword"] = { fg = c.cyan, bg = c.none },
      ["purescriptModuleName"] = { fg = c.red, bg = c.none, bold = true },
      ["purescriptWhere"] = { fg = c.cyan, bg = c.none },
      ["purescriptDelimiter"] = { fg = c.fg2, bg = c.none },
      ["purescriptType"] = { link = "Type" },
      ["purescriptImportKeyword"] = { link = "Keyword" },
      ["purescriptHidingKeyword"] = { link = "Keyword" },
      ["purescriptAsKeyword"] = { link = "Keyword" },
      ["purescriptStructure"] = { link = "Structure" },
      ["purescriptOperator"] = { link = "Operator" },
      ["purescriptTypeVar"] = { link = "Type" },
      ["purescriptConstructor"] = { link = "Function" },
      ["purescriptFunction"] = { link = "Function" },
      ["purescriptConditional"] = { link = "Conditional" },
      ["purescriptBacktick"] = { fg = c.orange, bg = c.none },
      -- Python
      ["pythonCoding"] = { link = "Comment" },
      ["pythonOperator"] = { fg = c.purple, bg = c.none },
      ["pythonRepeat"] = { fg = c.purple, bg = c.none },
      ["pythonInclude"] = { fg = c.purple, bg = c.none },
      ["pythonStatement"] = { fg = c.purple, bg = c.none },

      -- Ruby
      ["rubyStringDelimiter"] = { fg = c.green, bg = c.none },
      ["rubyConstant"] = { fg = c.cyan, bg = c.none },
      ["rubyAttribute"] = { fg = c.cyan, bg = c.none },
      ["rubyRegexp"] = { fg = c.cyan, bg = c.none },
      ["rubySymbol"] = { fg = c.green, bg = c.none },
      ["rubyInterpolationDelimiter"] = { fg = c.cyan, bg = c.none },

      -- Rust
      ["rustSelf"] = { fg = c.blue, bg = c.none, bold = true },
      ["rustPanic"] = { fg = c.red, bg = c.none, bold = true },
      ["rustAssert"] = { fg = c.blue, bg = c.none, bold = true },
      -- Scala
      ["scalaNameDefinition"] = { fg = c.fg1, bg = c.none },
      ["scalaCaseFollowing"] = { fg = c.fg1, bg = c.none },
      ["scalaCapitalWord"] = { fg = c.fg1, bg = c.none },
      ["scalaTypeExtension"] = { fg = c.fg1, bg = c.none },
      ["scalaKeyword"] = { fg = c.red, bg = c.none, bold = true },
      ["scalaKeywordModifier"] = { fg = c.red, bg = c.none },
      ["scalaSpecial"] = { fg = c.cyan, bg = c.none },
      ["scalaOperator"] = { fg = c.fg1, bg = c.none },
      ["scalaTypeDeclaration"] = { fg = c.yellow, bg = c.none },
      ["scalaTypeTypePostDeclaration"] = { fg = c.yellow, bg = c.none },
      ["scalaInstanceDeclaration"] = { fg = c.fg1, bg = c.none },
      ["scalaInterpolation"] = { fg = c.cyan, bg = c.none },
      -- TypeScript
      ["typeScriptLabel"] = { fg = c.blue, bg = c.none },
      ["typeScriptObjectLabel"] = { fg = c.blue, bg = c.none },
      ["typescriptMember"] = { fg = c.gray1, bg = c.none },
      ["typescriptUnaryOp"] = { fg = c.red1, bg = c.none },
      ["typeScriptReserved"] = { fg = c.cyan, bg = c.none },
      ["typeScriptFuncKeyword"] = { link = "Function" },
      ["typeScriptIdentifier"] = { link = "Identifier" },
      ["typeScriptBraces"] = { fg = c.gray1, bg = c.none },
      ["typeScriptEndColons"] = { fg = c.fg1, bg = c.none },
      ["typeScriptDOMObjects"] = { fg = c.fg1, bg = c.none },
      ["typeScriptAjaxMethods"] = { link = "Function" },
      ["typeScriptLogicSymbols"] = { fg = c.fg1, bg = c.none },
      ["typeScriptDocSeeTag"] = { link = "Comment" },
      ["typeScriptDocParam"] = { link = "Comment" },
      -- Group.new('typeScriptDocTags', g.vimCommentTitle, g.vimCommentTitle, g.vimCommentTitle)
      ["typeScriptGlobalObjects"] = { link = "Keyword" },
      ["typeScriptParens"] = { fg = c.gray1, bg = c.none },
      ["typeScriptOpSymbols"] = { link = "Operator" },
      ["typeScriptHtmlElemProperties"] = { link = "Special" },
      ["typeScriptNull"] = { fg = c.purple, bg = c.none, bold = true },
      ["typeScriptInterpolationDelimiter"] = { fg = c.cyan, bg = c.none },
      ["tsxTag"] = { fg = c.gray1, bg = c.none },
      -- XML
      ["xmlTag"] = { fg = c.blue, bg = c.none },
      ["xmlEndTag"] = { fg = c.blue, bg = c.none },
      ["xmlTagName"] = { fg = c.blue, bg = c.none },
      ["xmlEqual"] = { fg = c.blue, bg = c.none },
      ["docbkKeyword"] = { fg = c.cyan, bg = c.none, bold = true },
      ["xmlDocTypeDecl"] = { fg = c.gray, bg = c.none },
      ["xmlDocTypeKeyword"] = { fg = c.purple, bg = c.none },
      ["xmlCdataStart"] = { fg = c.gray, bg = c.none },
      ["xmlCdataCdata"] = { fg = c.purple, bg = c.none },
      ["xmlAttrib"] = { fg = c.cyan, bg = c.none },
      ["xmlProcessingDelim"] = { fg = c.gray, bg = c.none },
      ["xmlAttribPunct"] = { fg = c.gray, bg = c.none },
      ["xmlEntity"] = { fg = c.orange, bg = c.none },
      ["xmlEntityPunct"] = { fg = c.orange, bg = c.none },
      -- Vim
      ["vimCommentTitle"] = { fg = c.blue, bg = c.none, bold = true },
      ["vimNotation"] = { fg = c.orange, bg = c.none },
      ["vimBracket"] = { fg = c.orange, bg = c.none },
      ["vimMapModKey"] = { fg = c.orange, bg = c.none },
      ["vimCommand"] = { fg = c.accent, bg = c.none, bold = true },
      ["vimLet"] = { fg = c.blue, bg = c.none },
      ["vimNorm"] = { fg = c.blue, bg = c.none },
      ["vimFuncSID"] = { link = "Function" },
      ["vimFunction"] = { link = "Function" },
      ["vimGroup"] = { fg = c.blue, bg = c.none },
      ["vimHiGroup"] = { link = "Type" },
      ["vimSetSep"] = { fg = c.fg3, bg = c.none },
      ["vimSep"] = { fg = c.fg3, bg = c.none },
      ["vimContinue"] = { fg = c.yellow, bg = c.none },

      -- TODO: Cypher
      -- hi link cypherComment              Comment
      -- hi link cypherKeyword              Define
      -- hi link cypherProperty             String
      -- hi link cypherPropertyName         Identifier
      -- hi link cypherRelationship         Identifier
      -- hi link cypherSymbol               Operator
      -- hi link cypherVariable             Identifier

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
      ["CmpItemKindTypeParameter"] = { fg = c.bg1, bg = c.cyan },

      -- Telescope
      ["TelescopeSelection"] = { fg = c.purple, bg = c.none, bold = true }, -- selected item
      ["TelescopeSelectionCaret"] = { fg = c.green, bg = c.none }, -- selection caret
      -- Group.new('TelescopeMultiSelection', c.brown, c.none) -- multisections
      -- Group.new('TelescopeNormal', g.Normal, c.g.Normal) --  floating windows created by telescope.
      ["TelescopeMatching"] = { fg = c.orange, bg = c.none },
      -- Group.new('TelescopePromptPrefix', c.none, c.none)

      -- --  Telescope Border highlight groups.
      ["TelescopeBorder"] = { fg = c.fg1, bg = c.none, bold = true }, -- selected item
      -- Group.new('TelescopePromptBorder', c.orange, c.none, bold=true) -- selected item
      -- Group.new('TelescopeResultsBorder', c.orange, c.none, bold=true) -- selected item
      -- Group.new('TelescopePreviewBorder', c.orange, c.none, bold=true) -- selected item

      -- Scrollview (dstein64/nvim-scrollview)
      ["Scrollview"] = { fg = c.none, bg = c.fg1 },

      -- Signify (mhinz/vim-signify)
      ["SignifySignAdd"] = { fg = c.green, bg = c.none },
      ["SignifySignChange"] = { fg = c.blue, bg = c.none },
      ["SignifySignDelete"] = { fg = c.red, bg = c.none },

      -- gitsigns (lewis6991/gitsigns.nvim)
      ["GitSignsAdd"] = { fg = c.green, bg = c.none },
      ["GitSignsAddNr"] = { fg = c.bg, bg = c.green },
      ["GitSignsAddLn"] = { fg = c.red, bg = c.none },
      ["GitSignsChange"] = { fg = c.orange, bg = c.none },
      ["GitSignsChangeNr"] = { fg = c.bg, bg = c.orange },
      ["GitSignsChangeLn"] = { fg = c.orange, bg = c.none },
      ["GitSignsDelete"] = { fg = c.red, bg = c.none },
      ["GitSignsDeleteNr"] = { fg = c.fg1, bg = c.red },
      ["GitSignsDeleteLn"] = { fg = c.red, bg = c.none },

      -- Git Commit (tpope/vim-git)
      ["gitcommitSelectedFile"] = { fg = c.green, bg = c.none },
      ["gitcommitOverflow"] = { fg = c.red, bg = c.none },
      ["gitcommitSummary"] = { fg = c.green, bg = c.none },
      ["gitcommitComment"] = { fg = c.gray, bg = c.none },
      ["gitcommitUntracked"] = { fg = c.gray, bg = c.none },
      ["gitcommitDiscarded"] = { fg = c.gray, bg = c.none },
      ["gitcommitSelected"] = { fg = c.gray, bg = c.none },
      ["gitcommitHeader"] = { fg = c.purple, bg = c.none },
      ["gitcommitSelectedType"] = { fg = c.blue, bg = c.none },
      ["gitcommitUnmergedType"] = { fg = c.blue, bg = c.none },
      ["gitcommitDiscardedType"] = { fg = c.blue, bg = c.none },
      ["gitcommitBranch"] = { fg = c.orange, bg = c.none },
      ["gitcommitUntrackedFile"] = { fg = c.yellow, bg = c.none },
      ["gitcommitUnmergedFile"] = { fg = c.red, bg = c.none },
      ["gitcommitDiscardedFile"] = { fg = c.red, bg = c.none },

      -- Gitgutter (airblade/vim-gitgutter)
      ["GitGutterAdd"] = { fg = c.green, bg = c.none, bold = true },
      ["GitGutterChange"] = { fg = c.yellow, bg = c.none, bold = true },
      ["GitGutterDelete"] = { fg = c.red, bg = c.none, bold = true },
      ["GitGutterChangeDelete"] = { fg = c.purple, bg = c.none, bold = true },
      -- Git Messenger (rhysd/git-messenger.vim)
      ["gitmessengerPopupNormal"] = { link = "CursorLine" }, -- Normal color in popup window
      ["gitmessengerHeader"] = { link = "CursorLine" }, -- Header such as 'Commit:', 'Author:'
      ["gitmessengerHash"] = { link = "CursorLine" }, -- Commit hash at 'Commit:' header
      ["gitmessengerHistory"] = { link = "CursorLine" }, -- History number at 'History:' header
      -- NvimTree (kyazdani42/nvim-tree.lua)
      ["NvimTreeFolderName"] = { fg = c.fg1, bg = c.none },
      ["NvimTreeFolderIcon"] = { fg = c.accent, bg = c.none },
      ["NvimTreeExecFile"] = { fg = c.green, bg = c.none },
      ["NvimTreeImageFile"] = { fg = c.yellow, bg = c.none },
      ["NvimTreeEmptyFolderName"] = { fg = c.fg1, bg = c.none },
      -- Group.new('NvimTreeIndentMarker', c.white, c.none, opts = {})
      ["NvimTreeMarkdownFile"] = { fg = c.blue, bg = c.none },
      ["NvimTreeSpecialFile"] = { fg = c.blue, bg = c.none },
      ["NvimTreeRootFolder"] = { fg = c.purple, bg = c.none },
      ["NvimTreeGitDirty"] = { fg = c.yellow, bg = c.none },
      ["NvimTreeGitStaged"] = { fg = c.blue, bg = c.none },
      ["NvimTreeGitDeleted"] = { fg = c.red, bg = c.none },
      -- Group.new('NvimTreeGitMerge', c.blue, c.none, opts = {})
      -- Group.new('NvimTreeGitRenamed', c.blue, c.none, opts = {})
      ["NvimTreeGitNew"] = { fg = c.green, bg = c.none },
      -- Group.new('NvimTreeSymlink', c.blue, c.none, opts = {})
      -- NerdTree (preservim/nerdtree)
      ["NERDTreeDir"] = { fg = c.blue, bg = c.none, bold = true },
      ["NERDTreeDirSlash"] = { fg = c.fg1, bg = c.none },
      ["NERDTreeOpenable"] = { fg = c.blue, bg = c.none },
      ["NERDTreeClosable"] = { fg = c.blue, bg = c.none },
      ["NERDTreeFile"] = { fg = c.fg1, bg = c.none },
      ["NERDTreeExecFile"] = { fg = c.green, bg = c.none },
      ["NERDTreeUp"] = { fg = c.red, bg = c.none },
      ["NERDTreeCWD"] = { fg = c.purple, bg = c.none },
      ["NERDTreeHelp"] = { fg = c.fg1, bg = c.none },
      ["NERDTreeToggleOn"] = { fg = c.green, bg = c.none },
      ["NERDTreeToggleOff"] = { fg = c.red, bg = c.none },
      -- Netrw (vim builtin)
      ["netrwDir"] = { fg = c.blue, bg = c.none },
      ["netrwClassify"] = { fg = c.blue, bg = c.none },
      ["netrwLink"] = { fg = c.grey, bg = c.none },
      ["netrwSymLink"] = { fg = c.fg1, bg = c.none },
      ["netrwExe"] = { fg = c.yellow, bg = c.none },
      ["netrwComment"] = { fg = c.grey, bg = c.none },
      ["netrwList"] = { fg = c.blue, bg = c.none },
      ["netrwHelpCmd"] = { fg = c.cyan, bg = c.none },
      ["netrwCmdSep"] = { fg = c.fg3, bg = c.none },
      ["netrwVersion"] = { fg = c.green, bg = c.none },
      -- Which Key (liuchengxu/vim-which-key)
      ["WhichKey"] = { link = "Function" },
      ["WhichKeySeperator"] = { fg = c.purple, bg = c.none },
      ["WhichKeyGroup"] = { link = "Identifier" },
      ["WhichKeyDesc"] = { link = "Operator" },

      -- NeoVim built in

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

      -- LSP Saga
      ["DiagnosticError"] = { fg = c.error, bg = c.none },
      ["DiagnosticWarning"] = { fg = c.yellow, bg = c.none },
      ["DiagnosticInformation"] = { fg = c.blue, bg = c.none },
      ["DiagnosticHint"] = { fg = c.red, bg = c.none },
      ["LspSagaRenameBorder"] = { fg = c.green, bg = c.none },
      ["LspSagaRenamePromptPrefix"] = { fg = c.green, bg = c.none },
      ["LspSagaHoverBorder"] = { fg = c.accent, bg = c.none },
      ["DefinitionPreviewTitle"] = { fg = c.yellow, bg = c.none },
      ["LspSagaDefPreviewBorder"] = { fg = c.yellow, bg = c.none },
      ["LspFloatWinBorder"] = { fg = c.yellow, bg = c.none },
      ["LspSagaFinderSelection"] = { fg = c.green, bg = c.none },
      -- Group.new('LspSagaLspFinderBorder', c.blue, c.none)
      ["LspSagaDocTruncateLine"] = { fg = c.bg, bg = c.none },
      ["LspSagaShTruncateLine"] = { fg = c.bg, bg = c.none },
      ["LspSagaCodeActionTitle"] = { fg = c.orange, bg = c.none, bold = true },
      -- Group.new('LspSagaCodeActionContent', c.green, c.none, bold=true)
      -- Group.new('LspSagaCodeActionTruncateLine', c.bg, c.none)
      -- Group.new('LspSagaAutoPreview', c.orange, c.none)
      ["LspSagaSignatureHelpBorder"] = { fg = c.green, bg = c.none },
      ["LspSagaDiagnosticBorder"] = { fg = c.purple, bg = c.none },
      ["LspSagaDiagnosticHeader"] = { fg = c.orange, bg = c.none, bold = true },
      ["LspSagaDiagnosticTruncateLine"] = { fg = c.purple, bg = c.none },

      -- Lsp saga lightbulb
      ["LspSagaLightBulb"] = { fg = c.yellow, bg = c.none },

      -- LSP specific groups
      -- LSP Floating
      -- Group.new('LspDiagnosticsFloatingError', c.error, c.none)
      -- Group.new('LspDiagnosticsFloatingWarn', c.yellow, c.none)
      -- Group.new('LspDiagnosticsFloatingInfor', c.blue, c.none)
      -- Group.new('LspDiagnosticsFloatingHint', c.blue, c.none)

      -- LSP signs
      -- Group.new('LspDiagnosticsSignError', c.error, c.none)
      -- Group.new('LspDiagnosticsSignWarn', c.yellow, c.none)
      -- Group.new('LspDiagnosticsSignInformation', c.blue, c.none)
      -- Group.new('LspDiagnosticsSignHint', c.blue, c.none)

      -- LSP virtual text
      -- Group.new('LspDiagnosticsVirtualTextError', c.error, c.none)
      -- Group.new('LspDiagnosticsVirtualTextWarn', c.yellow, c.none)
      -- Group.new('LspDiagnosticsVirtualTextInformation', c.blue, c.none)
      -- Group.new('LspDiagnosticsVirtualTextHint', c.blue, c.none)

      -- LSP underline
      -- Group.new('LspDiagnosticsUnderlineError', c.error, c.none)
      -- Group.new('LspDiagnosticsUnderlineWarn', c.yellow, c.none)
      -- Group.new('LspDiagnosticsUnderlineInformation', c.blue, c.none)
      -- Group.new('LspDiagnosticsUnderlineHint', c.blue, c.none)

      -- Nvim Treesitter Groups (descriptions and ordering from `:h nvim-treesitter-highlights`)
      ["TSComment"] = { fg = c.gray, bg = nil },
      ["TSConstructor"] = { fg = c.orange, bg = nil },
      ["TSKeywordFunction"] = { fg = c.red, bg = nil },
      ["TSKeywordReturn"] = { fg = c.red, bg = nil },
      -- Group.new('TSNone', c.none, opts = {})
      ["TSString"] = { fg = c.gray1, bg = nil },
      ["TSTag"] = { fg = c.red, bg = nil },
      ["TSTagAttribute"] = { fg = c.yellow, bg = nil },
      ["TSTagDelimiter"] = { fg = c.gray, bg = nil },
      ["TSTodo"] = { fg = c.yellow, bg = nil },
      ["TSQualifier"] = { fg = c.red, bg = nil },
      ["TSVariableBuiltin"] = { fg = c.orange, bg = nil },
      -- Treesitter rainbow parentheses (https://github.com/p00f/nvim-ts-rainbow)
      ["rainbowcol1"] = { fg = c.blue, bg = nil },
      ["rainbowcol2"] = { fg = c.orange, bg = nil },
      ["rainbowcol3"] = { fg = c.green, bg = nil },
      ["rainbowcol4"] = { fg = c.red, bg = nil },
      ["rainbowcol5"] = { fg = c.purple, bg = nil },
      ["rainbowcol6"] = { fg = c.cyan, bg = nil },
      ["rainbowcol7"] = { fg = c.brown, bg = nil },

      -- Indentline Groups ( lukas-reineke/indent-blankline.nvim ). To use, you can define g:indent_blankline_char_highlight_list=['SnazzyIndent1', 'SnazzyIndent2',...]
      ["SnazzyIndent1"] = { fg = c.blue, bg = nil },
      ["SnazzyIndent2"] = { fg = c.orange, bg = nil },
      ["SnazzyIndent3"] = { fg = c.green, bg = nil },
      ["SnazzyIndent4"] = { fg = c.red, bg = nil },
      ["SnazzyIndent5"] = { fg = c.purple, bg = nil },
      ["SnazzyIndent6"] = { fg = c.cyan, bg = nil },
      ["SnazzyIndent7"] = { fg = c.brown, bg = nil },

      ["TSError"] = { fg = c.error, bg = c.none, bold = true }, -- For syntax/parser errors
      ["TSPunctDelimiter"] = { link = "Delimiter", bg = c.none }, -- For delimiters ie: `.
      ["TSPunctBracket"] = { fg = c.fg3, bg = nil }, -- For brackets and parens
      -- Group.new('TSPunctSpecial'       , c.fg     , nil) -- For special punctutation that does not fall in the catagories before
      ["TSConstant"] = { link = "Constant", bg = c.none }, -- For constants
      ["TSConstBuiltin"] = { link = "Constant", bg = c.none }, -- For constant that are built in the language: `nil` in Lua
      ["TSConstMacro"] = { link = "Constant", bg = c.none }, -- For constants that are defined by macros: `NULL` in C
      -- Group.new('TSString', g.String, c.none) -- For strings
      ["TSStringRegex"] = { fg = c.red, bg = nil }, -- For regexes
      ["TSStringEscape"] = { fg = c.red, bg = nil }, -- For escape characters within a string
      ["TSCharacter"] = { link = "Character", bg = c.none }, -- For characters
      ["TSNumber"] = { link = "Number", bg = c.none }, -- For integers
      ["TSBoolean"] = { link = "Boolean", bg = c.none }, -- For booleans
      ["TSFloat"] = { link = "Float", bg = c.none }, -- For floats
      ["TSFunction"] = { link = "Function", bg = c.none }, -- For function (calls and definitions
      ["TSFuncBuiltin"] = { link = "Function", bg = c.none }, -- For builtin functions: `table.insert` in Lua
      ["TSFuncMacro"] = { link = "Function", bg = c.none }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
      ["TSParameter"] = { fg = c.TSParameter, bg = c.none }, -- For parameters of a function.
      -- Group.new('TSParameterReference' , g.TSParameter     , nil) -- For references to parameters of a function.
      ["TSMethod"] = { link = "Function", bg = c.none }, -- For method calls and definitions.
      ["TSField"] = { fg = c.TSField, bg = c.none }, -- For fields.
      ["TSProperty"] = { fg = c.TSProperty, bg = c.none }, -- Same as `TSField`.
      -- Group.new('TSConstructor'        , c.magenta_alt       , c.none)  -- For constructor calls and definitions: `{}` in Lua, and Java constructors
      ["TSConditional"] = { link = "Conditional", bg = c.none }, -- For keywords related to conditionnals
      ["TSRepeat"] = { link = "Repeat", bg = c.none }, -- For keywords related to loops
      ["TSLabel"] = { link = "Label", bg = c.none }, -- For labels: `label:` in C and `:label:` in Lua
      ["TSOperator"] = { link = "Operator", bg = c.none }, -- For any operator: `+`, but also `->` and `*` in C
      ["TSKeyword"] = { link = "Keyword", bg = c.none }, -- For keywords that don't fall in previous categories.
      ["TSKeywordOperator"] = { fg = c.TSKeywordOperator, bg = c.none }, -- For keywords that don't fall in previous categories.

      -- Group.new('TSKeywordFunction'    , c.magenta_alt       , c.none  , opts = {}) -- For keywords used to define a fuction.
      ["TSException"] = { link = "Exception", bg = c.none }, -- For exception related keywords.
      ["TSType"] = { link = "Type", bg = c.none }, -- For types.
      ["TSTypeBuiltin"] = { link = "Type", bg = c.none }, -- For builtin types (you guessed it, right ?).
      ["TSStructure"] = { link = "Structure", bg = c.none }, -- This is left as an exercise for the reader.
      ["TSInclude"] = { link = "Include", bg = c.none }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
      -- Group.new('TSAnnotation'         , c.blue_nuanced_bg , c.none) -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
      -- Group.new('TSText'             , c.fg              , c.bg           , bold=true) -- For strings considered text in a markup language.
      -- Group.new('TSStrong'             , c.fg              , c.bg           , bold=true) -- For text to be represented with strong.
      -- Group.new('TSEmphasis'            , c.blue_alt          , c.none  , bold=true) -- For text to be represented with emphasis.
      -- Group.new('TSUnderline'            , c.blue_alt          , c.none  , bold=true) -- TSUnderline
      -- Group.new('TSTitle'              , c.cyan_nuanced    , c.none) -- Text that is part of a title.
      -- Group.new('TSLiteral'            , c.blue_alt          , c.none  , bold=true) -- Literal text.
      -- Group.new('TSURI'           , c.cyan              , c.none  , opts = {}) -- Any URI like a link or email.
      ["TSVariable"] = { fg = c.TSVariable, bg = c.none }, -- Any URI like a link or email.
      -- Group.new('TSVariableBuiltin' , g.magenta_alt_other     , nil) -- Variable names that are defined by the languages, like `this` or `self`.

      -- Mail highlighting
      ["mailQuoted1"] = { fg = c.yellow, bg = c.none },
      ["mailQuoted2"] = { fg = c.green, bg = c.none },
      ["mailQuoted3"] = { fg = c.purple, bg = c.none },
      ["mailQuoted4"] = { fg = c.cyan, bg = c.none },
      ["mailQuoted5"] = { fg = c.blue, bg = c.none },
      ["mailQuoted6"] = { fg = c.yellow, bg = c.none },
      ["mailURL"] = { fg = c.blue, bg = c.none },
      ["mailEmail"] = { fg = c.blue, bg = c.none },
    }

    return groups
  end,
}
