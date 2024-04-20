local lush = require('lush')
local hsl = lush.hsl

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  local pure_black = hsl(0, 0, 0)
  local white = hsl(255, 100, 100)
  local magenta = hsl(324, 71, 36)
  local yellow = hsl(20, 100, 65)
  local bright_yellow = hsl(65, 100, 50)
  local grey = hsl(3, 3, 80)

  local dark_pink = hsl(349, 100, 65)
  local pink_base = hsl(349, 100, 78)
  local soft_pink = hsl(342, 71, 78)
  local softer_pink = hsl(330, 100, 90)
  local pink_white = hsl(348, 100, 95)
  local dark_blue = hsl(245, 100, 14)

  local cyan = hsl(236, 100, 60)
  local red_key = hsl(343, 76, 61)
  local hot_red = hsl(1, 95, 55)
  local brown = hsl(0, 100, 20)
  local green = hsl(72, 56, 39)

  return {
    Normal { bg = pink_white.li(0), fg = pink_base.da(20) },               -- Normal text
    NormalFloat { bg = pink_white.da(2), fg = brown.da(20) },              -- Normal text in floating windows.
    Cursor { bg = red_key, fg = pink_base },                               -- Character under the cursor
    CurSearch { bg = dark_pink, fg = pure_black },                         -- Highlighting a search pattern under the cursor (see 'hlsearch')
    lCursor { fg = pink_base.da(30), bg = red_key },                       -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorLine { bg = softer_pink },                                       -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory { fg = green },                                              -- Directory names (and other special names in listings)
    DiffAdd { bg = green.li(20), fg = pure_black },                        -- Diff mode: Added line |diff.txt|
    DiffChange { bg = grey },                                              -- Diff mode: Changed line |diff.txt|
    DiffDelete { fg = white.da(10), bg = brown },                          -- Diff mode: Deleted line |diff.txt|
    DiffText { bg = cyan, fg = pure_black },                               -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer {},                                                        -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor { Cursor },                                                 -- Cursor in a focused terminal
    ErrorMsg { fg = hot_red },                                             -- Error messages on the command line
    VertSplit {},                                                          -- Column separating vertically split windows
    Folded { bg = grey },                                                  -- Line used for closed folds
    FoldColumn { Folded },                                                 -- 'foldcolumn'
    SignColumn {},                                                         -- Column where |signs| are displayed
    LineNr { fg = pink_base },                                             -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove { LineNr },                                                -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow { LineNr },                                                -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr { fg = hot_red },                                         -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen { bg = grey },                                              -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg { fg = pink_base },                                            -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea { fg = dark_pink },                                            -- Area for messages and cmdline
    MoreMsg { fg = pink_base },                                            -- |more-prompt|
    FloatBorder { bg = pink_white },                                       -- Border of floating windows.
    Visual { bg = Normal.bg.sa(-5).da(30), fg = pure_black },              -- Visual mode selection
    VisualNOS { bg = softer_pink, fg = Normal.fg.sa(-5).li(30) },          -- Visual mode selection when vim is "Not Owning the Selection".
    NonText { fg = pink_base.da(10) },                                     -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    FloatTitle { fg = red_key },                                           -- Title of floating windows.
    NormalNC { fg = Normal.fg.li(10), bg = Normal.bg.li(5) },              -- normal text in non-current windows
    Pmenu { bg = Normal.bg, fg = Normal.fg },                              -- Popup menu: Normal item.
    PmenuSel { bg = pink_base, fg = pure_black },                          -- Popup menu: Selected item.
    PmenuKind { fg = Normal.fg },                                          -- Popup menu: Normal item "kind"
    PmenuKindSel { fg = Normal.fg },                                       -- Popup menu: Selected item "kind"
    PmenuExtra { bg = NormalFloat.bg },                                    -- Popup menu: Normal item "extra text"
    PmenuExtraSel {},                                                      -- Popup menu: Selected item "extra text"
    PmenuSbar { bg = softer_pink, fg = dark_pink },                        -- Popup menu: Scrollbar.
    PmenuThumb { bg = pink_base, fg = softer_pink },                       -- Popup menu: Thumb of the scrollbar.
    StatusLine { bg = pink_base, fg = brown },                             -- Status line of current window
    StatusLineNC { fg = StatusLine.fg.li(30), bg = StatusLine.bg.li(10) }, -- StaLineus lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    Title { fg = red_key },                                                -- Titles for output from ":set all", ":autocmd" etc.
    WarningMsg { fg = yellow.li(30), bg = brown },                         -- Warning messages
    Search { CurSearch },                                                  -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    Winseparator { Normal },                                               -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WinBar { StatusLine },                                                 -- Window bar of current window
    WinBarNC { bg = softer_pink },                                         -- Window bar of not-current windows
    -- ColorColumn {},                                                        -- Columns set with 'colorcolumn'
    -- TermCursorNC {},                                                       -- Cursor in an unfocused terminal
    -- Conceal {},                                                            -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- CursorLineFold {},                                                     -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign {},                                                     -- Like SignColumn when 'cursorline' is set for the cursor line
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- CursorIM {},                                                           -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn {},                                                       -- Screen-column at the cursor, when 'cursorcolumn' is set.

    Comment { fg = Normal.fg.li(45) },       -- Any comment
    Constant { fg = soft_pink.da(30) },      -- (*) Any constant
    String { fg = green },                   --   A string constant: "this is a string"
    Character { String },                    --   A character constant: 'c', '\n'
    Number { fg = magenta.li(20) },          --   A number constant: 234, 0xff
    Boolean { Number },                      --   A boolean constant: TRUE, false
    Float { Number },                        --   A floating point constant: 2.3e10

    Identifier { fg = dark_pink },           -- (*) Any variable name
    Function { fg = magenta.li(40) },        --   Function name (also: methods for classes)

    Statement { fg = red_key },              -- (*) Any statement
    Conditional { fg = softer_pink.da(40) }, --   if, then, else, endif, switch, etc.
    Repeat { fg = hot_red.li(10) },          --   for, do, while, etc.
    Label { fg = red_key },                  --   case, default, etc.
    Operator { fg = magenta },               --   "sizeof", "+", "*", etc.
    Keyword { fg = magenta.li(30) },         --   any other keyword
    -- Exception {},                                   --   try, catch, throw

    PreProc { fg = dark_pink.da(10) },              -- (*) Generic Preprocessor
    Include { fg = red_key.da(20).sa(100) },        --   Preprocessor #include
    Define { fg = magenta.li(10) },                 --   Preprocessor #define
    Macro { fg = magenta.li(10) },                  --   Same as Define
    PreCondit { fg = red_key },                     --   Preprocessor #if, #else, #endif, etc.

    Type { fg = cyan },                             -- (*) int, long, char, etc.
    StorageClass { fg = hot_red.da(20) },           --   static, register, volatile, etc.
    Structure { fg = magenta },                     --   struct, union, enum, etc.
    Typedef { fg = red_key.da(20) },                --   A typedef

    Special { Type },                               -- (*) Any special symbol
    SpecialChar { String },                         --   Special character in a constant
    Tag { Type },                                   --   You can use CTRL-] on this
    Delimiter { fg = magenta },                     --   Character that needs attention
    SpecialComment { fg = Comment.fg.da(20) },      --   Special things inside a comment (e.g. '\n')
    Debug { fg = cyan },                            --   Debugging statements

    Underlined { gui = "underline", fg = red_key }, -- Text that stands out, HTML links
    Error { fg = pink_white, bg = hot_red },        -- Any erroneous construct
    Todo { bg = green, fg = pink_white },           -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Ignore { bg = white },                          -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError { fg = red_key.da(10) }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn { fg = yellow.da(10) },   -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo { fg = cyan },            -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint { fg = cyan.da(10) },     -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk { fg = green },             -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    {  }, -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym "@variable" { Identifier }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@tag"               { }, -- Tag
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
  }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
