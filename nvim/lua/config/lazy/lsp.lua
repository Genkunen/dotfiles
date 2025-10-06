return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')

            lspconfig.clangd.setup({
                cmd = { 'clangd', '--header-insertion=never' },
                on_attach = function(client, bufnr)
                    local opts = { buffer = bufnr, noremap = true, silent = true }
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                end,
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            })
        end,
    },
    { 'hrsh7th/nvim-cmp', dependencies = { 'hrsh7th/cmp-nvim-lsp' }},
}
