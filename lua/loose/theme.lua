local theme = {}

---Set the background color to "NONE"
---@param group {[string]: string} Color palette
local function remove_bg(group)
  group['bg'] = 'NONE'
end

---Define highlights
---@param colors table
---@param opts table
---@return table # highlights
function theme.highlights(colors, opts)
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
      SpecialComment = { fg = colors.gray, style = opts.styles.comments },
      -- debugging statements
      Debug = { fg = colors.red },
      -- text that stands out, HTML links
      Underlined = { fg = colors.green, sp = colors.green, style = 'underline' },
      -- left blank, hidden
      Ignore = { fg = colors.high_red, bg = colors.bg, style = 'bold' },
      -- any erroneous construct
      Error = { fg = colors.error, bg = colors.none, style = 'bold' },
      -- anything that needs extra attention; mostly the keywords ToDo FIXME and XXX
      Todo = { fg = colors.low_olive, style = 'bold' },
      Comment = { fg = colors.low_gray, style = opts.styles.comments },
      -- normal if, then, else, endif, switch, etc.
      Conditional = { fg = colors.purple, style = opts.styles.keywords },
      -- normal for, do, while, etc.
      Keyword = { fg = colors.gray, style = opts.styles.keywords },
      -- normal any other keyword
      Repeat = { fg = colors.purple, style = opts.styles.keywords },
      -- normal function names
      Function = { fg = colors.cyan, style = opts.styles.functions },
      -- any variable name
      Identifier = { fg = colors.fg, style = opts.styles.variables },
      -- any string
      String = { fg = colors.green, opts.styles.strings },
      Added = { fg = colors.high_cyan, opts.styles.diff },
      Removed = { fg = colors.high_red, opts.styles.diff },
      Changed = { fg = colors.high_green, opts.styles.diff },
    }

    return syntax
  end

  local function load_editor()
    -- Editor highlight groups
    local editor = {
      -- normal text and background color
      Normal = { fg = colors.fg, bg = colors.bg },
      -- normal text and background color for non-current windows
      NormalNC = { fg = colors.fg, bg = colors.bg },
      -- normal text and background color for floating windows
      NormalFloat = { fg = colors.fg, bg = colors.float },
      -- floating window border
      FloatBorder = { fg = colors.low_gray, bg = colors.bg },
      -- floating window title
      FloatTitle = { link = 'Normal' },
      -- FloatFooter = { link = 'FloatTitle' },
      -- used for the columns set with 'signcolumn'
      SignColumn = { fg = colors.gray, bg = colors.none },
      -- used for the columns set with 'colorcolumn'
      ColorColumn = { fg = colors.none, bg = colors.float },
      -- matched text of the currently inserted completion
      ComplMatchIns = { link = 'Search' },
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
      DiffAdd = { bg = colors.diff_add },
      -- diff mode: Changed line
      DiffChange = { fg = colors.diff_text, bg = colors.diff_change },
      -- diff mode: Deleted line
      DiffDelete = { bg = colors.diff_remove },
      -- diff mode: Changed text within a changed line
      DiffText = { bg = colors.diff_text_bg },
      -- TODO: for test
      DiffTextAdd = { fg = colors.bg, bg = colors.low_green },
      -- error messages
      ErrorMsg = { fg = colors.error },
      -- line used for closed folds
      Folded = { fg = colors.low_blue, bg = colors.none, style = 'italic' },
      -- 'foldcolumn'
      FoldColumn = { fg = colors.low_blue },
      -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
      IncSearch = { fg = colors.high_orange, bg = colors.bg, style = 'reverse' },
      Substitute = { fg = colors.green, bg = colors.bg, style = 'reverse' },
      -- line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
      LineNr = { fg = colors.fg },
      LineNrAbove = { fg = colors.low_gray },
      LineNrBelow = { fg = colors.low_gray },
      -- like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
      CursorLineNr = { fg = colors.cyan },
      -- CursorLineFold = { link = 'FoldColumn' },
      -- CursorLineSign = { link = 'SignColumn' },
      -- the character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
      MatchParen = { fg = colors.high_orange, bg = colors.none, sp = colors.high_orange, style = 'underline' },
      -- 'showmode' message (e.g., "-- INSERT -- ")
      ModeMsg = { fg = colors.blue },
      -- |more-prompt|
      MoreMsg = { fg = colors.blue },
      -- -- area for messages and command-line
      -- MsgArea = { link = 'Normal' },
      -- -- separator for scrolled messages msgsep
      -- MsgSeparator = { link = 'StatusLine' },
      -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist
      -- in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
      -- see also |hl-EndOfBuffer|.
      NonText = { fg = colors.low_cyan },
      -- normal item |hl-Pmenu|
      Pmenu = { fg = colors.fg, bg = colors.float },
      -- selected item |hl-PmenuSel|
      PmenuSel = { fg = colors.match, bg = colors.bg, style = 'reverse' },
      -- selected item "extra text"
      PmenuKind = { fg = colors.high_cyan, bg = colors.float },
      PmenuKindSel = { fg = colors.match, bg = colors.high_cyan, style = 'reverse' },
      -- normal item "extra text"
      PmenuExtra = { fg = colors.comment, bg = colors.float },
      PmenuExtraSel = { fg = colors.match, bg = colors.shade_blue, style = 'reverse' },
      -- scrollbar |hl-PmenuSbar|
      PmenuSbar = { bg = colors.float },
      -- thumb of the scrollbar  |hl-PmenuThumb|
      PmenuThumb = { bg = colors.matchsub },
      -- matched text in normal item. combined with |hl-Pmenu|
      PmenuMatch = { fg = colors.match },
      -- matched text in normal item. combined with |hl-PmenuMatch| and |hl-PmenuSel|
      PmenuMatchSel = { fg = colors.matchsub, bg = colors.float, style = 'reverse,bold' },
      -- |hit-enter| prompt and yes/no questions
      Question = { fg = colors.green },
      -- current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
      QuickFixLine = { bg = colors.float, style = 'bold' },
      -- last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
      Search = { fg = colors.orange, bg = colors.highlight, style = 'bold' },
      -- tabstops in vim.snippets.
      SnippetTabstop = { link = 'Visual' },
      -- unprintable characters: text displayed differently from what it really is.
      -- but not 'listchars' whitespace. |hl-Whitespace|
      SpecialKey = { fg = colors.high_blue },
      -- word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
      SpellBad = { fg = colors.red, bg = colors.none, style = opts.styles.spell, sp = colors.red },
      -- word that should start with a capital. |spell| Combined with the highlighting used otherwise.
      SpellCap = { fg = colors.olive, bg = colors.none, style = opts.styles.spell, sp = colors.olive },
      -- word that is recognized by the spellchecker as one that is used in another region.
      -- |spell| Combined with the highlighting used otherwise.
      SpellLocal = { fg = colors.cyan, bg = colors.none, style = opts.styles.spell, sp = colors.cyan },
      -- word that is recognized by the spellchecker as one that is hardly ever used.
      -- |spell| Combined with the highlighting used otherwise.
      SpellRare = { fg = colors.purple, bg = colors.none, style = opts.styles.spell, sp = colors.purple },
      -- status line of current window
      StatusLine = { fg = colors.fg, bg = colors.border, sp = colors.fg },
      -- status lines of not-current windows Note: if this is equal to "StatusLine"
      -- vim will use "^^^" in the status line of the current window.
      StatusLineNC = { fg = colors.high_gray, bg = colors.border, sp = colors.high_gray },
      -- status line of current terminal window
      StatusLineTerm = { fg = colors.fg, bg = colors.border },
      -- status lines of not-current terminal windows Note: if this is equal to "StatusLine"
      -- vim will use "^^^" in the status line of the current window.
      StatusLineTermNC = { fg = colors.high_gray, bg = colors.border },
      -- tab pages line, where there are no labels
      TabLineFill = { fg = colors.high_gray, bg = colors.border },
      -- tab pages line, active tab page label
      TabLineSel = { fg = colors.cyan, bg = colors.bg },
      TabLine = { fg = colors.high_purple, bg = colors.border },
      -- titles for output from ":set all", ":autocmd" etc.
      Title = { fg = colors.fg, bg = colors.float, style = 'bold' },
      -- visual mode selection
      Visual = { fg = colors.none, bg = colors.selection },
      -- visual mode selection when vim is "Not Owning the Selection".
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
      healthError = { fg = colors.error },
      healthSuccess = { fg = colors.green },
      healthWarning = { link = 'WarningMsg' },
      -- the column separating vertically split windows
      VertSplit = { fg = colors.bg },
      WinSeparator = { fg = colors.bg },
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
      TermCursor = { fg = colors.high_purple, sp = colors.high_purple },
      TermCursorNC = { fg = colors.low_purple, style = 'reverse' },
    }

    -- Options:
    if opts.fade_tr then
      opts.fade_nc = true
    end

    -- Set non-current background
    if opts.fade_nc then
      editor.NormalNC['bg'] = colors.nc
    end

    -- Set transparent background
    if opts.disable.background then
      remove_bg(editor.Normal)
      remove_bg(editor.NormalNC)
      remove_bg(editor.FloatBorder)
      remove_bg(editor.SignColumn)
    end

    -- Set transparent cursorline
    if opts.disable.cursorline then
      remove_bg(editor.CursorLine)
    end

    -- Set transparent statusline background
    if opts.disable.statusline then
      remove_bg(editor.StatusLine)
      remove_bg(editor.StatusLineNC)
      remove_bg(editor.StatusLineTerm)
      remove_bg(editor.StatusLineTermNC)
    end

    -- Set transparent tabline background
    if opts.disable.tabline then
      remove_bg(editor.TabLine)
    end

    if opts.disable.tabsel then
      remove_bg(editor.TabLineSel)
    end

    if opts.disable.tabfill then
      remove_bg(editor.TabLineFill)
    end

    -- Set transparent eob lines
    if opts.disable.eob_lines then
      editor.EndOfBuffer['fg'] = colors.bg
    end

    -- Add window split borders
    if opts.borders then
      editor.WinSeparator['fg'] = colors.border
    end

    return editor
  end

  local function load_treesitter()
    local ex = {}

    if opts.plugins.treesitter and vim.fn.has('nvim-0.10') then
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
        ['@comment.error'] = { link = '@error' },
        ['@comment.warning'] = { link = '@warning' },
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
        -- ['@diff.plus'] = { fg = 'Added', bg = colors.shade_cyan },
        -- Deleted text (for diff files)
        -- ['@diff.minus'] = { bg = colors.shade_red },
        -- Changed text (for diff files)
        -- ['@diff.delta'] = { bg = colors.shade_green },
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
        ['@keyword.function'] = { fg = colors.cyan, style = opts.styles.keywords },
        -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
        ['@keyword.operator'] = { fg = colors.red, style = opts.styles.keywords },
        -- File or module import keywords: `import` in TypeScript.
        ['@keyword.import'] = { fg = colors.cyan, style = opts.styles.keywords },
        -- Keywords defining composite types (e.g. `struct`, `enum`)
        ['@keyword.type'] = { fg = colors.olive },
        -- Keywords definining type modifiers (e.g. `const`, `static`, `public`)
        ['@keyword.modifier'] = { fg = colors.low_purple },
        -- Keywords related to loops (e.g. `for`, `while`)
        ['@keyword.repeat'] = { link = 'Repeat' },
        -- Keywords like `return` and `yield`.
        ['@keyword.return'] = { fg = colors.cyan, style = opts.styles.keywords },
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
        ['@markup.underline'] = { style = 'underline' },
        -- Text that is part of a title.
        -- ['@markup.heading'] = {link = 'Title'},
        -- Literal or verbatim text.
        ['@markup.raw'] = { fg = colors.fg, bg = colors.nc },
        ['@markup.raw.block'] = { bg = colors.none },
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
        ['@method'] = { fg = colors.cyan },
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
        ['@property'] = { fg = colors.blue },
        -- Punctuation delimiters: Periods, commas, semicolons, etc.
        ['@punctuation.delimiter'] = { fg = colors.low_olive },
        -- Brackets, braces, parentheses, etc.
        ['@punctuation.bracket'] = { fg = colors.low_olive },
        -- Special punctuation that doesn't fit into the previous categories.
        ['@punctuation.special'] = { fg = colors.olive },
        -- Keywords related to loops: `for`, `while`, etc.
        ['@repeat'] = { link = 'Repeat' },
        -- String literals.
        ['@string'] = { fg = colors.green, style = opts.styles.strings },
        -- Escape characters within a string: `\n`, `\t`, etc.
        ['@string.escape'] = { fg = colors.high_green },
        -- Regular expression literals.
        ['@string.regexp'] = { fg = colors.high_green },
        ['@string.special'] = { link = 'Special' },
        ['@string.special.path'] = { fg = colors.green },
        ['@string.special.url'] = { fg = colors.high_blue, sp = colors.high_blue, style = 'underline' },
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
        ['@text.title'] = { fg = colors.high_blue, style = 'bold' },
        -- Literal or verbatim text.
        ['@text.literal'] = { fg = colors.green },
        -- URIs like hyperlinks or email addresses.
        ['@text.uri'] = { fg = colors.high_blue, sp = colors.high_blue, style = 'underline' },
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
        ['@variable'] = { fg = colors.fg, style = opts.styles.variables },
        -- Built-in variable names (e.g. `this`, `self`)
        ['@variable.builtin'] = { fg = colors.high_cyan, style = opts.styles.variables },
        -- Paramaters of a function.
        ['@variable.parameter'] = { link = '@parameter' },
        -- Object and struct fields.
        ['@variable.member'] = { fg = colors.blue, style = opts.styles.variables },
      }
    else
      -- Standard filetype highlight groups
      ex = {
        htmlLink = { fg = colors.green, sp = colors.green, style = 'underline' },
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
        markdownLinkText = { fg = colors.cyan },
        markdownListMarker = { fg = colors.red },
        markdownOrderedListMarker = { fg = colors.red },
        markdownRule = { fg = colors.purple },
        markdownUrl = { fg = colors.cyan, sp = colors.cyan, style = 'underline' },
      }
    end

    return ex
  end

  local function load_lsp()
    -- Lsp highlight groups
    local lsp = {}
    local lsp_semantic = {}

    if opts.plugins.lsp then
      lsp = {
        -- used for highlighting "text" references
        LspReferenceText = { bg = colors.shade_gray, style = opts.styles.references },
        -- used for highlighting "read" references
        LspReferenceRead = { bg = colors.shade_gray, style = opts.styles.references },
        -- used for highlighting "write" references
        LspReferenceWrite = { bg = colors.shade_gray, style = opts.styles.references },
        LspReferenceTarget = { bg = colors.highlight },
        LspSignatureActiveParameter = { fg = colors.match, bg = colors.bg, style = 'bold,reverse' },
        LspCodeLens = { fg = colors.high_gray },
        --TODO:testing
        -- LspCodeLensSeparator = { fg = colors.purple, bg = colors.shade_purple },
        LspInlayHint = { fg = colors.border, style = 'italic,bold' },

        -- used for "Error" diagnostic virtual text
        DiagnosticError = { fg = colors.error, style = opts.styles.virtualtext },
        -- used for "Error" diagnostic signs in sign column
        DiagnosticSignError = { fg = colors.error },
        -- used for "Error" diagnostic messages in the diagnostics float
        DiagnosticFloatingError = { fg = colors.error },
        -- Virtual text "Error"
        DiagnosticVirtualTextError = {
          fg = colors.low_red,
          bg = colors.shade_gray,
          sp = colors.low_red,
          style = opts.styles.virtualtext,
        },
        -- used to underline "Error" diagnostics.
        DiagnosticUnderlineError = { style = opts.styles.diagnostics, sp = colors.error },
        -- used for "Warning" diagnostic signs in sign column
        DiagnosticWarn = { fg = colors.warn, style = opts.styles.virtualtext },
        -- used for "Warning" diagnostic signs in sign column
        DiagnosticSignWarn = { fg = colors.warn },
        -- used for "Warning" diagnostic messages in the diagnostics float
        DiagnosticFloatingWarn = { fg = colors.warn },
        -- Virtual text "Warning"
        DiagnosticVirtualTextWarn = { fg = colors.low_olive, bg = colors.shade_gray, style = opts.styles.virtualtext },
        -- used to underline "Warning" diagnostics.
        DiagnosticUnderlineWarn = { style = opts.styles.diagnostics, sp = colors.warn },
        -- used for "Information" diagnostic virtual text
        DiagnosticInfo = { fg = colors.info, style = opts.styles.virtualtext },
        -- used for "Information" diagnostic signs in sign column
        DiagnosticSignInfo = { fg = colors.info },
        -- used for "Information" diagnostic messages in the diagnostics float
        DiagnosticFloatingInfo = { fg = colors.info },
        -- Virtual text "Information"
        DiagnosticVirtualTextInfo = { fg = colors.low_blue, bg = colors.shade_gray, style = opts.styles.virtualtext },
        -- used to underline "Information" diagnostics.
        DiagnosticUnderlineInfo = { style = opts.styles.diagnostics, sp = colors.info },
        -- used for "Hint" diagnostic virtual text
        DiagnosticHint = { fg = colors.hint, style = opts.styles.virtualtext },
        -- used for "Hint" diagnostic signs in sign column
        DiagnosticSignHint = { fg = colors.hint },
        -- used for "Hint" diagnostic messages in the diagnostics float
        DiagnosticFloatingHint = { fg = colors.hint },
        -- Virtual text "Hint"
        DiagnosticVirtualTextHint = {
          fg = colors.low_purple,
          bg = colors.shade_purple,
          style = opts.styles.virtualtext,
        },
        -- used to underline "Hint" diagnostics.
        DiagnosticUnderlineHint = { style = opts.styles.diagnostics, sp = colors.hint },
        DiagnosticOk = { fg = colors.ok, style = opts.styles.virtualtext },
        DiagnosticVirtualTextOk = { fg = colors.low_green, bg = colors.shade_gray, style = opts.styles.virtualtext },
        DiagnosticUnderlineOk = { style = opts.styles.diagnostics, sp = colors.ok },
        DiagnosticFloatingOk = { fg = colors.ok },
        DiagnosticSignOk = { fg = colors.ok },
        DiagnosticDeprecated = { fg = colors.high_red, sp = colors.high_red, style = opts.styles.deprecated },
        DiagnosticUnnecessary = { link = '@comment' },
      }

      if opts.plugins.lsp_semantic then
        lsp_semantic = {
          ['@lsp.type.class'] = { link = '@module' },
          ['@lsp.type.comment'] = { fg = colors.none },
          ['@lsp.type.event'] = { link = 'WarningMsg' },
          ['@lsp.type.parameter'] = { link = '@parameter' },
          ['@lsp.type.type'] = { fg = colors.low_olive },
          ['@lsp.type.variable'] = { fg = colors.none },

          ['@lsp.type.keyword'] = { link = '@keyword' },
          ['@lsp.type.property'] = { link = '@property' },
          ['@lsp.type.function'] = { link = 'Function' },
          ['@lsp.type.method'] = { link = '@method' },
          ['@lsp.type.modifier'] = { fg = colors.low_purple },

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
          ['@lsp.mod.documentation'] = { fg = colors.low_gray, style = opts.styles.keywords },
          ['@lsp.mod.deprecated'] = { link = 'DiagnosticDeprecated' },
          ['@lsp.typemod.function.defaultLibrary'] = { link = '@function.builtin' },
          ['@lsp.typemod.method.defaultLibrary'] = { link = '@function.builtin' },
          ['@lsp.typemod.variable.defaultLibrary'] = { link = '@module.builtin' },
        }
      else
        lsp_semantic = {
          ['@lsp.type.class'] = {},
          ['@lsp.type.comment'] = {},
          ['@lsp.type.event'] = {},
          ['@lsp.type.parameter'] = {},
          ['@lsp.type.type'] = {},
          ['@lsp.type.variable'] = {},

          ['@lsp.type.keyword'] = {},
          ['@lsp.type.property'] = {},
          ['@lsp.type.function'] = {},
          ['@lsp.type.method'] = {},
          ['@lsp.type.modifier'] = {},

          ['@lsp.type.namespace'] = {},
          ['@lsp.type.enum'] = {},
          ['@lsp.type.interface'] = {},
          ['@lsp.type.struct'] = {},
          ['@lsp.type.typeParameter'] = {},
          ['@lsp.type.enumMember'] = {},
          ['@lsp.type.macro'] = {},
          ['@lsp.type.string'] = {},
          ['@lsp.type.number'] = {},
          ['@lsp.type.regexp'] = {},
          ['@lsp.type.operator'] = {},
          ['@lsp.type.decorator'] = {},
          ['@lsp.mod.documentation'] = {},
          ['@lsp.mod.deprecated'] = {},
          ['@lsp.typemod.function.defaultLibrary'] = {},
          ['@lsp.typemod.method.defaultLibrary'] = {},
          ['@lsp.typemod.variable.defaultLibrary'] = {},
        }
      end
      lsp = vim.tbl_deep_extend('error', lsp, lsp_semantic)
    end

    return lsp
  end

  local function load_plugins()
    -- Plugins highlight groups
    local p = {}

    if opts.nvim_treesitter then
      -- p['TSModuleInfoHeader'] = { fg = colors.high_olive }
      -- p['TSModuleInfoNamespace'] = { fg = colors.high_gray }
      -- p['TSModuleInfoParser'] = { fg = colors.fg }
      p['TSModuleInfoGood'] = { fg = colors.high_green }
      p['TSModuleInfoBad'] = { fg = colors.high_red }
    end
    if opts.plugins.mini_diff then
      p['MiniDiffSignAdd'] = { fg = colors.high_blue }
      p['MiniDiffSignChange'] = { fg = colors.high_green }
      p['MiniDiffSignDelete'] = { fg = colors.high_red }
      p['MiniDiffOverAdd'] = { bg = colors.shade_blue }
      p['MiniDiffOverChange'] = { bg = colors.diff_text_bg }
      p['MiniDiffOverContext'] = { fg = colors.low_gray, bg = colors.shade_gray }
      p['MiniDiffOverDelete'] = { fg = colors.red, bg = colors.shade_red }
    end
    if opts.plugins.mini_icons then
      p['MiniIconsAzure'] = { fg = colors.blue }
      p['MiniIconsBlue'] = { fg = colors.high_blue }
      p['MiniIconsCyan'] = { fg = colors.cyan }
      p['MiniIconsGreen'] = { fg = colors.green }
      p['MiniIconsGray'] = { fg = colors.gray }
      p['MiniIconsOrange'] = { fg = colors.orange }
      p['MiniIconsPurple'] = { fg = colors.purple }
      p['MiniIconsRed'] = { fg = colors.red }
      p['MiniIconsYellow'] = { fg = colors.olive }
    end
    if opts.plugins.conflict_marker then
      vim.g.conflict_marker_highlow_group = ''
      p['ConflictMarkerBegin'] = { fg = colors.fg, bg = colors.high_green }
      p['ConflictMarkerOurs'] = { fg = colors.green, bg = colors.shade_green }
      p['ConflictMarkerTheirs'] = { fg = colors.blue, bg = colors.shade_cyan }
      p['ConflictMarkerEnd'] = { fg = colors.fg, bg = colors.high_blue }
      p['ConflictMarkerSeparator'] = { fg = colors.fg, bg = colors.high_red }
      p['ConflictMarkerCommonAncestors'] = { fg = colors.fg, bg = colors.high_red }
      p['ConflictMarkerCommonAncestorsHunk'] = { fg = colors.high_red, bg = colors.shade_red }
    end
    if opts.plugins.fret then
      p['FretIgnore'] = { fg = colors.gray }
      p['FretCandidateFirst'] = { fg = colors.match, sp = colors.match, style = 'bold,underline' }
      p['FretCandidateSecond'] = { fg = colors.match, sp = colors.match, style = 'bold,underline' }
      p['FretCandidateSub'] = { fg = colors.matchsub, sp = colors.matchsub, style = 'underdotted' }
      p['FretAlternative'] = { fg = colors.match, bg = colors.bg, style = 'bold,reverse' }
    end
    if opts.plugins.fuzzy_motion then
      p['FuzzyMotionShade'] = { fg = colors.low_gray }
      p['FuzzyMotionChar'] = { fg = colors.bg, bg = colors.match, style = 'bold' }
      p['FuzzyMotionSubChar'] = { fg = colors.match, sp = colors.match, style = 'bold,underline' }
      p['FuzzyMotionMatch'] = { fg = colors.matchsub, sp = colors.matchsub, style = 'underline' }
    end
    if opts.plugins.flash then
      p['FlashBackdrop'] = { fg = colors.low_gray }
      p['FlashLabel'] = { fg = colors.bg, bg = colors.match, style = 'bold' }
      p['FlashCurrent'] = { fg = colors.high_red, sp = colors.bg, style = 'reverse' }
      p['FlashMatch'] = { fg = colors.matchsub, sp = colors.matchsub, style = 'underline' }
      p['FlashPrompt'] = { fg = colors.match }
      p['FlashPromptIcon'] = { fg = colors.matchsub }
      -- p['FlashCursor'] = {}
    end
    if opts.plugins.cmp then
      p['CmpItemAbbr'] = { fg = colors.fg }
      p['CmpItemAbbrDeprecated'] = { fg = colors.red, sp = colors.red, style = opts.styles.deprecated }
      p['CmpItemAbbrMatch'] = { fg = colors.match, style = 'bold' }
      p['CmpItemAbbrMatchFuzzy'] = { fg = colors.match, style = 'bold' }
      p['CmpItemKind'] = { fg = colors.low_gray }
      p['CmpItemMenu'] = { fg = colors.gray }
      p['CmpItemKindClass'] = { fg = colors.olive }
      p['CmpItemKindConstant'] = { fg = colors.low_gray }
      p['CmpItemKindConstructor'] = { fg = colors.low_olive }
      p['CmpItemKindCopilot'] = { fg = colors.low_red }
      p['CmpItemKindEnum'] = { fg = colors.low_orange }
      p['CmpItemKindEnumMember'] = { fg = colors.low_orange }
      p['CmpItemKindField'] = { fg = colors.low_olive }
      p['CmpItemKindFile'] = { fg = colors.low_gray }
      p['CmpItemKindFolder'] = { fg = colors.low_cyan }
      p['CmpItemKindFunction'] = { fg = colors.low_blue }
      p['CmpItemKindInterface'] = { fg = colors.low_olive }
      p['CmpItemKindKeyword'] = { fg = colors.low_purple }
      p['CmpItemKindMethod'] = { fg = colors.low_blue }
      p['CmpItemKindModule'] = { fg = colors.low_cyan }
      p['CmpItemKindProperty'] = { fg = colors.low_olive }
      p['CmpItemKindSnippet'] = { fg = colors.green }
      p['CmpItemKindStruct'] = { fg = colors.low_olive }
      p['CmpItemKindText'] = { fg = colors.low_text }
      p['CmpItemKindTypeParameter'] = { fg = colors.low_cyan }
      p['CmpItemKindValue'] = { fg = colors.low_purple }
      p['CmpItemKindTabNine'] = { fg = colors.low_red }
      p['CmpGhostText'] = { fg = colors.selection, style = 'italic' }
    end
    if opts.plugins.matchwith then
      p['Matchwith'] = { sp = colors.high_cyan, style = 'underline' }
      p['MatchwithOut'] = { sp = colors.high_cyan, style = 'underdouble' }
      p['MatchwithNext'] = { sp = colors.low_cyan, style = 'underline' }
      p['MatchwithNextOut'] = { sp = colors.low_cyan, style = 'underdouble' }
      p['MatchwithParent'] = { fg = colors.high_cyan, bg = colors.shade_cyan, style = 'bold' }
      p['MatchwithParentOut'] = { fg = colors.high_red, bg = colors.shade_red, style = 'bold' }
      p['MatchwithSign'] = { fg = colors.hint, style = 'bold' }
    end
    if opts.plugins.rereope then
      p['RereopeHintBg'] = { fg = colors.shade_olive, bg = colors.olive }
      p['RereopeHintBorder'] = { fg = colors.shade_olive, bg = colors.olive }
      p['RereopeVisualFlash'] = { bg = colors.shade_olive }
    end
    if opts.plugins.skkeleton_indicator then
      p['SkkeletonIndicatorEiji'] = { fg = colors.bg, bg = colors.cyan }
      p['SkkeletonIndicatorHira'] = { fg = colors.bg, bg = colors.high_green }
      p['SkkeletonIndicatorKata'] = { fg = colors.bg, bg = colors.high_olive }
      p['SkkeletonIndicatorHankata'] = { fg = colors.bg, bg = colors.orange }
      p['SkkeletonIndicatorZenkaku'] = { fg = colors.bg, bg = colors.orange }
      p['SkkeletonIndicatorAbbrev'] = { fg = colors.bg, bg = colors.high_purple }
    end
    if opts.plugins.sandwich then
      p['OperatorSandwichAdd'] = { fg = colors.fg, bg = colors.shade_cyan, style = 'bold' }
      p['OperatorSandwichChange'] = { bg = colors.shade_green, style = 'bold' }
      p['OperatorSandwichDelete'] = { fg = colors.high_red, bg = colors.shade_red, style = 'bold' }
    end
    if opts.plugins.staba then
      p['StabaInsertMode'] = { fg = colors.high_green, bg = colors.shade_green, style = 'bold' }
      p['StabaVisualMode'] = { fg = colors.high_purple, bg = colors.shade_gray, style = 'bold' }
      p['StabaVisualBlockMode'] = { fg = colors.shade_gray, bg = colors.high_purple, style = 'bold' }
      p['StabaSelectMode'] = { fg = colors.bg, bg = colors.high_red, style = 'bold' }
      p['StabaReplaceMode'] = { fg = colors.high_red, bg = colors.shade_red, style = 'bold' }
      p['StabaCmdlineMode'] = { fg = colors.low_gray }
      p['StabaNC'] = { fg = colors.fg, bg = colors.nc }
      p['StabaStatus'] = { fg = colors.fg, sp = colors.border, style = 'underline' }
      p['StabaStatusNC'] = { fg = colors.low_gray, bg = colors.nc, sp = colors.border, style = 'underline,italic' }
      p['StabaStatusReverse'] = { fg = colors.bg, bg = colors.fg, sp = colors.fg }
      p['StabaTabFillReverse'] = { fg = colors.border, bg = colors.high_gray, sp = colors.high_gray }
      p['StabaTabs'] = { fg = colors.bg, bg = colors.high_purple, sp = colors.high_purple }
      p['StabaTabsReverse'] = { fg = colors.high_purple }
      p['StabaBuffers'] = { fg = colors.bg, bg = colors.gray, sp = colors.gray }
      p['StabaBuffersReverse'] = { fg = colors.gray }
      p['StabaSpecial'] = { fg = colors.high_olive, sp = colors.border }
      p['StabaReadonly'] = { fg = colors.low_gray, sp = colors.border }
      p['StabaModified'] = { fg = colors.high_cyan, sp = colors.border }
      p['StabaSignMarks'] = { fg = colors.green, bg = colors.shade_green, sp = colors.low_green, style = 'bold' }
    end
    if opts.plugins.render_markdown then
      p['RenderMarkdownCode'] = { bg = colors.float }
      -- p['RenderMarkdownCodeInline'] = { link = 'RenderMarkdownCode' }
      p['RenderMarkdownH1Bg'] = { fg = colors.bg, bg = colors.orange, style = 'bold' }
      p['RenderMarkdownH2Bg'] = { fg = colors.bg, bg = colors.purple, style = 'bold' }
      p['RenderMarkdownH3Bg'] = { fg = colors.bg, bg = colors.olive, style = 'bold' }
      p['RenderMarkdownH4Bg'] = { fg = colors.bg, bg = colors.green, style = 'bold' }
      p['RenderMarkdownH5Bg'] = { fg = colors.bg, bg = colors.cyan, style = 'bold' }
      p['RenderMarkdownH6Bg'] = { fg = colors.bg, bg = colors.blue, style = 'bold' }
      p['RenderMarkdownLink'] = { fg = colors.cyan }
      p['RenderMarkdownTodo'] = { link = 'Todo' }
      p['RenderMarkdownDash'] = { fg = colors.shade_gray }
      p['RenderMarkdownTableHead'] = { fg = colors.low_gray }
      p['RenderMarkdownTableRow'] = { fg = colors.low_gray }
      p['RenderMarkdownTableFill'] = { fg = colors.low_gray }
      -- p['RenderMarkdown'] = { link = '' }
    end
    if opts.plugins.dashboard then
      p['DashboardShortCut'] = { fg = colors.cyan }
      p['DashboardHeader'] = { fg = colors.blue }
      p['DashboardCenter'] = { fg = colors.purple }
      p['DashboardFooter'] = { fg = colors.green, style = 'italic' }
    end
    if opts.plugins.lazy then
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
    ---@deprecated
    if opts.plugins.lspconfig then
      p['LspInfoTitle'] = { fg = colors.high_orange }
      p['LspInfoList'] = { fg = colors.purple }
      p['LspInfoFiletype'] = { fg = colors.blue }
      p['LspInfoTip'] = { link = 'Comment' }
      p['LspInfoBorder'] = { link = 'NormalNC' }
    end
    if opts.plugins.notify then
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
    if opts.plugins.trouble then
      -- p['TroubleFile'] = { fg = colors.blue }
      -- p['TroubleCount'] = { fg = colors.purple }
      -- p['TroubleNormal'] = { fg = colors.fg }
      -- p['TroubleText'] = { fg = colors.green }
      -- p['TroubleLocation'] = { fg = colors.cyan }
      -- p['TroubleFoldIcon'] = { fg = colors.purple }
      -- p['TroubleIndent'] = { fg = colors.low_gray }
      -- p['TroubleTextError'] = { link = 'DiagnosticError' }
      -- p['TroubleTextWarning'] = { link = 'DiagnosticWarn' }
      -- p['TroubleTextInformation'] = { link = 'DiagnosticInformation' }
      -- p['TroubleTextHint'] = { link = 'DiagnosticHint' }
      p['TroubleNormal'] = { fg = colors.fg }
      p['TroubleNormalNC'] = { link = 'TroubleNormal' }
      p['TroublePos'] = { link = 'Comment' }
      p['TroublePreview'] = { link = 'IncSearch' }
      p['TroubleSource'] = { link = 'Comment' }
      p['TroubleText'] = { fg = colors.green }
      p['TroubleCount'] = { fg = colors.purple }
      p['TroubleDirectory'] = { link = 'Directory' }
      p['TroubleFileName'] = { link = 'Directory' }
      p['TroubleIconArray'] = { link = '@punctuation.bracket' }
      p['TroubleIconBoolean'] = { link = '@boolean' }
      p['TroubleIconClass'] = { link = '@type' }
      p['TroubleIconConstant'] = { link = '@constant' }
      p['TroubleIconConstructor'] = { link = '@constructor' }
      p['TroubleIconDirectory'] = { link = 'Special' }
      p['TroubleIconEnum'] = { link = '@lsp.type.enum' }
      p['TroubleIconEnumMember'] = { link = '@lsp.type.enumMember' }
      p['TroubleIconEvent'] = { link = 'Special' }
      p['TroubleIconField'] = { link = '@variable.member' }
      p['TroubleIconFile'] = { link = 'TroubleNormal' }
      p['TroubleIconFunction'] = { link = '@function' }
      p['TroubleIconInterface'] = { link = '@lsp.type.interface' }
      p['TroubleIconKey'] = { link = '@lsp.type.keyword' }
      p['TroubleIconMethod'] = { link = '@function.method' }
      p['TroubleIconModule'] = { link = '@module' }
      p['TroubleIconNamespace'] = { link = '@module' }
      p['TroubleIconNull'] = { link = '@constant.builtin' }
      p['TroubleIconNumber'] = { link = '@number' }
      p['TroubleIconObject'] = { link = '@constant' }
      p['TroubleIconOperator'] = { link = '@operator' }
      p['TroubleIconPackage'] = { link = '@module' }
      p['TroubleIconProperty'] = { link = '@property' }
      p['TroubleIconString'] = { link = '@string' }
      p['TroubleIconStruct'] = { link = '@lsp.type.struct' }
      p['TroubleIconTypeParameter'] = { link = '@lsp.type.typeParameter' }
      p['TroubleIconVariable'] = { link = '@variable' }
      p['TroubleIndent'] = { fg = colors.low_gray }
      p['TroubleIndentFoldClosed'] = { link = 'CursorLineNr' }
      p['TroubleIndentFoldOpen'] = { link = 'TroubleIndent' }
      p['TroubleIndentLast'] = { link = 'TroubleIndent' }
      p['TroubleIndentMiddle'] = { link = 'TroubleIndent' }
      p['TroubleIndentTop'] = { link = 'TroubleIndent' }
      p['TroubleIndentWs'] = { link = 'TroubleIndent' }
    end
    if opts.plugins.rainbow_delimiters_high then
      p['RainbowDelimiterRed'] = { fg = colors.high_red }
      p['RainbowDelimiterYellow'] = { fg = colors.high_olive }
      p['RainbowDelimiterBlue'] = { fg = colors.high_blue }
      p['RainbowDelimiterOrange'] = { fg = colors.high_orange }
      p['RainbowDelimiterGreen'] = { fg = colors.high_green }
      p['RainbowDelimiterViolet'] = { fg = colors.high_purple }
      p['RainbowDelimiterCyan'] = { fg = colors.high_cyan }
    end
    if opts.plugins.rainbow_delimiters_low then
      p['RainbowDelimiterRed'] = { fg = colors.low_red }
      p['RainbowDelimiterYellow'] = { fg = colors.low_olive }
      p['RainbowDelimiterBlue'] = { fg = colors.low_blue }
      p['RainbowDelimiterOrange'] = { fg = colors.low_orange }
      p['RainbowDelimiterGreen'] = { fg = colors.low_green }
      p['RainbowDelimiterViolet'] = { fg = colors.low_purple }
      p['RainbowDelimiterCyan'] = { fg = colors.low_cyan }
    end
    if opts.plugins.neogit then
      p['NeogitBranch'] = { fg = colors.purple }
      p['NeogitRemote'] = { fg = colors.orange }
      p['NeogitHunkHeader'] = { fg = colors.fg, bg = colors.highlight }
      p['NeogitHunkHeaderHighlight'] = { fg = colors.olive, bg = colors.highlight }
      p['NeogitDiffContextHighlight'] = { bg = colors.shade_gray }
      p['NeogitDiffDeleteHighlight'] = { fg = colors.diff_remove, bg = colors.shade_red }
      p['NeogitDiffAddHighlight'] = { fg = colors.diff_add, bg = colors.shade_cyan }
      p['NeogitNotificationInfo'] = { fg = colors.info }
      p['NeogitNotificationWarning'] = { fg = colors.warn }
      p['NeogitNotificationError'] = { fg = colors.error }
    end
    if opts.plugins.gitsigns then
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
      p['GitSignsAddCul'] = { fg = colors.bg, bg = colors.high_blue }
      p['GitSignsChangeCul'] = { fg = colors.bg, bg = colors.high_green }
      p['GitSignsDeleteCul'] = { fg = colors.bg, bg = colors.high_red }
      p['GitSignsAddPreview'] = { fg = colors.cyan }
      p['GitSignsDeletePreview'] = { fg = colors.red }
      p['GitSignsCurrentLineBlame'] =
        { fg = colors.low_purple, bg = colors.shade_purple, style = opts.styles.virtualtext }
      p['GitSignsAddInline'] = { bg = colors.shade_cyan }
      p['GitSignsChangeInline'] = { bg = colors.shade_green }
      p['GitSignsDeleteInline'] = { bg = colors.shade_red }
      -- p['GitSignsAddLnInline'] = { link = 'GitSignsAddInline' }
      -- p['GitSignsChangeLnInline'] = { link = 'GitSignsChangeInline' }
      -- p['GitSignsDeleteLnInline'] = { link = 'GitSignsDeleteInline' }
      p['GitSignsDeleteVirtLn'] = { link = 'DiffDelete' }
      -- p['GitSignsDeleteVirtLnInline'] = { link = 'GitSignsDeleteVirtLn' }
      -- p['GitSignsDeleteVirtLnum'] = { link = 'GitSignsDeleteVirtLn' }
      p['GitSignsStagedAdd'] = { fg = colors.low_blue, bg = colors.shade_blue }
      p['GitSignsStagedChange'] = { fg = colors.low_green, bg = colors.shade_green }
      p['GitSignsStagedDelete'] = { fg = colors.low_red, bg = colors.shade_red }
    end
    local telescope = opts.plugins.telescope
    if telescope then
      p['TelescopeNormal'] = { link = 'Normal' }
      p['TelescopeSelection'] = { fg = colors.fg, bg = colors.selection }
      p['TelescopeMultiIcon'] = { fg = colors.high_green }
      p['TelescopeMultiSelection'] = { bg = colors.shade_green }
      p['TelescopePromptPrefix'] = { fg = colors.cyan }
      p['TelescopePromptCounter'] = { fg = colors.gray }
      p['TelescopeMatching'] = { fg = colors.bg, bg = colors.match, style = 'bold' }
      if telescope == 'border_fade' then
        p['TelescopeBorder'] = { link = 'NormalNC' }
        p['TelescopeTitle'] = { link = 'NormalNC' }
      end
    end
    --- noice
    if opts.plugins.noice then
      p['NoiceCmdline'] = { fg = colors.fg, sp = colors.border }
      p['NoiceCmdlinePrompt'] = { link = 'NoiceCmdline' }
      -- p['NoiceCmdlineIcon'] = { link = 'DiagnosticSignInfo' }
      p['NoiceLspProgressClient'] = { fg = colors.high_orange }
      p['NoiceLspProgressDone'] = { fg = colors.high_green }
      p['NoiceLspProgressSpinner'] = { fg = colors.high_purple }
      p['NoiceLspProgressTodo'] = { fg = colors.high_olive }
      p['NoiceLspProgressTitle'] = { fg = colors.high_gray }
      p['NoiceConfirm'] = { fg = colors.high_red, bg = colors.shade_gray }
      p['NoiceConfirmBorder'] = { fg = colors.shade_gray, bg = colors.shade_gray }
      p['NoiceCursor'] = { fg = colors.high_Cyan, bg = colors.shade_gray }
      p['NoiceFormatConfirm'] = { fg = colors.gray, bg = colors.nc }
      p['NoiceFormatConfirmDefault'] = { fg = colors.high_gray, bg = colors.selection }
      p['NoiceMini'] = { bg = colors.shade_gray }
      p['NoiceMiniReverse'] = { fg = colors.shade_gray, bg = colors.bg }
      p['NoiceMiniError'] = { fg = colors.high_red, bg = colors.shade_red }
      p['NoiceMiniErrorReverse'] = { fg = colors.shade_red, bg = colors.bg }
      p['NoiceMiniWarn'] = { fg = colors.high_olive, bg = colors.shade_olive }
      p['NoiceMiniWarnReverse'] = { fg = colors.shade_olive, bg = colors.bg }
      p['NoiceMiniHint'] = { fg = colors.high_blue, bg = colors.shade_blue }
      p['NoiceMiniHintReverse'] = { fg = colors.shade_blue, bg = colors.bg }
      p['NoicePopup'] = { fg = colors.fg, bg = colors.shade_blue }
      p['NoicePopupBorder'] = { fg = colors.low_gray }
      p['NoiceSplit'] = { link = 'NoicePopup' }
    end
    if opts.plugins.snacks then
      p['SnacksNormal'] = { link = 'Normal' }
      p['SnacksNormalNC'] = { link = 'Normal' }
      -- p['SnacksWinBar'] = { link = 'Title'}
      -- p['SnacksWinBarNC'] = { link = 'SnacksWinBar'}
      -- p['SnacksScratchKey'] = { link = 'DiagnosticVirtualText'}
      -- p['SnacksScratchDesc'] = { link = 'DiagnosticInfo'}
      -- p['SnacksNotifierFooterInfo'] = { link =  'DiagnosticInfo'}
      -- p['SnacksNotifierFooterWarn'] = { link =  'DiagnosticWarn'}
      -- p['SnacksNotifierFooterDebug'] = { link = 'DiagnosticHint'}
      -- p['SnacksNotifierFooterError'] = { link = 'DiagnosticError'}
      -- p['SnacksNotifierFooterTrace'] = { link = 'DiagnosticHint'}
      p['SnacksDashboardNormal'] = { link = 'Normal' }
      p['SnacksDashboardDesc'] = { link = 'Normal' }
      p['SnacksDashboardFile'] = { link = 'Normal' }
      p['SnacksDashboardDir'] = { link = 'Normal' }
      p['SnacksDashboardFooter'] = { fg = colors.low_gray }
      p['SnacksDashboardHeader'] = { fg = colors.shade_blue }
      p['SnacksDashboardIcon'] = { fg = colors.cyan }
      p['SnacksDashboardKey'] = { fg = colors.cyan }
      p['SnacksDashboardTerminal'] = { link = 'SnacksDashboardNormal' }
      p['SnacksDashboardSpecial'] = { fg = colors.high_purple }
      p['SnacksDashboardTitle'] = { fg = colors.bg, bg = colors.high_red }
      p['SnacksDebugPrint'] = { fg = colors.green }
      p['SnacksNotifierIconDebug'] = { fg = colors.high_green }
      p['SnacksNotifierTitleDebug'] = { fg = colors.high_green }
      p['SnacksNotifierFooterDebug'] = { link = 'SnacksDebugPrint' }
      p['SnacksNotifierBorderDebug'] = { link = 'SnacksDebugPrint' }
      p['SnacksIndent'] = { fg = colors.shade_gray }
      p['SnacksIndentScope'] = { fg = colors.low_orange }
      p['SnacksPickerBoxTitle'] = { fg = colors.gray }
      p['SnacksPickerCursorline'] = { fg = colors.nc }
      p['SnacksPickerGitDetached'] = { fg = colors.high_orange }
      p['SnacksPickerGitStatusStaged'] = { fg = colors.high_cyan }
      p['SnacksPickerGitStatusModified'] = { fg = colors.high_green }
      p['SnacksPickerGitStatusUnmerged'] = { fg = colors.high_red }
      p['SnacksPickerGitStatusCopied'] = { fg = colors.high_olive }
      p['SnacksPickerGitStatusRenamed'] = { fg = colors.high_purple }
      p['SnacksPickerInput'] = { link = 'Normal' }
      p['SnacksPickerInputCursorline'] = { link = 'Normal' }
      p['SnacksPickerInputTitle'] = { fg = colors.gray }
      p['SnacksPickerListTitle'] = { fg = colors.gray }
      p['SnacksPickerPickWin'] = { fg = colors.bg, bg = colors.high_purple }
      p['SnacksPickerPickWinCurrent'] = { fg = colors.bg, bg = colors.high_cyan }
      p['SnacksPickerPreviewTitle'] = { fg = colors.gray }
      p['SnacksPickerDir'] = { fg = colors.low_blue, style = opts.styles.comments }
      p['SnacksPickerFile'] = { fg = colors.blue }
      p['SnacksPickerMatch'] = { fg = colors.bg, bg = colors.match, style = 'bold' }
      p['SnacksPickerTree'] = { fg = colors.low_gray }
    end
    if opts.plugins.nvimtree then
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
    if opts.plugins.whichkey then
      p['WhichKey'] = { fg = colors.purple, style = 'bold' }
      p['WhichKeyGroup'] = { fg = colors.cyan }
      p['WhichKeyDesc'] = { fg = colors.blue, style = 'italic' }
      p['WhichKeySeperator'] = { fg = colors.green }
      p['WhichKeyFloat'] = { bg = colors.nc }
    end
    if opts.plugins.lspsaga then
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
    if opts.plugins.bufferline then
      p['BufferLineIndicatorSelected'] = { fg = colors.olive }
      p['BufferLineFill'] = { bg = colors.bg }
    end
    if opts.plugins.treesitter_context then
      p['TreesitterContext'] = { fg = colors.none, bg = colors.shade_gray }
    end
    if opts.plugins.barbar then
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
      p['BufferInactive'] = { fg = colors.low_gray, bg = colors.shade_gray }
      p['BufferInactiveIndex'] = { fg = colors.low_gray, bg = colors.shade_gray }
      p['BufferInactiveMod'] = { fg = colors.olive, bg = colors.shade_gray }
      p['BufferInactiveSign'] = { fg = colors.low_gray, bg = colors.shade_gray }
      p['BufferInactiveTarget'] = { fg = colors.red, bg = colors.shade_gray, style = 'bold' }
    end
    if opts.plugins.sneak then
      p['Sneak'] = { fg = colors.bg, bg = colors.fg }
      p['SneakScope'] = { bg = colors.selection }
    end
    if opts.plugins.indent_blankline then
      p['IndentBlanklineChar'] = { fg = colors.selection, style = 'nocombine' }
      p['IndentBlanklineSpaceChar'] = { fg = colors.gray, style = 'nocombine' }
      p['IndentBlanklineSpaceCharBlankline'] = { fg = colors.gray, style = 'nocombine' }
      p['IndentBlanklineContextChar'] = { fg = colors.purple, style = 'nocombine' }
      p['IndentBlanklineContextStart'] = { sp = colors.purple, style = 'underline' }
    end
    if opts.plugins.dap then
      p['DapBreakpoint'] = { fg = colors.low_red }
      p['DapBreakpointCondition'] = { fg = colors.purple }
      p['DapBreakpointRejected'] = { fg = colors.low_green }
      p['DapStopped'] = { fg = colors.low_red }
    end
    if opts.plugins.dap_virtual_text then
      p['NvimDapVirtualText'] = { fg = colors.high_purple, bg = colors.shade_red, style = opts.styles.virtualtext }
      p['NvimDapVirtualTextInfo'] = { fg = colors.bg, bg = colors.red }
      p['NvimDapVirtualTextChanged'] = { fg = colors.blue, bg = colors.shade_red, style = opts.styles.virtualtext }
      p['NvimDapVirtualTextError'] = { fg = colors.low_red, bg = colors.shade_red, style = opts.styles.virtualtext }
    end
    if opts.plugins.illuminate then
      p['illuminatedWord'] = { bg = colors.highlight }
      p['illuminatedCurWord'] = { bg = colors.highlight }
    end
    if opts.plugins.hop then
      p['HopNextKey'] = { fg = colors.fg, style = 'bold' }
      p['HopNextKey1'] = { fg = colors.cyan, style = 'bold' }
      p['HopNextKey2'] = { fg = colors.purple }
      p['HopUnmatched'] = { fg = colors.low_gray }
    end
    if opts.plugins.fern then
      p['FernBranchText'] = { fg = colors.blue }
    end
    if opts.plugins.lightspeed then
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
    if opts.plugins.navic then
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

    if opts.disable.background and opts.plugins.nvimtree then
      remove_bg(p.NvimTreeNormal)
    end

    return p
  end

  local function load_user_plugins()
    -- User plugins highlight groups
    local p = {}
    vim.iter(opts.user_plugins):each(function(name, enable)
      if enable then
        local plugin_name = 'loose.user_plugins.' .. name
        local ok, user_plugin = pcall(require, plugin_name)
        if ok then
          user_plugin(p, colors, enable)
          package.loaded[plugin_name] = nil
        end
      end
    end)

    return p
  end

  function theme.load_terminal()
    -- dark
    -- vim.g.terminal_color_0 = colors.float
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

  return vim.tbl_deep_extend(
    'error',
    load_syntax(),
    load_editor(),
    load_treesitter(),
    load_lsp(),
    load_plugins(),
    load_user_plugins()
  )
end

return theme
