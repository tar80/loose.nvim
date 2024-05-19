local theme = {}

---Define highlights
---@param colors table
---@param config table
---@return table # highlights
function theme.highlights(colors, config)
  local function remove_background(group)
    group['bg'] = colors.none
  end

  local function load_syntax()
    -- Syntax highlight groups
    local syntax = {
      -- int, long, char, etc.
      Type = { fg = colors.low_olive },
      -- static, register, volatile, etc.
      StorageClass = { fg = colors.high_purple },
      -- struct, union, enum, etc.
      Structure = { fg = colors.olive },
      -- any constant
      Constant = { fg = colors.high_gray },
      -- any character constant: 'c', '\n'
      Character = { fg = colors.green },
      -- a number constant: 5
      Number = { fg = colors.orange },
      -- a boolean constant: TRUE, false
      Boolean = { fg = colors.orange },
      -- a floating point constant: 2.3e10
      Float = { fg = colors.orange },
      -- any statement
      Statement = { fg = colors.gray },
      -- case, default, etc.
      Label = { fg = colors.high_purple },
      -- sizeof", "+", "*", etc.
      Operator = { fg = colors.red },
      -- try, catch, throw
      Exception = { fg = colors.purple },
      -- generic Preprocessor
      PreProc = { fg = colors.purple },
      -- preprocessor #include
      Include = { fg = colors.high_cyan },
      -- preprocessor #define
      Define = { fg = colors.high_cyan },
      -- same as Define
      Macro = { fg = colors.high_cyan },
      -- A typedef
      Typedef = { fg = colors.low_purple },
      -- preprocessor #if, #else, #endif, etc.
      PreCondit = { fg = colors.purple },
      -- any special symbol
      Special = { fg = colors.olive },
      -- special character in a constant
      SpecialChar = { fg = colors.olive },
      -- you can use CTRL-] on this
      Tag = { fg = colors.green },
      -- character that needs attention like , or .
      Delimiter = { fg = colors.low_olive },
      -- special things inside a comment
      SpecialComment = { fg = colors.gray, style = config.styles.comments },
      -- debugging statements
      Debug = { fg = colors.red },
      -- text that stands out, HTML links
      Underlined = { fg = colors.green, style = 'underline' },
      -- left blank, hidden
      Ignore = { fg = colors.high_red, bg = colors.bg, style = 'bold' },
      -- any erroneous construct
      Error = { fg = colors.error, bg = colors.none, style = 'bold' },
      -- anything that needs extra attention; mostly the keywords ToDo FIXME and XXX
      Todo = { fg = colors.bg, bg = colors.high_olive },
      Comment = { fg = colors.low_gray, style = config.styles.comments },
      -- normal if, then, else, endif, switch, etc.
      Conditional = { fg = colors.purple, style = config.styles.keywords },
      -- normal for, do, while, etc.
      Keyword = { fg = colors.gray, style = config.styles.keywords },
      -- normal any other keyword
      Repeat = { fg = colors.purple, style = config.styles.keywords },
      -- normal function names
      Function = { fg = colors.blue, style = config.styles.functions },
      -- any variable name
      Identifier = { fg = colors.fg, style = config.styles.variables },
      -- any string
      String = { fg = colors.green, config.styles.strings },
    }

    return syntax
  end

  local function load_editor()
    -- Editor highlight groups
    local editor = {
      -- normal text and background color
      Normal = { fg = colors.fg, bg = colors.bg },
      -- normal text and background color for non-current windows
      NormalNC = { bg = colors.bg },
      -- normal text and background color for floating windows
      NormalFloat = { fg = colors.fg, bg = colors.float },
      -- floating window border
      FloatBorder = { link = 'Normal' },
      -- floating window title
      FloatTitle = { link = 'Normal' },
      -- FloatFooter = { link = 'FloatTitle' },
      -- used for the columns set with 'signcolumn'
      SignColumn = { fg = colors.gray, bg = colors.none },
      -- used for the columns set with 'colorcolumn'
      ColorColumn = { fg = colors.none, bg = colors.nc },
      -- placeholder characters substituted for concealed text (see 'conceallevel')
      Conceal = { bg = colors.bg },
      -- the character under the cursor
      Cursor = { fg = colors.fg, style = 'reverse' },
      -- the search word under the cursor
      CurSearch = { link = 'IncSearch' },
      -- like Cursor, but used when in IME mode
      CursorIM = { fg = colors.fg, style = 'reverse' },
      -- directory names (and other special names in listings)
      Directory = { fg = colors.blue, bg = colors.none },
      -- diff mode: Added line
      DiffAdd = { bg = colors.diff_add_bg },
      -- diff mode: Changed line
      DiffChange = { fg = colors.diff_change, bg = colors.diff_change_bg },
      -- diff mode: Deleted line
      DiffDelete = { bg = colors.diff_remove_bg },
      -- diff mode: Changed text within a changed line
      DiffText = { bg = colors.diff_text_bg },
      -- error messages
      ErrorMsg = { fg = colors.error },
      -- line used for closed folds
      Folded = { fg = colors.low_blue, bg = colors.none, style = 'italic' },
      -- 'foldcolumn'
      FoldColumn = { fg = colors.low_blue },
      -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
      IncSearch = { fg = colors.bg, bg = colors.high_orange },
      -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
      LineNr = { fg = colors.fg, style = 'bold' },
      LineNrAbove = { fg = colors.low_gray },
      LineNrBelow = { fg = colors.low_gray },
      -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
      CursorLineNr = { fg = colors.cyan },
      -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
      MatchParen = { fg = colors.high_orange, bg = colors.none, style = 'underline' },
      -- 'showmode' message (e.g., "-- INSERT -- ")
      ModeMsg = { fg = colors.blue },
      -- |more-prompt|
      MoreMsg = { fg = colors.blue },
      -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist
      -- in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
      -- See also |hl-EndOfBuffer|.
      NonText = { fg = colors.low_cyan },
      -- normal item |hl-Pmenu|
      Pmenu = { fg = colors.fg, bg = colors.float },
      -- selected item |hl-PmenuSel|
      PmenuSel = { bg = colors.selection },
      -- scrollbar |hl-PmenuSbar|
      PmenuSbar = { bg = colors.float },
      -- thumb of the scrollbar  |hl-PmenuThumb|
      PmenuThumb = { bg = colors.fg },
      -- |hit-enter| prompt and yes/no questions
      Question = { fg = colors.green },
      -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
      QuickFixLine = { bg = colors.float, style = 'bold' },
      -- Line numbers for quickfix lists
      qfLineNr = { fg = colors.purple },
      -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
      Search = { fg = colors.orange, bg = colors.highlight, style = 'bold' },
      -- Unprintable characters: text displayed differently from what it really is.
      -- But not 'listchars' whitespace. |hl-Whitespace|
      SpecialKey = { fg = colors.high_blue },
      -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
      SpellBad = { fg = colors.red, bg = colors.none, style = config.styles.spell, sp = colors.red },
      -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
      SpellCap = { fg = colors.olive, bg = colors.none, style = config.styles.spell, sp = colors.olive },
      -- Word that is recognized by the spellchecker as one that is used in another region.
      -- |spell| Combined with the highlighting used otherwise.
      SpellLocal = { fg = colors.cyan, bg = colors.none, style = config.styles.spell, sp = colors.cyan },
      -- Word that is recognized by the spellchecker as one that is hardly ever used.
      -- |spell| Combined with the highlighting used otherwise.
      SpellRare = { fg = colors.purple, bg = colors.none, style = config.styles.spell, sp = colors.purple },
      -- status line of current window
      StatusLine = { fg = colors.fg, bg = colors.border },
      -- status lines of not-current windows Note: if this is equal to "StatusLine"
      -- Vim will use "^^^" in the status line of the current window.
      StatusLineNC = { fg = colors.high_gray, bg = colors.border },
      -- status line of current terminal window
      StatusLineTerm = { fg = colors.fg, bg = colors.border },
      -- status lines of not-current terminal windows Note: if this is equal to "StatusLine"
      -- Vim will use "^^^" in the status line of the current window.
      StatusLineTermNC = { fg = colors.high_gray, bg = colors.border },
      -- tab pages line, where there are no labels
      TabLineFill = { fg = colors.high_gray, bg = colors.border },
      -- tab pages line, active tab page label
      TablineSel = { fg = colors.cyan, bg = colors.bg },
      Tabline = { fg = colors.high_purple, bg = colors.border },
      -- titles for output from ":set all", ":autocmd" etc.
      Title = { fg = colors.fg, bg = colors.float, style = 'bold' },
      -- Visual mode selection
      Visual = { fg = colors.none, bg = colors.selection },
      -- Visual mode selection when vim is "Not Owning the Selection".
      VisualNOS = { fg = colors.none, bg = colors.selection },
      -- warning messages
      WarningMsg = { fg = colors.warn },
      -- "nbsp", "space", "tab" and "trail" in 'listchars'
      Whitespace = { fg = colors.high_gray, bg = colors.border },
      -- current match in 'wildmenu' completion
      WildMenu = { fg = colors.olive, bg = colors.none, style = 'bold' },
      -- window bar of current window
      WinBar = { fg = colors.fg, bg = colors.bg },
      -- window bar of not-current windows
      WinBarNC = { fg = colors.high_gray, bg = colors.bg },
      -- Screen-column at the cursor, when 'cursorcolumn' is set.
      CursorColumn = { fg = colors.none, bg = colors.float },
      -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
      CursorLine = { bg = colors.nc },
      -- CursorLine = { fg = colors.none, bg = colors.nc },
      -- Normal mode message in the cmdline
      NormalMode = { fg = colors.high_gray, bg = colors.none, style = 'reverse' },
      -- Insert mode message in the cmdline
      InsertMode = { fg = colors.high_blue, bg = colors.none, style = 'reverse' },
      -- Replace mode message in the cmdline
      ReplacelMode = { fg = colors.high_orange, bg = colors.none, style = 'reverse' },
      -- Visual mode message in the cmdline
      VisualMode = { fg = colors.high_purple, bg = colors.none, style = 'reverse' },
      -- Command mode message in the cmdline
      CommandMode = { fg = colors.high_olive, bg = colors.none, style = 'reverse' },
      Warnings = { link = 'WarningMsg' },
      healthError = { fg = colors.error },
      healthSuccess = { fg = colors.green },
      healthWarning = { link = 'WarningMsg' },
      -- the column separating vertically split windows
      VertSplit = { fg = colors.bg },
      EndOfBuffer = { fg = colors.gray },
      -- diff
      diffAdded = { fg = colors.green },
      diffRemoved = { fg = colors.red },
      diffChanged = { fg = colors.green },
      diffOldFile = { link = 'diffDelete' },
      diffNewFile = { link = 'diffAdd' },
      diffFile = { link = 'comment' },
      diffLine = { fg = colors.purple },
      diffIndexLine = { fg = colors.orange },
      -- terminal
      TermCursor = { fg = colors.high_purple, style = 'underline' },
      TermCursorNC = { fg = colors.low_purple, style = 'reverse' },
    }

    -- Options:
    if config.fade_tr then
      config.fade_nc = true
    end

    -- Set non-current background
    if config.fade_nc then
      editor.NormalNC['bg'] = colors.nc
    end

    -- Set transparent background
    if config.disable.background then
      remove_background(editor.Normal)
      remove_background(editor.NormalNC)
      remove_background(editor.SignColumn)
    end

    -- Set transparent cursorline
    if config.disable.cursorline then
      remove_background(editor.CursorLine)
    end

    -- Set transparent eob lines
    if config.disable.eob_lines then
      editor.EndOfBuffer['fg'] = colors.bg
    end

    -- Add window split borders
    if config.borders then
      editor.VertSplit['fg'] = colors.border
    end

    return editor
  end

  local function load_treesitter()
    local ex = {}

    if config.plugins.treesitter and vim.fn.has('nvim-0.10') then
      -- TreeSitter highlight groups
      ex = {
        -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
        ['@attribute'] = { fg = colors.red },
        -- Boolean literals: `True` and `False` in Python.
        ['@boolean'] = { link = 'Boolean' },
        -- Character literals: `'a'` in C.
        ['@character'] = { link = 'Character' },
        ['@character.special'] = { link = 'SpecialChar' },
        -- Line comments and block comments.
        ['@comment'] = { link = 'Comment' },
        -- ['@comment.error'] = { link = '@error' },
        -- ['@comment.warning'] = { link = '@warning'},
        ['@comment.todo'] = { link = 'Todo' },
        ['@comment.note'] = { fg = colors.blue },
        -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
        ['@conditional'] = { link = 'Conditional' },
        -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
        ['@constant'] = { link = 'Constant' },
        -- Built-in constant values: `nil` in Lua.
        ['@constant.builtin'] = { fg = colors.orange },
        -- Constants defined by macros: `NULL` in C.
        ['@constant.macro'] = { fg = colors.orange },
        -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
        ['@constructor'] = { fg = colors.olive },
        ['@define'] = { link = 'Define' },
        -- Added text (for diff files)
        -- ['@diff.plus'] = { fg = 'Added', bg = colors.diff_add_bg },
        -- Deleted text (for diff files)
        -- ['@diff.minus'] = { bg = colors.diff_remove_bg },
        -- Changed text (for diff files)
        -- ['@diff.delta'] = { bg = colors.diff_change_bg },
        -- Syntax/parser errors. This might highlight large sections of code while the user is typing
        -- still incomplete code, use a sensible highlight.
        ['@error'] = { link = 'Error' },
        -- Exception related keywords: `try`, `except`, `finally` in Python.
        ['@exception'] = { link = 'Exception' },
        -- Object and struct fields.
        ['@field'] = { fg = colors.gray },
        -- Floating-point number literals.
        ['@float'] = { link = 'Float' },
        -- Function calls and definitions.
        ['@function'] = { link = 'Function' },
        -- Built-in functions: `print` in Lua.
        ['@function.builtin'] = { link = 'Function' },
        ['@function.call'] = { link = 'Function' },
        -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
        ['@function.macro'] = { link = 'Function' },
        -- Method calls and definitions.
        ['@function.method'] = { link = 'Function' },
        -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
        ['@include'] = { fg = colors.high_cyan },
        -- Keywords that don't fit into other categories.
        ['@keyword'] = { link = 'Keyword' },
        -- Keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
        ['@keyword.coroutine'] = { fg = colors.bule, style = 'bold' },
        ['@keyword.conditional'] = { link = 'Conditional' },
        -- KeyworTernary operator. (e.g. `?`, `:`)
        ['@keyword.conditional.ternary'] = { link = '@keyword.operator' },
        -- Keywords that define a function (e.g. `func` in Go, `def` in Python).
        ['@keyword.function'] = { fg = colors.cyan, style = config.styles.keywords },
        -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
        ['@keyword.operator'] = { fg = colors.red, style = config.styles.keywords },
        -- File or module import keywords: `import` in TypeScript.
        ['@keyword.import'] = { fg = colors.cyan, style = config.styles.keywords },
        -- Keywords defining composite types (e.g. `struct`, `enum`)
        ['@keyword.type'] = { fg = colors.olive },
        -- Keywords definining type modifiers (e.g. `const`, `static`, `public`)
        ['@keyword.modifier'] = { fg = colors.low_purple },
        -- Keywords related to loops (e.g. `for`, `while`)
        ['@keyword.repeat'] = { link = 'Repeat' },
        -- Keywords like `return` and `yield`.
        ['@keyword.return'] = { fg = colors.cyan, style = config.styles.keywords },
        -- GOTO labels: `label:` in C, and `::label::` in Lua.
        ['@label'] = { link = 'Label' },
        ['@Macro'] = { link = 'Macro' },
        -- Non-structured text. Like text in a markup language.
        ['@markup'] = { fg = colors.fg },
        -- Text to be represented in bold.
        -- ['@markup.strong'] = { fg = colors.purple, style = 'bold' },
        -- Text to be represented with emphasis.
        -- ['@markup.italic'] = { fg = colors.yellow, style = 'italic' },
        -- Text to be represented with an underline.
        -- ['@markup.underline'] = { style = 'underline' },
        -- Text that is part of a title.
        -- ['@markup.heading'] = {link = 'Title'},
        -- Literal or verbatim text.
        ['@markup.raw'] = { fg = colors.fg },
        -- ['@markup.raw.block'] = { bg = colors.float },
        -- URIs like hyperlinks or email addresses.
        ['@markup.link.url'] = { link = '@string.special.url' },
        -- Math environments like LaTeX's `$ ... $`
        ['@markup.math'] = { fg = colors.fg },
        -- Footnotes, text references, citations, etc.
        ['@markup.link'] = { fg = colors.purple },
        -- Text environments of markup languages.
        ['@markup.environment'] = { link = '@text.environment' },
        -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
        ['@markup.environment.name'] = { link = '@text.environment.name' },
        -- Checked todo notes.
        ['@markup.list.checked'] = { fg = colors.green },
        -- Unchecked todo notes.
        ['@markup.list.unchecked'] = { link = '@note' },
        -- Method calls and definitions.
        ['@method'] = { fg = colors.blue },
        -- Modules or namespaces: `a:`, `v:` in Vim;
        ['@module'] = { fg = colors.olive },
        -- Built-in modules or namespaces.
        ['@module.builtin'] = { link = '@module' },
        -- Identifiers referring to modules and namespaces.
        ['@namespace'] = { fg = colors.olive },
        -- Numeric literals that don't fit into other categories.
        ['@number'] = { link = 'Number' },
        -- Binary or unary operators: `+`, and also `->` and `*` in C.
        ['@operator'] = { link = 'Operator' },
        -- Parameters of a function.
        ['@parameter'] = { fg = colors.high_blue },
        -- References to parameters of a function.
        ['@parameter.reference'] = { fg = colors.red },
        -- Same as `TSField`.
        ['@property'] = { fg = colors.gray },
        -- Punctuation delimiters: Periods, commas, semicolons, etc.
        ['@punctuation.delimiter'] = { fg = colors.low_olive },
        -- Brackets, braces, parentheses, etc.
        ['@punctuation.bracket'] = { fg = colors.low_olive },
        -- Special punctuation that doesn't fit into the previous categories.
        ['@punctuation.special'] = { fg = colors.olive },
        -- Keywords related to loops: `for`, `while`, etc.
        ['@repeat'] = { link = 'Repeat' },
        -- String literals.
        ['@string'] = { fg = colors.green, style = config.styles.strings },
        -- Escape characters within a string: `\n`, `\t`, etc.
        ['@string.escape'] = { fg = colors.high_green },
        -- Regular expression literals.
        ['@string.regexp'] = { fg = colors.high_green },
        ['@string.special'] = { link = 'Special' },
        ['@string.special.path'] = { fg = colors.green },
        ['@string.special.url'] = { fg = colors.blue, style = 'underline' },
        -- Identifiers referring to symbols or atoms.
        ['@symbol'] = { fg = colors.cyan },
        -- Tags like HTML tag names.
        ['@tag'] = { fg = colors.olive },
        -- HTML tag attributes.
        ['@tag.attribute'] = { fg = colors.red },
        -- Tag delimiters like `<` `>` `/`.
        ['@tag.delimiter'] = { fg = colors.low_olive },
        -- Non-structured text. Like text in a markup language.
        ['@text'] = { fg = colors.fg },
        -- Text to be represented in bold.
        ['@text.strong'] = { fg = colors.fg, style = 'bold' },
        -- Text to be represented with emphasis.
        ['@text.emphasis'] = { fg = colors.olive, style = 'italic' },
        -- Text to be represented with an underline.
        ['@text.underline'] = { style = 'underline' },
        -- Text that is part of a title.
        ['@text.title'] = { fg = colors.blue, style = 'bold' },
        -- Literal or verbatim text.
        ['@text.literal'] = { fg = colors.green },
        -- URIs like hyperlinks or email addresses.
        ['@text.uri'] = { fg = colors.blue, style = 'underline' },
        -- Math environments like LaTeX's `$ ... $`
        ['@text.math'] = { fg = colors.high_cyan },
        -- Footnotes, text references, citations, etc.
        ['@text.reference'] = { fg = colors.high_cyan },
        -- Text environments of markup languages.
        ['@text.environment'] = { fg = colors.high_red },
        -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
        ['@text.environment.name'] = { fg = colors.high_red },
        -- Text representation of an informational note.
        ['@note'] = { fg = colors.info, style = 'bold' },
        -- Text representation of a warning note.
        ['@warning'] = { fg = colors.warn, style = 'bold' },
        -- Text representation of a danger note.
        ['@danger'] = { fg = colors.error, style = 'bold' },
        -- Type (and class) definitions and annotations.
        ['@type'] = { link = 'Type' },
        -- Built-in types: `i32` in Rust.
        ['@type.builtin'] = { fg = colors.low_olive },
        -- Various variable names.
        ['@variable'] = { fg = colors.fg, style = config.styles.variables },
        -- Built-in variable names (e.g. `this`, `self`)
        ['@variable.builtin'] = { fg = colors.high_gray, style = config.styles.variables },
        -- Paramaters of a function.
        ['@variable.parameter'] = { link = '@parameter' },
        -- Object and struct fields.
        ['@variable.member'] = { fg = colors.gray, style = config.styles.variables },
      }
    else
      -- Standard filetype highlight groups
      ex = {
        htmlLink = { fg = colors.green, style = 'underline' },
        htmlArg = { fg = colors.blue },
        htmlTag = { fg = colors.blue },
        htmlEndTag = { fg = colors.blue },
        htmlTagN = { fg = colors.olive },
        htmlTagName = { fg = colors.olive },
        htmlSpecialTagName = { fg = colors.olive },
        htmlH1 = { fg = colors.cyan, style = 'bold' },
        htmlH2 = { fg = colors.red, style = 'bold' },
        htmlH3 = { fg = colors.green, style = 'bold' },
        htmlH4 = { fg = colors.olive, style = 'bold' },
        htmlH5 = { fg = colors.purple, style = 'bold' },
        cssAttributeSelector = { fg = colors.blue },
        cssSelectorOp = { fg = colors.high_blue },
        cssTagName = { fg = colors.olive },
        markdownBlockquote = { fg = colors.high_gray },
        markdownBold = { fg = colors.purple, style = 'bold' },
        markdownCode = { fg = colors.green },
        markdownCodeBlock = { fg = colors.green },
        markdownCodeDelimiter = { fg = colors.green },
        markdownH1 = { fg = colors.high_blue, style = 'bold' },
        markdownH2 = { fg = colors.blue, style = 'bold' },
        markdownH3 = { fg = colors.cyan, style = 'bold' },
        markdownH4 = { fg = colors.low_green },
        markdownH5 = { fg = colors.low_green },
        markdownH6 = { fg = colors.low_green },
        markdownH1Delimiter = { fg = colors.high_blue },
        markdownH2Delimiter = { fg = colors.blue },
        markdownH3Delimiter = { fg = colors.cyan },
        markdownH4Delimiter = { fg = colors.low_green },
        markdownH5Delimiter = { fg = colors.low_green },
        markdownH6Delimiter = { fg = colors.low_green },
        markdownId = { fg = colors.olive },
        markdownIdDeclaration = { fg = colors.purple },
        markdownIdDelimiter = { fg = colors.high_gray },
        markdownLinkDelimiter = { fg = colors.high_gray },
        markdownItalic = { fg = colors.olive, style = 'italic' },
        markdownLinkText = { fg = colors.purple },
        markdownListMarker = { fg = colors.red },
        markdownOrderedListMarker = { fg = colors.red },
        markdownRule = { fg = colors.purple },
        markdownUrl = { fg = colors.cyan, style = 'underline' },
      }
    end

    return ex
  end

  local function load_lsp()
    -- Lsp highlight groups
    local lsp = {}

    if config.plugins.lsp then
      lsp = {
        -- used for "Error" diagnostic virtual text
        LspDiagnosticsDefaultError = { fg = colors.error, style = config.styles.virtualtext },
        -- used for "Error" diagnostic signs in sign column
        LspDiagnosticsSignError = { fg = colors.error },
        -- used for "Error" diagnostic messages in the diagnostics float
        LspDiagnosticsFloatingError = { fg = colors.error },
        -- Virtual text "Error"
        LspDiagnosticsVirtualTextError = { fg = colors.low_red, bg = colors.nc, style = config.styles.virtualtext },
        -- used to underline "Error" diagnostics.
        LspDiagnosticsUnderlineError = { style = config.styles.diagnostics, sp = colors.error },
        -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsDefaultWarning = { fg = colors.warn },
        -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsSignWarning = { fg = colors.warn },
        -- used for "Warning" diagnostic messages in the diagnostics float
        LspDiagnosticsFloatingWarning = { fg = colors.warn },
        -- Virtual text "Warning"
        LspDiagnosticsVirtualTextWarning = { fg = colors.low_olive, bg = colors.nc, style = config.styles.virtualtext },
        -- used to underline "Warning" diagnostics.
        LspDiagnosticsUnderlineWarning = { style = config.styles.diagnostics, sp = colors.warn },
        -- used for "Information" diagnostic virtual text
        LspDiagnosticsDefaultInformation = { fg = colors.info, style = config.styles.virtualtext },
        -- used for "Information" diagnostic signs in sign column
        LspDiagnosticsSignInformation = { fg = colors.info },
        -- used for "Information" diagnostic messages in the diagnostics float
        LspDiagnosticsFloatingInformation = { fg = colors.info },
        -- Virtual text "Information"
        LspDiagnosticsVirtualTextInformation = {
          fg = colors.low_blue,
          bg = colors.nc,
          style = config.styles.virtualtext,
        },
        -- used to underline "Information" diagnostics.
        LspDiagnosticsUnderlineInformation = { style = config.styles.diagnostics, sp = colors.info },
        -- used for "Hint" diagnostic virtual text
        LspDiagnosticsDefaultHint = { fg = colors.hint, style = config.styles.virtualtext },
        -- used for "Hint" diagnostic signs in sign column
        LspDiagnosticsSignHint = { fg = colors.hint },
        -- used for "Hint" diagnostic messages in the diagnostics float
        LspDiagnosticsFloatingHint = { fg = colors.hint },
        -- Virtual text "Hint"
        LspDiagnosticsVirtualTextHint = { fg = colors.low_purple, bg = colors.nc, style = config.styles.virtualtext },
        -- used to underline "Hint" diagnostics.
        LspDiagnosticsUnderlineHint = { style = config.styles.diagnostics, sp = colors.hint },
        -- used for highlighting "text" references
        LspReferenceText = { style = config.styles.references },
        -- used for highlighting "read" references
        LspReferenceRead = { style = config.styles.references },
        -- used for highlighting "write" references
        LspReferenceWrite = { style = config.styles.references },
        LspSignatureActiveParameter = { fg = colors.none, bg = colors.highlight, style = 'bold' },
        LspCodeLens = { fg = colors.high_gray },
        LspInlayHint = { fg = colors.selection, style = 'italic,bold' },

        ['@lsp.type.class'] = { link = 'Type' },
        ['@lsp.type.comment'] = { fg = colors.none },
        ['@lsp.type.event'] = { link = 'WarningMsg' },
        ['@lsp.type.parameter'] = { link = '@parameter' },
        ['@lsp.type.type'] = { fg = colors.low_olive },
        ['@lsp.type.variable'] = { fg = colors.none },
        ['@lsp.mod.documentation'] = { fg = colors.low_gray, style = config.styles.keywords },

        ['@lsp.type.keyword'] = { link = '@keyword' },
        ['@lsp.type.property'] = { link = '@property' },
        ['@lsp.type.method'] = { link = '@method' },

        ['@lsp.type.namespace'] = { link = '@namespace' },
        ['@lsp.type.enum'] = { link = 'Type' },
        ['@lsp.type.interface'] = { link = 'Type' },
        ['@lsp.type.struct'] = { link = 'Type' },
        ['@lsp.type.typeParameter'] = { link = '@parameter' },
        ['@lsp.type.enumMember'] = { link = '@constant' },
        ['@lsp.type.macro'] = { link = '@constant.macro' },
        ['@lsp.type.string'] = { link = '@string' },
        ['@lsp.type.number'] = { link = '@number' },
        ['@lsp.type.regexp'] = { link = '@string.regex' },
        ['@lsp.type.operator'] = { link = '@operator' },
        ['@lsp.type.decorator'] = { link = '@function.macro' },
        ['@lsp.mod.deprecated'] = { fg = colors.high_cyan, style = 'underdouble' },
        -- ['@lsp.mod.deprecated'] = { fg = colors.high_cyan, style = 'strikethrough' },
        ['@lsp.typemod.function.defaultLibrary'] = { link = '@function.builtin' },
        ['@lsp.typemod.method.defaultLibrary'] = { link = '@function.builtin' },
        ['@lsp.typemod.variable.defaultLibrary'] = { link = '@module.builtin' },

        DiagnosticError = { link = 'LspDiagnosticsDefaultError' },
        DiagnosticWarn = { link = 'LspDiagnosticsDefaultWarning' },
        DiagnosticInfo = { link = 'LspDiagnosticsDefaultInformation' },
        DiagnosticHint = { link = 'LspDiagnosticsDefaultHint' },
        DiagnosticVirtualTextWarn = { link = 'LspDiagnosticsVirtualTextWarning' },
        DiagnosticUnderlineWarn = { link = 'LspDiagnosticsUnderlineWarning' },
        DiagnosticFloatingWarn = { link = 'LspDiagnosticsFloatingWarning' },
        DiagnosticSignWarn = { link = 'LspDiagnosticsSignWarning' },
        DiagnosticVirtualTextError = { link = 'LspDiagnosticsVirtualTextError' },
        DiagnosticUnderlineError = { link = 'LspDiagnosticsUnderlineError' },
        DiagnosticFloatingError = { link = 'LspDiagnosticsFloatingError' },
        DiagnosticSignError = { link = 'LspDiagnosticsSignError' },
        DiagnosticVirtualTextInfo = { link = 'LspDiagnosticsVirtualTextInformation' },
        DiagnosticUnderlineInfo = { link = 'LspDiagnosticsUnderlineInformation' },
        DiagnosticFloatingInfo = { link = 'LspDiagnosticsFloatingInformation' },
        DiagnosticSignInfo = { link = 'LspDiagnosticsSignInformation' },
        DiagnosticVirtualTextHint = { link = 'LspDiagnosticsVirtualTextHint' },
        DiagnosticUnderlineHint = { link = 'LspDiagnosticsUnderlineHint' },
        DiagnosticFloatingHint = { link = 'LspDiagnosticsFloatingHint' },
        DiagnosticSignHint = { link = 'LspDiagnosticsSignHint' },
      }
    end

    return lsp
  end

  local function load_plugins()
    -- Plugins highlight groups
    local p = {}

    if config.plugins.conflict_marker then
      vim.g.conflict_marker_highlow_group = ''
      p['ConflictMarkerBegin'] = { fg = colors.fg, bg = colors.high_green }
      p['ConflictMarkerOurs'] = { fg = colors.green, bg = colors.diff_change_bg }
      p['ConflictMarkerTheirs'] = { fg = colors.blue, bg = colors.diff_add_bg }
      p['ConflictMarkerEnd'] = { fg = colors.fg, bg = colors.high_blue }
      p['ConflictMarkerSeparator'] = { fg = colors.fg, bg = colors.high_red }
      p['ConflictMarkerCommonAncestors'] = { fg = colors.fg, bg = colors.high_red }
      p['ConflictMarkerCommonAncestorsHunk'] = { fg = colors.high_red, bg = colors.diff_remove_bg }
    end
    if config.plugins.fret then
      p['FretIgnore'] = { fg = colors.gray }
      p['FretCandidateFirst'] = { fg = colors.match, style = 'underline' }
      p['FretCandidateSecond'] = { fg = colors.match, style = 'underline' }
      p['FretCandidateSub'] = { fg = colors.matchsub, style = 'underdotted' }
      p['FretAlternative'] = { fg = colors.match, bg = colors.bg, style = 'reverse' }
    end
    if config.plugins.fuzzy_motion then
      p['FuzzyMotionShade'] = { fg = colors.low_gray }
      p['FuzzyMotionChar'] = { fg = colors.bg, bg = colors.match }
      p['FuzzyMotionSubChar'] = { fg = colors.match, style = 'underline' }
      p['FuzzyMotionMatch'] = { fg = colors.high_gray }
    end
    if config.plugins.cmp then
      p['CmpItemAbbr'] = { fg = colors.fg }
      p['CmpItemAbbrDeprecated'] = { fg = colors.gray, style = 'underline' }
      p['CmpItemAbbrMatch'] = { fg = colors.match, style = 'bold' }
      p['CmpItemAbbrMatchFuzzy'] = { fg = colors.match, style = 'bold' }
      p['CmpItemKind'] = { fg = colors.low_gray }
      p['CmpItemMenu'] = { fg = colors.gray }
      p['CmpItemKindClass'] = { fg = colors.low_red }
      p['CmpItemKindConstant'] = { fg = colors.low_gray }
      p['CmpItemKindConstructor'] = { fg = colors.low_olive }
      p['CmpItemKindCopilot'] = { fg = colors.gray }
      p['CmpItemKindEnum'] = { fg = colors.low_orange }
      p['CmpItemKindEnumMember'] = { fg = colors.low_orange }
      p['CmpItemKindField'] = { fg = colors.low_olive }
      p['CmpItemKindFile'] = { fg = colors.low_gray }
      p['CmpItemKindFolder'] = { fg = colors.low_cyan }
      p['CmpItemKindFunction'] = { fg = colors.low_blue }
      p['CmpItemKindInterface'] = { fg = colors.low_red }
      p['CmpItemKindKeyword'] = { fg = colors.low_purple }
      p['CmpItemKindMethod'] = { fg = colors.low_blue }
      p['CmpItemKindModule'] = { fg = colors.low_cyan }
      p['CmpItemKindProperty'] = { fg = colors.low_gray }
      p['CmpItemKindSnippet'] = { fg = colors.cyan }
      p['CmpItemKindStruct'] = { fg = colors.low_olive }
      p['CmpItemKindText'] = { fg = colors.low_gray }
      p['CmpItemKindTypeParameter'] = { fg = colors.low_cyan }
      p['CmpItemKindValue'] = { fg = colors.low_gray }
      p['CmpGhostText'] = { fg = colors.selection, style = 'italic' }
    end
    if config.plugins.matchwith then
      p['Matchwith'] = { style = 'underline' }
      p['MatchwithOut'] = { style = 'underdouble' }
      p['MatchwithSign'] = { fg = colors.hint, style = 'bold' }
    end
    if config.plugins.skkeleton_indicator then
      p['SkkeletonIndicatorEiji'] = { fg = colors.bg, bg = colors.cyan }
      p['SkkeletonIndicatorHira'] = { fg = colors.bg, bg = colors.high_green }
      p['SkkeletonIndicatorKata'] = { fg = colors.bg, bg = colors.high_olive }
      p['SkkeletonIndicatorHankata'] = { fg = colors.bg, bg = colors.orange }
      p['SkkeletonIndicatorZenkaku'] = { fg = colors.bg, bg = colors.orange }
      p['SkkeletonIndicatorAbbrev'] = { fg = colors.bg, bg = colors.high_purple }
    end
    if config.plugins.sandwich then
      p['OperatorSandwichAdd'] = { fg = colors.fg, bg = colors.highlight, style = 'bold' }
      p['OperatorSandwichChange'] = { bg = colors.highlight, style = 'bold' }
      p['OperatorSandwichDelete'] = { fg = colors.high_red, style = 'bold' }
    end
    if config.plugins.dashboard then
      p['DashboardShortCut'] = { fg = colors.cyan }
      p['DashboardHeader'] = { fg = colors.blue }
      p['DashboardCenter'] = { fg = colors.purple }
      p['DashboardFooter'] = { fg = colors.green, style = 'italic' }
    end
    if config.plugins.lazy then
      p['LazyButton'] = { fg = colors.gray, bg = colors.selection }
      p['LazyButtonActive'] = { fg = colors.bg, bg = colors.high_cyan, style = 'bold' }
      p['LazyComment'] = { fg = colors.purple }
      p['LazyCommit'] = { fg = colors.high_blue }
      p['LazyCommitIssue'] = { fg = colors.red }
      p['LazyCommitScope'] = { fg = colors.orange }
      p['LazyCommitType'] = { fg = colors.fg }
      p['LazyDimmed'] = { fg = colors.gray }
      p['LazyDir'] = { fg = colors.green }
      p['LazyH1'] = { fg = colors.high_cyan, style = 'bold' }
      p['LazyH2'] = { fg = colors.high_orange, style = 'bold' }
      p['LazyLocal'] = { fg = colors.high_green }
      p['LazyNoCond'] = { fg = colors.high_green }
      p['LazyNormal'] = { fg = colors.fg }
      p['LazyProgressDone'] = { fg = colors.high_cyan }
      p['LazyProgressTodo'] = { fg = colors.high_red }
      p['LazyProp'] = { fg = colors.fg, style = 'bold' }
      p['LazyReasonCmd'] = { fg = colors.low_olive }
      p['LazyReasonEvent'] = { fg = colors.low_purple }
      p['LazyReasonFt'] = { fg = colors.low_orange }
      p['LazyReasonImport'] = { fg = colors.low_cyan }
      p['LazyReasonKeys'] = { fg = colors.low_green }
      p['LazyReasonPlugin'] = { fg = colors.low_blue }
      p['LazyReasonRuntime'] = { fg = colors.low_cyan }
      p['LazyReasonSource'] = { fg = colors.low_cyan }
      p['LazyReasonStart'] = { fg = colors.low_red }
      p['LazySpecial'] = { fg = colors.high_cyan }
      p['LazyTaskError'] = { fg = colors.red }
      p['LazyTaskOutput'] = { fg = colors.olive }
      p['LazyUrl'] = { fg = colors.high_blue }
      p['LazyValue'] = { fg = colors.olive }
    end
    if config.plugins.lspconfig then
      p['LspInfoTitle'] = { fg = colors.high_orange }
      p['LspInfoList'] = { fg = colors.purple }
      p['LspInfoFiletype'] = { fg = colors.blue }
      p['LspInfoTip'] = { link = 'Comment' }
      p['LspInfoBorder'] = { link = 'NormalNC' }
    end
    if config.plugins.notify then
      -- p['NotifyBackground'] = { bg = '#000000' }
      p['NotifyERRORBorder'] = { fg = colors.error }
      p['NotifyWARNBorder'] = { fg = colors.warn }
      p['NotifyINFOBorder'] = { fg = colors.info }
      p['NotifyDEBUGBorder'] = { fg = colors.low_gray }
      p['NotifyTRACEBorder'] = { fg = colors.hint }
      p['NotifyERRORIcon'] = { fg = colors.error }
      p['NotifyWARNIcon'] = { fg = colors.warn }
      p['NotifyINFOIcon'] = { fg = colors.info }
      p['NotifyDEBUGIcon'] = { fg = colors.low_gray }
      p['NotifyTRACEIcon'] = { fg = colors.hint }
      p['NotifyERRORTitle'] = { fg = colors.error }
      p['NotifyWARNTitle'] = { fg = colors.warn }
      p['NotifyINFOTitle'] = { fg = colors.info }
      p['NotifyDEBUGTitle'] = { fg = colors.low_gray }
      p['NotifyTRACETitle'] = { fg = colors.hint }
    end
    if config.plugins.trouble then
      p['TroubleFile'] = { fg = colors.blue }
      p['TroubleCount'] = { fg = colors.purple }
      p['TroubleNormal'] = { fg = colors.fg }
      p['TroubleText'] = { fg = colors.green }
      p['TroubleLocation'] = { fg = colors.cyan }
      p['TroubleFoldIcon'] = { fg = colors.purple }
      p['TroubleIndent'] = { fg = colors.low_gray }
      p['TroubleTextError'] = { link = 'DiagnosticError' }
      p['TroubleTextWarning'] = { link = 'DiagnosticWarn' }
      p['TroubleTextInformation'] = { link = 'DiagnosticInformation' }
      p['TroubleTextHint'] = { link = 'DiagnosticHint' }
    end
    if config.plugins.rainbow_delimiters_high then
      p['RainbowDelimiterRed'] = { fg = colors.high_red }
      p['RainbowDelimiterYellow'] = { fg = colors.high_olive }
      p['RainbowDelimiterBlue'] = { fg = colors.high_blue }
      p['RainbowDelimiterOrange'] = { fg = colors.high_orange }
      p['RainbowDelimiterGreen'] = { fg = colors.high_green }
      p['RainbowDelimiterViolet'] = { fg = colors.high_purple }
      p['RainbowDelimiterCyan'] = { fg = colors.high_cyan }
    end
    if config.plugins.rainbow_delimiters_low then
      p['RainbowDelimiterRed'] = { fg = colors.low_red }
      p['RainbowDelimiterYellow'] = { fg = colors.low_olive }
      p['RainbowDelimiterBlue'] = { fg = colors.low_blue }
      p['RainbowDelimiterOrange'] = { fg = colors.low_orange }
      p['RainbowDelimiterGreen'] = { fg = colors.low_green }
      p['RainbowDelimiterViolet'] = { fg = colors.low_purple }
      p['RainbowDelimiterCyan'] = { fg = colors.low_cyan }
    end
    if config.plugins.neogit then
      p['NeogitBranch'] = { fg = colors.purple }
      p['NeogitRemote'] = { fg = colors.orange }
      p['NeogitHunkHeader'] = { fg = colors.fg, bg = colors.highlight }
      p['NeogitHunkHeaderHighlight'] = { fg = colors.olive, bg = colors.highlight }
      p['NeogitDiffContextHighlight'] = { bg = colors.nc }
      p['NeogitDiffDeleteHighlight'] = { fg = colors.diff_remove, bg = colors.diff_remove_bg }
      p['NeogitDiffAddHighlight'] = { fg = colors.diff_add, bg = colors.diff_add_bg }
      p['NeogitNotificationInfo'] = { fg = colors.info }
      p['NeogitNotificationWarning'] = { fg = colors.warn }
      p['NeogitNotificationError'] = { fg = colors.error }
    end
    if config.plugins.gitsigns then
      p['GitSignsAdd'] = { fg = colors.high_blue } -- diff mode: Added line |diff.txt|
      p['GitSignsChange'] = { fg = colors.high_green } -- diff mode: Changed line |diff.txt|
      -- p['GitSignsChangeDelete'] = { link = 'GitSignsChange' } -- diff mode: Changed line |diff.txt|
      p['GitSignsDelete'] = { fg = colors.high_red } -- diff mode: Deleted line |diff.txt|
      -- p['GitSignsTopdelete'] = { link = 'GitSignsDelete' }
      -- p['GitSignsUntracked'] = { link = 'GitSignsAdd' }
      -- p['GitSignsAddNr'] = { link = 'GitSignsAddNr' }
      -- p['GitSignsChangeNr'] = { link = 'GitSignsChange' }
      -- p['GitSignsDeleteNr'] = { link = 'GitSignsDelete' }
      -- p['GitSignsChangeDeleteNr'] = { link = 'GitSignsChangeNr' }
      -- p['GitSignsTopdeleteNr'] = { link = 'GitSignsDeleteNr' }
      -- p['GitSignsUntracked'] = { link = 'GitSignsAddNr' }
      p['GitSignsAddLn'] = { link = 'DiffAdd' }
      p['GitSignsChangeLn'] = { link = 'DiffChange' }
      -- p['GitSignsChangeDeleteLn'] = { link = 'GitSignsChangeLn' }
      p['GitSignsUntrackedLn'] = { link = 'DiffText' }
      p['GitSignsAddPreview'] = { fg = colors.cyan }
      p['GitSignsDeletePreview'] = { fg = colors.red }
      p['GitSignsCurrentLineBlame'] = { fg = colors.low_purple, bg = colors.nc, style = config.styles.virtualtext }
      p['GitSignsAddInline'] = { bg = colors.diff_add_bg }
      p['GitSignsChangeInline'] = { bg = colors.diff_change_bg }
      p['GitSignsDeleteInline'] = { bg = colors.diff_remove_bg }
      -- p['GitSignsAddLnInline'] = { link = 'GitSignsAddInline' }
      -- p['GitSignsChangeLnInline'] = { link = 'GitSignsChangeInline' }
      -- p['GitSignsDeleteLnInline'] = { link = 'GitSignsDeleteInline' }
      p['GitSignsDeleteVirtLn'] = { link = 'DiffDelete' }
      -- p['GitSignsDeleteVirtLnInline'] = { link = 'GitSignsDeleteVirtLn' }
      -- p['GitSignsDeleteVirtLnum'] = { link = 'GitSignsDeleteVirtLn' }
    end
    local telescope = config.plugins.telescope
    if telescope then
      p['TelescopeNormal'] = { link = 'Normal' }
      p['TelescopeSelection'] = { fg = colors.fg, bg = colors.selection }
      p['TelescopeMultiIcon'] = { fg = colors.high_green }
      p['TelescopeMultiSelection'] = { bg = colors.diff_change_bg }
      p['TelescopePromptPrefix'] = { fg = colors.cyan }
      p['TelescopePromptCounter'] = { fg = colors.gray }
      p['TelescopeMatching'] = { fg = colors.match, style = 'bold' }
      if telescope == 'border_fade' then
        p['TelescopeBorder'] = { link = 'NormalNC' }
        p['TelescopeTitle'] = { link = 'NormalNC' }
      end
    end
    if config.plugins.nvimtree then
      p['NvimTreeSymlink'] = { fg = colors.cyan, style = 'bold' }
      p['NvimTreeRootFolder'] = { fg = colors.green, style = 'bold' }
      p['NvimTreeFolderName'] = { fg = colors.blue }
      p['NvimTreeFolderIcon'] = { fg = colors.high_blue }
      p['NvimTreeEmptyFolderName'] = { fg = colors.low_gray }
      p['NvimTreeOpenedFolderName'] = { fg = colors.olive, style = 'italic' }
      p['NvimTreeIndentMarker'] = { fg = colors.blue }
      p['NvimTreeGitDirty'] = { fg = colors.olive }
      p['NvimTreeGitNew'] = { fg = colors.diff_add }
      p['NvimTreeGitStaged'] = { fg = colors.purple }
      p['NvimTreeGitDeleted'] = { fg = colors.diff_remove }
      p['NvimTreeExecFile'] = { fg = colors.green, style = 'bold' }
      p['NvimTreeOpenedFile'] = { fg = colors.none }
      p['NvimTreeSpecialFile'] = { fg = colors.orange, style = 'underline' }
      p['NvimTreeImageFile'] = { fg = colors.purple, style = 'bold' }
      p['NvimTreeNormal'] = { fg = colors.fg, bg = colors.nc }
      p['NvimTreeCursorLine'] = { bg = colors.float }
      p['NvimTreeVertSplit'] = { fg = colors.nc, bg = colors.nc }
      p['LspDiagnosticsError'] = { fg = colors.error }
      p['LspDiagnosticsWarning'] = { fg = colors.warn }
      p['LspDiagnosticsInformation'] = { fg = colors.info }
      p['LspDiagnosticsHint'] = { fg = colors.hint }
    end
    if config.plugins.whichkey then
      p['WhichKey'] = { fg = colors.purple, style = 'bold' }
      p['WhichKeyGroup'] = { fg = colors.cyan }
      p['WhichKeyDesc'] = { fg = colors.blue, style = 'italic' }
      p['WhichKeySeperator'] = { fg = colors.green }
      p['WhichKeyFloat'] = { bg = colors.nc }
    end
    if config.plugins.lspsaga then
      p['SagaTitle'] = { fg = colors.info }
      p['SagaBorder'] = { fg = colors.border, bg = colors.nc }
      p['SagaNormal'] = { fg = colors.fg, bg = colors.bg }
      p['SagaToggle'] = { fg = colors.high_purple }
      p['SagaBeacon'] = { bg = colors.high_red }
      p['SagaVirtLine'] = { fg = colors.low_purple }
      p['SagaSpinnerTitle'] = { fg = colors.match, bg = colors.nc }
      p['SagaSpinner'] = { fg = colors.hint, bg = colors.nc }
      p['SagaText'] = { fg = colors.fg }
      p['SagaSelect'] = { fg = colors.match }
      p['SagaSearch'] = { fg = colors.bg, bg = colors.high_orange }
      p['SagaFinderFname'] = { fg = colors.high_cyan }
      p['SagaDetail'] = { fg = colors.warn }
      p['SagaInCurrent'] = { fg = colors.low_purple }
      p['SageCount'] = { fg = colors.orange }
      p['SagaSep'] = { fg = colors.low_olive }
      p['ActionFix'] = { fg = colors.green }
      p['ActionPreviewNormal'] = { link = 'SagaNormal' }
      p['ActionPreviewBorder'] = { link = 'SagaBorder' }
      p['ActionPreviewTitle'] = { link = 'SagaTitle' }
      p['CodeActionText'] = { link = 'SagaText' }
      p['CodeActionNumber'] = { fg = colors.high_purple }
      p['HoverNormal'] = { link = 'SagaNormal' }
      p['HoverBorder'] = { fg = colors.border, bg = colors.bg }
      p['RenameBorder'] = { link = 'sagaBorder' }
      p['RenameNormal'] = { link = 'SagaNormal' }
      p['RenameMatch'] = { link = 'SagaSearch' }
      p['DiagnosticBorder'] = { link = 'SagaBorder' }
      p['DiagnosticNormal'] = { link = 'SagaNormal' }
      p['DiagnosticText'] = { link = 'SagaText' }
      p['DiagnosticShowNormal'] = { link = 'SagaNormal' }
      p['DiagnosticShowBorder'] = { link = 'sagaBorder' }
      p['SagaLightBulb'] = { fg = colors.high_olive }
      p['TerminalBorder'] = { link = 'SagaBorder' }
      p['TerminalNormal'] = {}
      p['SagaImpIcon'] = { fg = colors.warn }
      p['SagaWinbarSep'] = { fg = colors.purple }
      p['SagaWinbarFileName'] = { fg = colors.green }
      p['SagaWinbarFolderName'] = { fg = colors.blue }
      p['SagaWinbarFolder'] = { fg = colors.cyan }
    end
    if config.plugins.bufferline then
      p['BufferLineIndicatorSelected'] = { fg = colors.olive }
      p['BufferLineFill'] = { bg = colors.bg }
    end
    if config.plugins.treesitter_context then
      p['TreesitterContext'] = { fg = colors.none, bg = colors.nc }
    end
    if config.plugins.barbar then
      p['BufferCurrent'] = { fg = colors.fg, bg = colors.bg }
      p['BufferCurrentIndex'] = { fg = colors.fg, bg = colors.bg }
      p['BufferCurrentMod'] = { fg = colors.olive, bg = colors.bg, style = 'bold' }
      p['BufferCurrentSign'] = { fg = colors.cyan, bg = colors.bg }
      p['BufferCurrentTarget'] = { fg = colors.red, bg = colors.bg, style = 'bold' }
      p['BufferVisible'] = { fg = colors.fg, bg = colors.bg }
      p['BufferVisibleIndex'] = { fg = colors.fg, bg = colors.bg }
      p['BufferVisibleMod'] = { fg = colors.olive, bg = colors.bg, style = 'bold' }
      p['BufferVisibleSign'] = { fg = colors.low_gray, bg = colors.bg }
      p['BufferVisibleTarget'] = { fg = colors.red, bg = colors.bg, style = 'bold' }
      p['BufferInactive'] = { fg = colors.low_gray, bg = colors.nc }
      p['BufferInactiveIndex'] = { fg = colors.low_gray, bg = colors.nc }
      p['BufferInactiveMod'] = { fg = colors.olive, bg = colors.nc }
      p['BufferInactiveSign'] = { fg = colors.low_gray, bg = colors.nc }
      p['BufferInactiveTarget'] = { fg = colors.red, bg = colors.nc, style = 'bold' }
    end
    if config.plugins.sneak then
      p['Sneak'] = { fg = colors.bg, bg = colors.fg }
      p['SneakScope'] = { bg = colors.selection }
    end
    if config.plugins.indent_blankline then
      p['IndentBlanklineChar'] = { fg = colors.selection, style = 'nocombine' }
      p['IndentBlanklineSpaceChar'] = { fg = colors.gray, style = 'nocombine' }
      p['IndentBlanklineSpaceCharBlankline'] = { fg = colors.gray, style = 'nocombine' }
      p['IndentBlanklineContextChar'] = { fg = colors.purple, style = 'nocombine' }
      p['IndentBlanklineContextStart'] = { sp = colors.purple, style = 'underline' }
    end
    if config.plugins.dap then
      p['DapBreakpoint'] = { fg = colors.low_red }
      p['DapBreakpointCondition'] = { fg = colors.purple }
      p['DapBreakpointRejected'] = { fg = colors.low_green }
      p['DapStopped'] = { fg = colors.low_red }
    end
    if config.plugins.dap_virtual_text then
      p['NvimDapVirtualText'] =
        { fg = colors.high_purple, bg = colors.diff_remove_bg, style = config.styles.virtualtext }
      p['NvimDapVirtualTextInfo'] = { fg = colors.bg, bg = colors.red }
      p['NvimDapVirtualTextChanged'] =
        { fg = colors.blue, bg = colors.diff_remove_bg, style = config.styles.virtualtext }
      p['NvimDapVirtualTextError'] =
        { fg = colors.low_red, bg = colors.diff_remove_bg, style = config.styles.virtualtext }
    end
    if config.plugins.illuminate then
      p['illuminatedWord'] = { bg = colors.highlight }
      p['illuminatedCurWord'] = { bg = colors.highlight }
    end
    if config.plugins.hop then
      p['HopNextKey'] = { fg = colors.fg, style = 'bold' }
      p['HopNextKey1'] = { fg = colors.cyan, style = 'bold' }
      p['HopNextKey2'] = { fg = colors.purple }
      p['HopUnmatched'] = { fg = colors.low_gray }
    end
    if config.plugins.fern then
      p['FernBranchText'] = { fg = colors.blue }
    end
    if config.plugins.lightspeed then
      p['LightspeedLabel'] = { fg = colors.red, style = 'bold,underline' }
      p['LightspeedLabelOverlapped'] = { fg = colors.high_red, style = 'underline' }
      p['LightspeedLabelDistant'] = { fg = colors.cyan, style = 'bold,underline' }
      p['LightspeedLabelDistantOverlapped'] = { fg = colors.blue, style = 'underline' }
      p['LightspeedShortcut'] = { fg = '#E5E9F0', bg = colors.red, style = 'bold,underline' }
      p['LightspeedMaskedChar'] = { fg = colors.low_purple }
      p['LightspeedGreyWash'] = { fg = colors.gray }
      p['LightspeedUnlabeledMatch'] = { fg = colors.fg, style = 'bold' }
      p['LightspeedOneCharMatch'] = { fg = colors.olive, style = 'bold,reverse' }
    end
    if config.plugins.navic then
      p['NavicIconsFile'] = { bg = colors.nc, fg = colors.blue }
      p['NavicIconsModule'] = { bg = colors.nc, fg = colors.blue }
      p['NavicIconsNamespace'] = { bg = colors.nc, fg = colors.olive }
      p['NavicIconsPackage'] = { bg = colors.nc, fg = colors.orange }
      p['NavicIconsClass'] = { bg = colors.nc, fg = colors.olive }
      p['NavicIconsMethod'] = { bg = colors.nc, fg = colors.purple }
      p['NavicIconsProperty'] = { bg = colors.nc, fg = colors.blue }
      p['NavicIconsField'] = { bg = colors.nc, fg = colors.blue }
      p['NavicIconsConstructor'] = { bg = colors.nc, fg = colors.olive }
      p['NavicIconsEnum'] = { bg = colors.nc, fg = colors.olive }
      p['NavicIconsInterface'] = { bg = colors.nc, fg = colors.olive }
      p['NavicIconsFunction'] = { bg = colors.nc, fg = colors.purple }
      p['NavicIconsVariable'] = { bg = colors.nc, fg = colors.blue }
      p['NavicIconsConstant'] = { bg = colors.nc, fg = colors.orange }
      p['NavicIconsString'] = { bg = colors.nc, fg = colors.green }
      p['NavicIconsNumber'] = { bg = colors.nc, fg = colors.orange }
      p['NavicIconsBoolean'] = { bg = colors.nc, fg = colors.orange }
      p['NavicIconsArray'] = { bg = colors.nc, fg = colors.olive }
      p['NavicIconsObject'] = { bg = colors.nc, fg = colors.orange }
      p['NavicIconsKey'] = { bg = colors.nc, fg = colors.purple }
      p['NavicIconsNull'] = { bg = colors.nc, fg = colors.red }
      p['NavicIconsEnumMember'] = { bg = colors.nc, fg = colors.cyan }
      p['NavicIconsStruct'] = { bg = colors.nc, fg = colors.olive }
      p['NavicIconsEvent'] = { bg = colors.nc, fg = colors.purple }
      p['NavicIconsOperator'] = { bg = colors.nc, fg = colors.purple }
      p['NavicIconsTypeParameter'] = { bg = colors.nc, fg = colors.olive }
      p['NavicText'] = { bg = colors.nc, fg = colors.fg }
      p['NavicSeparator'] = { bg = colors.nc, fg = colors.cyan }
    end

    if config.disable.background and config.plugins.nvimtree then
      remove_background(p.NvimTreeNormal)
    end

    return p
  end

  function theme.load_terminal()
    -- dark
    vim.g.terminal_color_0 = colors.float
    vim.g.terminal_color_8 = colors.selection

    -- light
    vim.g.terminal_color_7 = colors.fg
    vim.g.terminal_color_15 = colors.high_gray

    -- colors
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_9 = colors.red

    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_10 = colors.green

    vim.g.terminal_color_3 = colors.olive
    vim.g.terminal_color_11 = colors.olive

    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_12 = colors.blue

    vim.g.terminal_color_5 = colors.purple
    vim.g.terminal_color_13 = colors.purple

    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_14 = colors.cyan

    vim.g.terminal_color_7 = colors.fg
    vim.g.terminal_color_15 = colors.fg
  end

  return vim.tbl_deep_extend('error', load_syntax(), load_editor(), load_treesitter(), load_lsp(), load_plugins())
end

return theme
