vim.cmd 'highlight clear'
vim.cmd 'syntax reset'
vim.g.colors_name = 'melange'

local bg = vim.opt.background:get()

-- package.loaded['melange/palettes/' .. bg] = nil -- Only needed for development
local palette = require('melange/palettes/' .. bg)

local a = palette.a -- Grays
local b = palette.b -- Bright foreground colors
local c = palette.c -- Foreground colors
local d = palette.d -- Background colors

local bold, italic, underline, undercurl, strikethrough
if vim.g.melange_enable_font_variants == true or vim.g.melange_enable_font_variants == nil then
  --- Enable all font attributes by default
  bold = true
  italic = true
  underline = true
  undercurl = true
  strikethrough = true
elseif type(vim.g.melange_enable_font_variants) == 'table' then
  --- Enable only selected font attributes
  bold = vim.g.melange_enable_font_variants.bold
  italic = vim.g.melange_enable_font_variants.italic
  underline = vim.g.melange_enable_font_variants.underline
  undercurl = vim.g.melange_enable_font_variants.undercurl
  strikethrough = vim.g.melange_enable_font_variants.strikethrough
end

for name, attrs in pairs {

  ---- :help highlight-default -------------------------------

  Normal = { fg = a.fg, bg = a.bg },
  NormalFloat = { bg = a.float },
  FloatBorder = { bg = a.float },
  PopupBorder = 'FloatBorder',
  -- NormalNC = {},

  -- Cursor = {},
  -- lCursor = {},
  -- CursorIM = {},
  -- TermCursor = {},
  TermCursorNC = { bg = a.sel },

  ColorColumn = { bg = a.bg },
  CursorColumn = 'ColorColumn',
  CursorLine = { bg = a.float0 },
  VertSplit = { fg = a.ui, bg = a.float },

  LineNr = { fg = a.sel, bg = a.bg },
  LineNC = { fg = a.sel, bg = a.bg },
  CursorLineNr = { fg = c.yellow, bg = a.bg },
  CursorLineSign = { fg = a.sel, nocombine = true, bg = a.bg },

  Folded = { fg = a.com, bg = d.cyan },
  FoldColumn = 'LineNr',
  SignColumn = { fg = a.sel, nocombine = true, bg = a.bg },
  StatusColumnSeparator = { fg = a.bg, nocombine = true, bg = a.bg },

  WinSeparator = { fg = a.bg1, bg = a.bg },

  Pmenu = 'NormalFloat',
  PmenuSel = { bg = a.sel },
  PmenuSbar = 'Pmenu',
  PmenuThumb = 'PmenuSel',
  PmenuMatch = { fg = b.yellow, bold = bold, bg = a.float },
  PmenuMatchSel = { fg = b.yellow, bold = bold, bg = a.sel },
  PmenuBorder = 'FloatBorder',

  StatusLine = { fg = a.ui, bg = a.bg },
  StatusLineNC = { fg = a.sel, nocombine = true, bg = a.bg },
  WildMenu = 'NormalFloat',

  TabLine = 'StatusLineNC',
  TabLineFill = 'StatusLine',
  TabLineSel = { bg = a.bg, bold = bold },

  MatchParen = { fg = b.yellow, bg = a.sel, bold = bold },
  Search = { fg = a.bg, bg = d.yellow, bold = bold },
  Substitute = { bg = d.red, bold = bold },
  -- QuickFixLine = {},
  -- IncSearch = {},
  Visual = { bg = a.sel },
  -- VisualNOS = {},

  Conceal = { fg = a.com },
  Whitespace = { fg = a.ui },
  -- EndOfBuffer = {},
  NonText = 'Whitespace',
  SpecialKey = 'Whitespace',

  Directory = { fg = c.cyan },
  Title = { fg = c.yellow },
  ErrorMsg = { bg = d.red },
  ModeMsg = { fg = a.com },
  MsgArea = { fg = a.ui, bg = a.bg },
  -- MsgSeparator = {},
  MoreMsg = { fg = c.green, bold = bold },
  WarningMsg = { fg = c.red },
  Question = 'MoreMsg',

  ---- :help cmp ---------------------------------------------

  CmpItemAbbrMatch = { fg = c.blue, bold = bold },
  CmpItemMenu = { fg = a.fg, bg = 'none' },
  CmpItemAbbrMatchFuzzy = { fg = c.blue, underline = true },

  CmpDocumentation = 'Pmenu',
  CmpDocumentationBorder = 'FloatBorder',

  CmpItemKindText = { fg = c.yellow },
  CmpItemKindMethod = { fg = c.blue },
  CmpItemKindFunction = { link = 'CmpItemKindMethod' },
  CmpItemKindConstructor = { fg = c.yellow },
  CmpItemKindField = { fg = c.blue },
  CmpItemKindClass = { fg = c.yellow },
  CmpItemKindInterface = { link = 'CmpItemKindClass' },
  CmpItemKindModule = { fg = c.blue },
  CmpItemKindProperty = { fg = c.blue },
  CmpItemKindValue = { fg = c.yellow },
  CmpItemKindEnum = { fg = c.yellow },
  CmpItemKindKeyword = { fg = c.magenta },
  CmpItemKindSnippet = { fg = c.green },
  CmpItemKindFile = { fg = c.blue },
  CmpItemKindEnumMember = { fg = c.cyan },
  CmpItemKindConstant = { fg = c.green },
  CmpItemKindStruct = { fg = c.yellow },
  CmpItemKindTypeParameter = { fg = c.yellow },

  ---- :help :diff -------------------------------------------

  DiffAdd = { bg = d.green },
  DiffChange = { bg = d.magenta },
  DiffDelete = { bg = d.red },
  DiffText = { bg = d.blue },

  DiffAdded = 'DiffAdd',
  DiffRemoved = 'DiffDelete',

  diffAdded = 'DiffAdd',
  diffChanged = 'DiffChange',
  diffRemoved = 'DiffDelete',

  ---- :help spell -------------------------------------------

  SpellBad = { sp = c.red, undercurl = undercurl },
  SpellCap = { sp = c.blue, undercurl = undercurl },
  SpellLocal = { sp = c.yellow, undercurl = undercurl },
  SpellRare = { sp = b.yellow, undercurl = undercurl },

  ---- :help group-name --------------------------------------

  Comment = { fg = a.com, italic = italic },
  Identifier = { fg = a.fg },
  Function = { fg = b.yellow },
  Constant = { fg = c.magenta },
  String = { fg = b.blue, italic = false },
  Character = { fg = c.blue },
  Number = { fg = b.magenta },
  Boolean = 'Number',
  -- Float = {},

  Statement = { fg = c.yellow },
  -- Conditional = {},
  -- Repeat = {},
  -- Label = {},
  Operator = { fg = b.red },
  -- Keyword = {},
  -- Exception = {},

  PreProc = { fg = b.green },
  -- Include = {},
  -- Define = {},
  -- Macro = {},
  -- PreCondit = {},

  Type = { fg = c.cyan },
  -- StorageClass = {},
  -- Structure = {},
  -- Typedef = {},

  Special = { fg = b.yellow },
  -- SpecialChar = {},
  -- Tag = {},
  Delimiter = { fg = d.yellow },
  -- SpecialComment = {},
  -- Debug = {},

  Underlined = { underline = underline },
  Bold = { bold = bold },
  Italic = { italic = italic },

  Ignore = { fg = a.ui },
  Error = { bg = d.red },
  Todo = { fg = a.com, bold = bold },

  ---- :help nvim-treesitter-highlights (external plugin) ----

  -- ['@boolean'] = {},
  -- ['@number'] = {},
  -- ['@number.float'] = {},

  -- ['@character'] = {},
  -- ['@character.special'] = {},
  -- ['@string'] = {},
  ['@string.documentation'] = { fg = b.com, nocombine = true },
  ['@string.escape'] = { fg = c.blue },
  ['@string.regexp'] = { fg = b.blue },
  ['@string.special'] = { fg = b.cyan },
  ['@string.special.symbol'] = { fg = a.fg, italic = italic },
  ['@string.special.path'] = { fg = c.blue },
  ['@string.special.url'] = '@string.special.path',

  -- ['@keyword'] = {},
  -- ['@keyword.conditional'] = {},
  -- ['@keyword.conditional.ternary'] = {},
  -- ['@keyword.coroutine'] = {},
  -- ['@keyword.debug'] = {},
  ['@keyword.directive'] = 'PreProc',
  -- ['@keyword.directive.define'] = {},
  -- ['@keyword.exception'] = {},
  ['@keyword.function'] = 'PreProc',
  ['@keyword.import'] = 'PreProc',
  -- ['@keyword.operator'] = {},
  -- ['@keyword.repeat'] = {},
  -- ['@keyword.return'] = {},
  -- ['@keyword.storage'] = {},

  --- NOTE: Queries for these highlight groups are really hacky.
  --- Inaccurate syntax highlighting is worse than no highlighting at all,
  ['@constant'] = 'Identifier',
  ['@constant.builtin'] = 'Constant',
  ['@constant.macro'] = 'Constant',
  ['@module'] = 'Identifier',
  ['@module.builtin'] = '@module',
  ['@label'] = { fg = b.cyan },
  ['@variable'] = 'Identifier',
  ['@variable.builtin'] = '@string.special.symbol',
  -- ['@variable.parameter'] = {},
  -- ['@variable.member'] = {},

  -- ['@type'] = {},
  -- ['@type.builtin'] = {},
  -- ['@type.definition'] = {},
  ['@type.qualifier'] = 'Statement',
  -- ['@attribute'] = {},
  -- ['@property'] = {},

  -- ['@function'] = {},
  -- ['@function.builtin'] = {},
  ['@function.macro'] = 'Function',
  -- ['@function.method'] = {},
  -- ['@constructor'] = {},

  -- ['@punctuation.bracket'] = {},
  ['@punctuation.delimiter'] = { fg = c.red },
  -- ['@punctuation.special'] = {},

  -- ['@comment'] = {},
  ['@comment.documentation'] = { fg = a.com, nocombine = true },
  ['@comment.error'] = 'Todo',
  ['@comment.note'] = 'Todo',
  ['@comment.todo'] = 'Todo',
  ['@comment.warning'] = 'Todo',

  -- ['@markup'] = {},
  ['@markup.heading'] = 'Title',
  ['@markup.heading.2'] = { fg = b.yellow },
  ['@markup.heading.3'] = { fg = b.green },
  ['@markup.heading.4'] = { fg = b.cyan },

  ['@markup.italic'] = { italic = italic },
  ['@markup.strong'] = { bold = bold },
  ['@markup.strikethrough'] = { strikethrough = strikethrough },
  ['@markup.underline'] = { underline = underline },

  ['@markup.quote'] = 'Comment',
  -- ['@markup.math'] = {}, -- TODO
  -- ['@markup.environment'] = {},
  ['@markup.link'] = { underline = underline },
  -- ['@markup.link.label'] = {},
  ['@markup.link.url'] = '@string.special.url',
  ['@markup.raw'] = { fg = a.com },
  -- ['@markup.raw.block'] = {},
  ['@markup.list'] = 'Delimiter',
  -- ['@markup.list.checked'] = {},
  -- ['@markup.list.unchecked'] = {},

  ['@diff.plus'] = 'DiffAdd',
  ['@diff.minus'] = 'DiffDelete',
  ['@diff.delta'] = 'DiffChange',

  -- ['@tag'] = {},
  ['@tag.attribute'] = '@label',
  ['@tag.delimiter'] = 'Delimiter',

  ---- :help diagnostic-highlight ----------------------------

  DiagnosticError = { fg = c.red },
  DiagnosticWarn = { fg = b.yellow },
  DiagnosticInfo = { fg = c.blue },
  DiagnosticHint = { fg = c.cyan },
  DiagnosticOk = { fg = c.green },
  DiagnosticUnderlineError = { undercurl = undercurl, sp = c.red },
  DiagnosticUnderlineWarn = { undercurl = undercurl, sp = b.yellow },
  DiagnosticUnderlineInfo = { undercurl = undercurl, sp = c.blue },
  DiagnosticUnderlineHint = { undercurl = undercurl, sp = c.cyan },
  DiagnosticUnderlineOk = { undercurl = undercurl, sp = c.green },
  DiagnosticFloatingError = { fg = a.fg, bg = a.float },
  DiagnosticFloatingWarn = { fg = a.fg, bg = a.float },
  DiagnosticFloatingInfo = { fg = a.fg, bg = a.float },
  DiagnosticFloatingHint = { fg = a.fg, bg = a.float },
  DiagnosticFloatingOk = { fg = a.fg, bg = a.float },
  DiagnosticFloatingSuffix = { fg = a.com, bg = a.float },
  -- DiagnosticSignError = {},
  -- DiagnosticSignWarn = {},
  -- DiagnosticSignInfo = {},
  -- DiagnosticSignHint = {},
  -- DiagnosticSignOk = {},

  DiagnosticDeprecated = { link = 'DiagnosticUnderlineError' },
  DiagnosticUnnecessary = { fg = a.com, undercurl = undercurl },

  ---- :help lsp-highlight -----------------------------------

  -- LspReferenceText = 'Visual',
  -- LspReferenceRead = 'Visual',
  -- LspReferenceWrite = 'Visual',

  -- TODO: lsp-highlight-codelens

  ---- :help lsp-semantic-highlight --------------------------

  ['@lsp.type.class'] = 'Structure',
  ['@lsp.type.comment'] = 'Comment',
  ['@lsp.type.decorator'] = 'Function',
  ['@lsp.type.enum'] = 'Structure',
  ['@lsp.type.enumMember'] = 'Constant',
  ['@lsp.type.function'] = 'Function',
  ['@lsp.type.interface'] = 'Structure',
  ['@lsp.type.macro'] = 'Function',
  ['@lsp.type.method'] = 'Function',
  ['@lsp.type.namespace'] = { fg = c.green },
  ['@lsp.type.parameter'] = { fg = a.fg, bold = bold },
  ['@lsp.type.property'] = 'Identifier',
  ['@lsp.type.struct'] = 'Structure',
  ['@lsp.type.type'] = 'Type',
  ['@lsp.type.typeParameter'] = 'TypeDef',
  ['@lsp.type.variable'] = 'Identifier',

  ---- :help vimtex-syntax-reference (external plugin) -------

  texOptSep = '@punctuation.delimiter',
  texOptEqual = 'Operator',
  texFileArg = 'Constant',
  texTitleArg = { bold = bold },
  texRefArg = 'Constant',

  texMathCmd = 'Function',
  texMathSymbol = 'Operator',
  texMathZone = 'TSMath',
  texMathDelimZone = 'TSPunctDelimiter',
  texMathDelim = 'Delimiter',
  texMathEnvArgName = 'PreProc',

  --- neo-tree highlights  :help neo-tree-highlights ---

  NeoTreeNormal = 'NormalFloat',
  NeoTreeNormalNC = 'NeoTreeNormal',
  NeoTreeVertSplit = { bg = a.bg, fg = a.bg },
  NeoTreeWinSeparator = { bg = a.bg, fg = a.bg },

  NeoTreeCursorLine = { bg = a.sel },

  NeoTreeSymbolicLinkTarget = { fg = c.cyan },
  NeoTreeDirectoryName = { fg = c.blue },
  NeoTreeDirectoryIcon = { fg = c.blue },
  NeoTreeRootName = { fg = c.blue },
  NeoTreeFileIcon = { fg = c.blue },
  NeoTreeFileName = { fg = a.fg },
  NeoTreeFileNameOpened = { fg = c.magenta },
  -- NeoTreeIndentMarker = { fg = theme.palette.gray },
  -- NeoTreeTitleBar = { fg = theme.palette.bg, bg = theme.palette.purple },
  -- NeoTreeFloatTitle = { fg = theme.palette.bg, bg = theme.palette.purple },
  -- NeoTreeGitAdded = { fg = theme.palette.green },
  -- NeoTreeGitConflict = { fg = theme.palette.blue },
  -- NeoTreeGitDeleted = { fg = theme.palette.red },
  -- NeoTreeGitModified = { fg = theme.palette.yellow },
  -- NeoTreeGitIgnored = { fg = theme.palette.gray },
  -- NeoTreeGitUntracked = { fg = theme.palette.gray },
  NeoTreeModified = { fg = c.magenta },

  NeoTreeFloatBorder = { fg = a.float0, bg = a.float0 },
  NeoTreeTitleBar = { fg = a.fg, bg = a.float0 },

  --- netrw: there's no comprehensive list of highlights... --

  netrwClassify = 'Delimiter',
  netrwTreeBar = 'Delimiter',
  netrwExe = { fg = c.red },
  netrwSymLink = { fg = c.magenta },

  ---- :h gitsigns (external plugin) -------------------------

  GitSignsAdd = { fg = c.green },
  GitSignsChange = { fg = c.magenta },
  GitSignsDelete = { fg = c.red },
  GitSignsCurrentLineBlame = { fg = c.blue },

  SignifySignAdd = 'GitSignsAdd',
  SignifySignChange = 'GitSignsChange',
  SignifySignDelete = 'GitSignsDelete',

  ---- :h ibl.highlights (external plugin) -------------------
  IblIndent = { fg = a.sel, nocombine = true },
  IblWhitespace = 'IblIndent',
  IndentBlanklineChar = 'IblIndent', -- Deprecated?
  IndentBlanklineSpaceChar = 'IndentBlanklineChar',
  IndentBlanklineSpaceCharBlankline = 'IndentBlanklineChar',

  ---- :h cmp-highlight (external plugin) -------------------
  CmpItemAbbrMatch = { fg = b.yellow, bold = bold },
  CmpItemAbbrMatchFuzzy = { fg = b.yellow, bold = bold },
  CmpItemKindVariable = '@variable',
  CmpItemKindValue = '@constant',
  CmpItemKindUnit = '@constant',
  CmpItemKindTypeParameter = '@type',
  CmpItemKindText = '@text',
  CmpItemKindStruct = '@type',
  CmpItemKindSnippet = '@string.special',
  CmpItemKindReference = '@type',
  CmpItemKindProperty = '@property',
  CmpItemKindOperator = '@operator',
  CmpItemKindModule = '@namespace',
  CmpItemKindMethod = '@method',
  CmpItemKindKeyword = '@keyword',
  CmpItemKindInterface = '@type',
  CmpItemKindFunction = '@function',
  CmpItemKindFolder = '@string.special.path',
  CmpItemKindFile = '@string.special.path',
  CmpItemKindField = '@field',
  CmpItemKindEvent = '@type',
  CmpItemKindEnumMember = '@field',
  CmpItemKindEnum = '@type',
  CmpItemKindConstructor = '@constructor',
  CmpItemKindConstant = '@constant',
  CmpItemKindColor = '@constant',
  CmpItemKindClass = '@type',
  MiniIndentscopeSymbol = { link = 'IndentBlanklineChar' },

  MiniFilesBorder = { fg = a.float, bg = a.float },
  MiniFilesTitle = { fg = c.red, bg = a.float },
  MiniFilesTitleFocused = { fg = b.red, bg = a.float },
  MiniFilesBorderModified = { fg = a.float, bg = a.float },
  MiniFilesNormal = { fg = a.fg, bg = a.float },
  MiniFilesFile = { fg = a.fg, bg = a.float },
  MiniFilesDirectory = { fg = b.blue, bg = a.float },
  MiniFilesCursorLine = { fg = 'none', bg = a.float },

  TelescopeBorder = {
    fg = a.float,
    bg = a.float,
  },
  TelescopePromptBorder = {
    fg = a.float,
    bg = a.float,
  },
  TelescopePromptCounter = { fg = c.red },
  TelescopePromptNormal = { fg = a.fg, bg = a.float },
  TelescopePromptPrefix = {
    fg = c.red,
    bg = a.float,
  },
  TelescopePromptTitle = {
    fg = a.fg,
    bg = d.magenta,
  },
  TelescopePreviewTitle = {
    fg = a.fg,
    bg = d.green,
  },
  TelescopeResultsTitle = {
    fg = a.float,
    bg = a.float,
  },
  TelescopeMatching = { fg = b.blue },
  TelescopeNormal = { bg = a.float },
  TelescopeSelection = { bg = a.sel },
  TelescopePreviewNormal = { bg = a.float0 },
  TelescopePreviewBorder = { fg = a.float0, bg = a.float0 },

  -- h neo-test
  NeotestAdapterName = { fg = c.magenta },
  -- NeotestBorder not implemented yet
  NeotestDir = { fg = c.cyan },
  NeotestExpandMarker = { fg = a.com },
  NeotestFile = { fg = c.cyan },
  NeotestFocused = { bg = a.sel },
  NeotestIndent = { fg = a.fg },
  NeotestNamespace = { fg = c.blue },
  NeotestFailed = { fg = b.red, bg = a.float },
  NeotestPassed = { fg = b.green, bg = a.float },
  NeotestRunning = { fg = b.yellow, bg = a.float },
  NeotestSkipped = { fg = b.cyan, bg = a.float },

  DapUIScope = { fg = c.blue },
  DapUIType = { fg = c.blue },
  DapUIDecoration = { fg = c.blue },
  DapUIModifiedValue = { fg = c.cyan },
  DapUIThread = { fg = c.magenta },
  DapUIStoppedThread = { fg = c.yellow },
  DapUILineNumber = { fg = a.com },
  DapUIFrameName = { fg = a.fg },
  DapUISource = { fg = c.purple },
  DapUIBreakpointsPath = { fg = c.yellow },
  DapUIBreakpointsInfo = { fg = a.fg },
  DapUIBreakpointsCurrentLine = { fg = b.yellow },
  DapUIBreakpointsLine = { link = 'DapUIBreakpointsCurrentLine' },
  DapUIWatchesEmpty = { fg = c.red },
  DapUIWatchesValue = { fg = c.red },
  DapUIWatchesError = { fg = c.red },
  DapUINormalFloat = { link = 'FloatNormal' },
  DapUIFloatBorder = { link = 'FloatBorder' },

  -- h dap
  DebugLogPoint = { fg = b.yellow, bg = a.float },
  DebugStopped = { fg = b.yellow, bg = a.float },
  DebugStoppedLine = { fg = b.yellow, bg = a.float, bold = bold },
  DebugBreakpointRejected = { fg = c.magenta, bg = a.float },
  DebugBreakpoint = { fg = c.red, bg = a.float },
  DebugBreakpointLine = { fg = c.red, bg = a.float, bold = bold },
  DebugHighlight = { fg = c.blue, bg = a.float },
  DebugHighlightLine = { fg = c.purple, bg = a.float, bold = bold },
  NvimDapVirtualText = { fg = c.cyan },
} do
  if type(attrs) == 'table' then
    vim.api.nvim_set_hl(0, name, attrs)
  else
    vim.api.nvim_set_hl(0, name, { link = attrs })
  end
end

-- See https://github.com/neovim/neovim/pull/7406
vim.g.terminal_color_0 = a.float
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.magenta
vim.g.terminal_color_6 = c.cyan
vim.g.terminal_color_7 = a.com
vim.g.terminal_color_8 = a.ui
vim.g.terminal_color_9 = b.red
vim.g.terminal_color_10 = b.green
vim.g.terminal_color_11 = b.yellow
vim.g.terminal_color_12 = b.blue
vim.g.terminal_color_13 = b.magenta
vim.g.terminal_color_14 = b.cyan
vim.g.terminal_color_15 = a.fg

-- vi:nowrap
