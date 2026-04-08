return {
    'lervag/vimtex',

    config = function()
        vim.g.vimtex_compiler_method = 'latexmk'

        vim.g.vimtex_compiler_latexmk = {
            continuous = 1,
            options = {
                '-shell-escape',
                '-pdf',
                '-interaction=nonstopmode',
                '-synctex=1',
            }
        }

        vim.g.vimtex_view_method = 'zathura'

        vim.g.vimtex_quickfix_mode = 0
        vim.opt.conceallevel = 2
        vim.g.vimtex_syntax_enabled = 1
    end
}
