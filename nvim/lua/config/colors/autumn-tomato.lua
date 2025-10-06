local M = {}

function M.setup()
    vim.cmd('highlight clear')
    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end

    vim.cmd('syntax on')

    vim.o.background = 'dark'
    vim.g.colors_name = 'autumn-tomato'

    local c = {
        -- Base colors
        bg = '#1E1E1E',
        fg = '#DADADA',
        fg_dark = '#D4D4D4',
        
        -- UI colors
        selection = '#3A3D41',
        selection_highlight = '#ADD6FF',
        line_highlight = '#2A2A2A',
        line_number = '#2b91af',
        indent_guide = '#404040',
        indent_guide_active = '#707070',
        
        -- Syntax colors
        blue = '#569cd6',
        light_blue = '#9cdcfe',
        cyan = '#4EC9B0',
        green = '#6A9955',
        bright_green = '#57A64A',
        light_green = '#B8D7A3',
        yellow = '#ffd700',
        gold = '#DCDCAA',
        tan = '#d7ba7d',
        orange = '#FF8000',
        brown = '#B9771E',
        salmon = '#ce9178',
        light_salmon = '#E8C9BB',
        escape_char = '#FFD68F',
        pink = '#C586C0',
        light_pink = '#D8A0DF',
        purple = '#bd63c5',
        red = '#f44747',
        dark_red = '#d16969',
        
        -- Variable colors
        variable = '#bdb76b',
        
        -- Gray scale
        comment = '#6A9955',
        gray = '#808080',
        light_gray = '#B4B4B4',
        medium_gray = '#9A9A9A',
        lighter_gray = '#C8C8C8',
        
        -- Numbers
        number = '#b5cea8',
        
        -- Misc
        numeric_bg = '#b5cea8',
    }

    local function hl(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end

    -- Editor UI
    hl('Normal', { fg = c.fg, bg = c.bg })
    hl('NormalFloat', { fg = c.fg, bg = c.bg })
    hl('ColorColumn', { bg = c.line_highlight })
    hl('Cursor', { fg = c.bg, bg = c.fg })
    hl('CursorLine', { bg = c.line_highlight })
    hl('CursorColumn', { bg = c.line_highlight })
    hl('LineNr', { fg = c.line_number })
    hl('CursorLineNr', { fg = c.line_number, bold = true })
    hl('Visual', { bg = c.selection })
    hl('VisualNOS', { bg = c.selection })
    hl('Search', { bg = c.selection_highlight, blend = 15 })
    hl('IncSearch', { bg = c.selection_highlight, blend = 15 })
    hl('Pmenu', { fg = c.fg, bg = '#303031' })
    hl('PmenuSel', { fg = c.fg, bg = c.selection })
    hl('PmenuSbar', { bg = c.selection })
    hl('PmenuThumb', { bg = c.light_gray })
    hl('StatusLine', { fg = c.fg, bg = c.line_highlight })
    hl('StatusLineNC', { fg = c.gray, bg = c.bg })
    hl('TabLine', { fg = c.fg, bg = c.line_highlight })
    hl('TabLineFill', { bg = c.bg })
    hl('TabLineSel', { fg = c.fg, bg = c.bg })
    hl('VertSplit', { fg = c.gray })
    hl('Folded', { fg = c.gray, bg = c.line_highlight })
    hl('FoldColumn', { fg = c.gray, bg = c.bg })
    hl('SignColumn', { bg = c.bg })
    hl('Directory', { fg = c.blue })
    hl('EndOfBuffer', { fg = c.bg })
    
    -- Indent guides
    hl('IndentBlanklineChar', { fg = c.indent_guide })
    hl('IndentBlanklineContextChar', { fg = c.indent_guide_active })


    -- Syntax: Comments
    hl('Comment', { fg = c.bright_green, italic = true })
    hl('SpecialComment', { fg = c.bright_green, italic = true })
    hl('Todo', { fg = c.bright_green, bold = true })
    
    -- Syntax: Constants
    hl('Constant', { fg = c.number })
    hl('String', { fg = c.salmon })
    hl('Character', { fg = c.blue })
    hl('Number', { fg = c.number })
    hl('Boolean', { fg = c.blue })
    hl('Float', { fg = c.number })
    
    -- Syntax: Identifiers
    hl('Identifier', { fg = c.variable })
    hl('Function', { fg = c.orange })
    
    -- Syntax: Statements
    hl('Statement', { fg = c.blue })
    hl('Conditional', { fg = c.light_pink })
    hl('Repeat', { fg = c.light_pink })
    hl('Label', { fg = c.lighter_gray })
    hl('Operator', { fg = c.light_gray })
    hl('Keyword', { fg = c.blue })
    hl('Exception', { fg = c.light_pink })
    
    -- Syntax: Preprocessor
    hl('PreProc', { fg = c.purple })
    hl('Include', { fg = c.blue })
    hl('Define', { fg = c.purple })
    hl('Macro', { fg = c.purple })
    hl('PreCondit', { fg = c.medium_gray })
    
    -- Syntax: Types
    hl('Type', { fg = c.yellow })
    hl('StorageClass', { fg = c.blue })
    hl('Structure', { fg = c.yellow })
    hl('Typedef', { fg = c.yellow })
    
    -- Syntax: Special
    hl('Special', { fg = c.blue })
    hl('SpecialChar', { fg = c.escape_char })
    hl('Tag', { fg = c.blue })
    hl('Delimiter', { fg = c.light_gray })
    hl('Debug', { fg = c.red })
    
    -- Syntax: Underlined
    hl('Underlined', { underline = true })
    hl('Ignore', { fg = c.gray })
    hl('Error', { fg = c.red })
  
    -- Diff
    hl('DiffAdd', { fg = c.number })
    hl('DiffChange', { fg = c.blue })
    hl('DiffDelete', { fg = c.salmon })
    hl('DiffText', { bg = c.selection })
    
    -- Git signs
    hl('GitSignsAdd', { fg = c.number })
    hl('GitSignsChange', { fg = c.blue })
    hl('GitSignsDelete', { fg = c.red })

    -- LSP
    hl('DiagnosticError', { fg = c.red })
    hl('DiagnosticWarn', { fg = c.gold })
    hl('DiagnosticInfo', { fg = c.light_blue })
    hl('DiagnosticHint', { fg = c.gray })
    hl('DiagnosticUnderlineError', { sp = c.red, undercurl = true })
    hl('DiagnosticUnderlineWarn', { sp = c.gold, undercurl = true })
    hl('DiagnosticUnderlineInfo', { sp = c.light_blue, undercurl = true })
    hl('DiagnosticUnderlineHint', { sp = c.gray, undercurl = true })
    
    -- Treesitter
    hl('@variable', { fg = c.variable })
    hl('@variable.builtin', { fg = c.blue })
    hl('@variable.parameter', { fg = c.variable })
    hl('@variable.member', { fg = c.variable })
    hl('@property', { fg = c.variable })
    
    hl('@constant', { fg = c.number })
    hl('@constant.builtin', { fg = c.blue })
    hl('@constant.macro', { fg = c.purple })
    
    hl('@module', { fg = c.light_green })
    hl('@namespace', { fg = c.light_green })
    hl('@label', { fg = c.lighter_gray })
    
    hl('@string', { fg = c.salmon })
    hl('@string.escape', { fg = c.escape_char })
    hl('@string.special', { fg = c.salmon })
    hl('@character', { fg = c.salmon })
    hl('@character.special', { fg = c.escape_char })
    
    hl('@boolean', { fg = c.blue })
    hl('@number', { fg = c.number })
    hl('@float', { fg = c.number })
    
    hl('@function', { fg = c.orange })
    hl('@function.builtin', { fg = c.orange })
    hl('@function.macro', { fg = c.purple })
    hl('@function.method', { fg = c.orange })
    hl('@constructor', { fg = c.yellow })
    hl('@operator', { fg = c.light_gray })
    
    hl('@keyword', { fg = c.blue })
    hl('@keyword.function', { fg = c.blue })
    hl('@keyword.operator', { fg = c.blue })
    hl('@keyword.return', { fg = c.light_pink })
    hl('@keyword.conditional', { fg = c.light_pink })
    hl('@keyword.repeat', { fg = c.light_pink })
    hl('@keyword.import', { fg = c.blue })
    hl('@keyword.exception', { fg = c.light_pink })
   
    hl('@keyword.operator.new', { fg = c.light_pink })
    hl('@keyword.operator.delete', { fg = c.light_pink })

    hl('@type', { fg = c.yellow })
    hl('@type.builtin', { fg = c.blue })
    hl('@type.definition', { fg = c.yellow })
    hl('@type.qualifier', { fg = c.blue })
    
    hl('@punctuation.delimiter', { fg = c.light_gray })
    hl('@punctuation.bracket', { fg = c.light_gray })
    hl('@punctuation.special', { fg = c.light_gray })
    
    hl('@comment', { fg = c.bright_green, italic = true })
    hl('@comment.todo', { fg = c.bright_green, bold = true })
    hl('@comment.warning', { fg = c.gold, bold = true })
    hl('@comment.error', { fg = c.red, bold = true })
    hl('@comment.note', { fg = c.light_blue, bold = true })
    
    hl('@tag', { fg = c.blue })
    hl('@tag.attribute', { fg = c.light_blue })
    hl('@tag.delimiter', { fg = c.gray })
    
    -- Markdown
    hl('@markup.heading', { fg = c.blue, bold = true })
    hl('@markup.strong', { bold = true })
    hl('@markup.italic', { italic = true })
    hl('@markup.strikethrough', { strikethrough = true })
    hl('@markup.underline', { underline = true })
    hl('@markup.link', { fg = c.light_blue })
    hl('@markup.link.url', { fg = c.salmon, underline = true })
    hl('@markup.raw', { fg = c.salmon })
    hl('@markup.list', { fg = c.blue })
    hl('@markup.quote', { fg = c.green })
    
    -- C/C++ specific
    hl('@lsp.type.namespace', { fg = c.light_green })
    hl('@lsp.type.type', { fg = c.yellow })
    hl('@lsp.type.class', { fg = c.yellow })
    hl('@lsp.type.enum', { fg = c.yellow })
    hl('@lsp.type.interface', { fg = c.yellow })
    hl('@lsp.type.struct', { fg = c.yellow })
    hl('@lsp.type.parameter', { fg = c.variable })
    hl('@lsp.type.variable', { fg = c.variable })
    hl('@lsp.type.property', { fg = c.variable })
    hl('@lsp.type.enumMember', { fg = c.brown })
    hl('@lsp.type.function', { fg = c.orange })
    hl('@lsp.type.method', { fg = c.orange })
    hl('@lsp.type.macro', { fg = c.purple })
    hl('@lsp.type.decorator', { fg = c.purple })
    hl('@lsp.type.comment', { fg = c.bright_green })
    
    -- Telescope
    hl('TelescopeBorder', { fg = c.gray })
    hl('TelescopeSelection', { bg = c.selection })
    hl('TelescopeSelectionCaret', { fg = c.blue })
    hl('TelescopeMatching', { fg = c.gold, bold = true })
    
    -- NvimTree / Neo-tree
    hl('NvimTreeFolderName', { fg = c.light_blue })
    hl('NvimTreeFolderIcon', { fg = c.blue })
    hl('NvimTreeNormal', { fg = c.fg, bg = c.bg })
    hl('NvimTreeOpenedFolderName', { fg = c.light_blue, bold = true })
    hl('NvimTreeRootFolder', { fg = c.purple, bold = true })
    hl('NvimTreeSpecialFile', { fg = c.gold })
    hl('NvimTreeGitDirty', { fg = c.gold })
    hl('NvimTreeGitNew', { fg = c.number })
    hl('NvimTreeGitDeleted', { fg = c.red })
    
    -- Which-key
    hl('WhichKey', { fg = c.blue })
    hl('WhichKeyGroup', { fg = c.purple })
    hl('WhichKeyDesc', { fg = c.fg })
    hl('WhichKeySeperator', { fg = c.gray })
    hl('WhichKeySeparator', { fg = c.gray })
    hl('WhichKeyFloat', { bg = c.bg })
    hl('WhichKeyValue', { fg = c.gray })
end

return M
