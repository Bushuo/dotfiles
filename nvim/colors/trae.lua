-- Trae Dark colorscheme - ported from VS Code extension yoy0721.trae-theme

vim.cmd 'hi clear'
vim.g.colors_name = 'trae'
vim.o.termguicolors = true
vim.o.background = 'dark'

local c = {
  bg = '#181A1F',
  bg_sidebar = '#24262B',
  bg_float = '#33363D',
  bg_highlight = '#292c34',
  bg_selection = '#293555',
  bg_visual = '#2E3040',
  border = '#3A3D45',
  fg = '#DADDE5',
  fg_dark = '#D5D8E0',
  fg_dim = '#9599A6',
  fg_bright = '#E0E3EE',
  fg_white = '#FFFFFF',
  comment = '#737780',
  string = '#82D99F',
  keyword = '#B38CFF',
  func = '#F29D79',
  type = '#81CFE0',
  variable = '#DED47E',
  constant = '#80BBFF',
  number = '#F48CCA',
  tag = '#F2858C',
  error = '#CC4B53',
  warning = '#EB9B61',
  info = '#387BFF',
  hint = '#81CFE0',
  added = '#00A56E',
  changed = '#387BFF',
  deleted = '#CC4B53',
}

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor
hi('Normal', { fg = c.fg, bg = c.bg })
hi('NormalFloat', { fg = c.fg, bg = c.bg_float })
hi('NormalNC', { fg = c.fg, bg = c.bg })
hi('Cursor', { fg = c.bg, bg = c.fg })
hi('CursorLine', { bg = c.bg_highlight })
hi('CursorLineNr', { fg = c.fg_bright })
hi('LineNr', { fg = c.fg_dim })
hi('SignColumn', { fg = c.fg_dim, bg = c.bg })
hi('ColorColumn', { bg = c.bg_highlight })
hi('Visual', { bg = '#293555' })
hi('VisualNOS', { bg = '#293555' })
hi('Search', { fg = c.bg, bg = c.variable })
hi('IncSearch', { fg = c.bg, bg = c.func })
hi('CurSearch', { fg = c.bg, bg = c.func })
hi('Substitute', { fg = c.bg, bg = c.tag })
hi('MatchParen', { bg = '#3D3E47' })
hi('Folded', { fg = c.fg_dim, bg = c.bg_highlight })
hi('FoldColumn', { fg = c.fg_dim })
hi('NonText', { fg = c.border })
hi('SpecialKey', { fg = c.border })
hi('Whitespace', { fg = c.border })
hi('EndOfBuffer', { fg = c.bg })

-- Popup menu
hi('Pmenu', { fg = c.fg, bg = c.bg_float })
hi('PmenuSel', { bg = '#2E3040' })
hi('PmenuSbar', { bg = c.bg_sidebar })
hi('PmenuThumb', { bg = c.fg_dim })

-- Status/Tab line
hi('StatusLine', { fg = c.fg, bg = c.bg_sidebar })
hi('StatusLineNC', { fg = c.fg_dim, bg = c.bg_sidebar })
hi('TabLine', { fg = c.fg, bg = c.bg_sidebar })
hi('TabLineFill', { bg = c.bg_sidebar })
hi('TabLineSel', { fg = c.fg, bg = c.bg })
hi('WinBar', { fg = c.fg, bg = c.bg })
hi('WinBarNC', { fg = c.fg_dim, bg = c.bg })
hi('WinSeparator', { fg = c.border })

-- Messages
hi('ErrorMsg', { fg = c.error })
hi('WarningMsg', { fg = c.warning })
hi('ModeMsg', { fg = c.fg })
hi('MoreMsg', { fg = c.info })
hi('Question', { fg = c.info })
hi('Title', { fg = c.constant, bold = true })
hi('Directory', { fg = c.constant })
hi('WildMenu', { bg = '#2E3040' })

-- Diff
hi('DiffAdd', { bg = '#1E3332' })
hi('DiffChange', { bg = '#1E2A3D' })
hi('DiffDelete', { bg = '#3D2228' })
hi('DiffText', { bg = '#243550' })
hi('Added', { fg = c.added })
hi('Changed', { fg = c.changed })
hi('Removed', { fg = c.deleted })

