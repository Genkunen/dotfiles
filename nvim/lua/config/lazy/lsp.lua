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
            local enable_lsp = function(name, config)
                config.capabilities = capabilities
                vim.lsp.config(name, config)
                vim.lsp.enable(name)
            end

            enable_lsp('clangd', {
                cmd = {
                    'clangd',
                    '--background-index',
                    '--compile-commands-dir=build',
                    '--header-insertion=never',
                    '--query-driver=/usr/bin/clang++,/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++,/usr/bin/cc,/usr/bin/c++'
                }
            })
            enable_lsp('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = { globals = { 'vim' } }
                    }
                }
            })
            enable_lsp('ts_ls', {})
            enable_lsp('pyright', {})
            enable_lsp('zls', {})
            enable_lsp('rust_analyzer', {
                settings = {
                    ['rust_analyzer'] = {
                        checkOnSave = {
                            command = "clippy"
                        }
                    }
                }
            })
            enable_lsp('html', {})
            enable_lsp('cssls', {})
            enable_lsp('emmet_ls', {
                filetypes = {
                    'html', 'css', 'javascriptreact', 'typescriptreact' 
                }
            })
            enable_lsp('dartls', {})
            enable_lsp('elixirls', {
                cmd = { '/usr/bin/elixir-ls' }
            })
            enable_lsp('hls', {})
            enable_lsp('fortls', {})
            enable_lsp('gopls', {})
        end,
    },
    { 'hrsh7th/nvim-cmp', dependencies = { 'hrsh7th/cmp-nvim-lsp' }},
}
