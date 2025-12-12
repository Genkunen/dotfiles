return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

                    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
                end,
            })
            vim.lsp.config('clangd', {
                capabilities = capabilities,
                cmd = { 'clangd', '--header-insertion=never' },
            })
            vim.lsp.enable('clangd')

            vim.lsp.config('lua_ls', {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { 'vim' } },
                    },
                },
            })
            vim.lsp.enable('lua_ls')

            vim.lsp.config('pyright', {
                capabilities = capabilities
            })
            vim.lsp.enable('pyright')

            vim.lsp.config('ts_ls', {
                capabilities = capabilities
            })
            vim.lsp.enable('ts_ls')

            vim.lsp.config('zls', {
                capabilities = capabilities
            })
            vim.lsp.enable('zls')

            vim.lsp.config('rust_analyzer', {
                capabilities = capabilities,
                settings = {
                    ['rust_analyzer'] = {
                        checkOnSave = {
                            command = "clippy"
                        }
                    }
                }
            })
            vim.lsp.enable('rust_analyzer')

            vim.lsp.config('html', {
                capabilities = capabilities
            })
            vim.lsp.enable('html')

            vim.lsp.config('cssls', {
                capabilities = capabilities
            })
            vim.lsp.enable('cssls')

            vim.lsp.config('emmet_ls', {
                capabilities = capabilities,
                filetypes = { 'html', 'css', 'javascriptreact', 'typescriptreact' }
            })
            vim.lsp.enable('emmet_ls')
        end,
    },
    { 'hrsh7th/nvim-cmp', dependencies = { 'hrsh7th/cmp-nvim-lsp' }},
}