-- Diagnostics
hi('DiagnosticError', { fg = c.error })
hi('DiagnosticWarn', { fg = c.warning })
hi('DiagnosticInfo', { fg = c.info })
hi('DiagnosticHint', { fg = c.hint })
hi('DiagnosticUnderlineError', { sp = c.error, undercurl = true })
hi('DiagnosticUnderlineWarn', { sp = c.warning, undercurl = true })
hi('DiagnosticUnderlineInfo', { sp = c.info, undercurl = true })
hi('DiagnosticUnderlineHint', { sp = c.hint, undercurl = true })

-- Syntax
hi('Comment', { fg = c.comment, italic = true })
hi('Constant', { fg = c.constant })
hi('String', { fg = c.string })
hi('Character', { fg = c.constant })
hi('Number', { fg = c.number })
hi('Boolean', { fg = c.constant })
hi('Float', { fg = c.number })
hi('Identifier', { fg = c.variable })
hi('Function', { fg = c.func })
hi('Statement', { fg = c.keyword })
hi('Conditional', { fg = c.keyword })
hi('Repeat', { fg = c.keyword })
hi('Label', { fg = c.string })
hi('Operator', { fg = c.fg_dark })
hi('Keyword', { fg = c.keyword })
hi('Exception', { fg = c.keyword })
hi('PreProc', { fg = c.constant })
hi('Include', { fg = c.keyword })
hi('Define', { fg = c.keyword })
hi('Macro', { fg = c.keyword })
hi('PreCondit', { fg = c.keyword })
hi('Type', { fg = c.type })
hi('StorageClass', { fg = c.keyword })
hi('Structure', { fg = c.type })
hi('Typedef', { fg = c.type })
hi('Special', { fg = c.tag })
hi('SpecialChar', { fg = c.constant })
hi('Tag', { fg = c.tag })
hi('Delimiter', { fg = c.fg_dark })
hi('SpecialComment', { fg = c.comment })
hi('Debug', { fg = c.warning })
hi('Underlined', { underline = true })
hi('Error', { fg = c.error })
hi('Todo', { fg = c.info, bold = true })

-- Treesitter
hi('@variable', { fg = c.variable })
hi('@variable.builtin', { fg = c.variable })
hi('@variable.parameter', { fg = c.variable })
hi('@variable.member', { fg = c.fg_bright })
hi('@property', { fg = c.fg_bright })
hi('@constant', { fg = c.constant })
hi('@constant.builtin', { fg = c.constant })
hi('@constant.macro', { fg = c.constant })
hi('@module', { fg = c.type })
hi('@string', { fg = c.string })
hi('@string.escape', { fg = c.constant })
hi('@string.regexp', { fg = c.string })
hi('@character', { fg = c.constant })
hi('@number', { fg = c.number })
hi('@number.float', { fg = c.number })
hi('@boolean', { fg = c.constant })
hi('@type', { fg = c.type })
hi('@type.builtin', { fg = c.type })
hi('@type.qualifier', { fg = c.keyword })
hi('@attribute', { fg = c.variable })
hi('@function', { fg = c.func })
hi('@function.builtin', { fg = c.func })
hi('@function.call', { fg = c.func })
hi('@function.method', { fg = c.func })
hi('@function.method.call', { fg = c.func })
hi('@constructor', { fg = c.type })
hi('@keyword', { fg = c.keyword })
hi('@keyword.function', { fg = c.keyword })
hi('@keyword.operator', { fg = c.keyword })
hi('@keyword.import', { fg = c.keyword })
hi('@keyword.return', { fg = c.keyword })
hi('@keyword.conditional', { fg = c.keyword })
hi('@keyword.repeat', { fg = c.keyword })
hi('@keyword.exception', { fg = c.keyword })
hi('@operator', { fg = c.fg_dark })
hi('@punctuation', { fg = c.fg_dark })
hi('@punctuation.bracket', { fg = c.fg_dark })
hi('@punctuation.delimiter', { fg = c.fg_dark })
hi('@punctuation.special', { fg = c.tag })
hi('@comment', { fg = c.comment, italic = true })
hi('@tag', { fg = c.tag })
hi('@tag.attribute', { fg = c.variable })
hi('@tag.delimiter', { fg = c.fg_dark })
hi('@markup.heading', { fg = c.constant, bold = true })
hi('@markup.italic', { italic = true })
hi('@markup.strong', { bold = true })
hi('@markup.strikethrough', { strikethrough = true })
hi('@markup.underline', { underline = true })
hi('@markup.raw', { fg = c.string })
hi('@markup.link', { fg = c.fg })
hi('@markup.link.url', { fg = c.string, underline = true })
hi('@markup.list', { fg = c.tag })

-- LSP semantic tokens
hi('@lsp.type.class', { fg = c.type })
hi('@lsp.type.decorator', { fg = c.func })
hi('@lsp.type.enum', { fg = c.type })
hi('@lsp.type.enumMember', { fg = c.constant })
hi('@lsp.type.function', { fg = c.func })
hi('@lsp.type.interface', { fg = c.type })
hi('@lsp.type.method', { fg = c.func })
hi('@lsp.type.namespace', { fg = c.type })
hi('@lsp.type.parameter', { fg = c.variable })
hi('@lsp.type.property', { fg = c.fg_bright })
hi('@lsp.type.struct', { fg = c.type })
hi('@lsp.type.type', { fg = c.type })
hi('@lsp.type.variable', { fg = c.variable })

-- Git signs
hi('GitSignsAdd', { fg = c.added })
hi('GitSignsChange', { fg = c.changed })
hi('GitSignsDelete', { fg = c.deleted })

-- Neo-tree
hi('NeoTreeNormal', { fg = c.fg, bg = c.bg_sidebar })
hi('NeoTreeNormalNC', { fg = c.fg, bg = c.bg_sidebar })
hi('NeoTreeDimText', { fg = c.fg_dim })
hi('NeoTreeGitAdded', { fg = c.added })
hi('NeoTreeGitModified', { fg = c.changed })
hi('NeoTreeGitUntracked', { fg = c.variable })
hi('NeoTreeIndentMarker', { fg = c.border })
hi('NeoTreeDirectoryIcon', { fg = c.constant })
hi('NeoTreeDirectoryName', { fg = c.constant })
hi('NeoTreeRootName', { fg = c.fg_bright, bold = true })

-- Telescope
hi('TelescopeBorder', { fg = c.border })
hi('TelescopeNormal', { fg = c.fg })
hi('TelescopePromptPrefix', { fg = c.info })
hi('TelescopeSelection', { bg = '#2E3040' })
hi('TelescopeMatching', { fg = c.func, bold = true })

-- Indent/Whitespace guides
hi('IblIndent', { fg = '#2A2C33' })
hi('IblScope', { fg = c.fg_dim })
hi('MiniIndentscopeSymbol', { fg = c.fg_dim })

-- Blink.cmp
hi('BlinkCmpMenu', { fg = c.fg, bg = c.bg_float })
hi('BlinkCmpMenuBorder', { fg = c.border })
hi('BlinkCmpMenuSelection', { bg = '#2E3040' })
hi('BlinkCmpLabel', { fg = c.fg })
hi('BlinkCmpLabelMatch', { fg = c.func, bold = true })
hi('BlinkCmpKindFunction', { fg = c.func })
hi('BlinkCmpKindMethod', { fg = c.func })
hi('BlinkCmpKindVariable', { fg = c.variable })
hi('BlinkCmpKindKeyword', { fg = c.keyword })
hi('BlinkCmpKindText', { fg = c.string })
hi('BlinkCmpKindClass', { fg = c.type })
hi('BlinkCmpKindInterface', { fg = c.type })
hi('BlinkCmpKindModule', { fg = c.type })
hi('BlinkCmpKindProperty', { fg = c.fg_bright })
hi('BlinkCmpKindConstant', { fg = c.constant })
hi('BlinkCmpKindSnippet', { fg = c.keyword })
