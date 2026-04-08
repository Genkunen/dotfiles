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
                config = config or {}
                config.capabilities = vim.tbl_deep_extend('force', capabilities, config.capabilities or {})
                vim.lsp.config(name, config)
                vim.lsp.enable(name)
            end

            local servers = {
                { 'clangd', {
                    cmd = {
                        'clangd',
                        '--background-index',
                        '--compile-commands-dir=build',
                        '--header-insertion=never',
                        '--query-driver=/usr/bin/clang++,/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++,/usr/bin/cc,/usr/bin/c++',
                    },
                } },
                { 'dartls' },
                { 'elixirls' },
                { 'erlangls' },
                { 'fortls' },
                { 'gopls' },
                { 'hls' },
                { 'html' },
                { 'cssls' },
                { 'jdtls', { cmd = { 'jdtls' } } },
                { 'julials' },
                { 'kotlin_language_server' },
                { 'lua_ls', {
                    settings = {
                        Lua = {
                            diagnostics = { globals = { 'vim' } },
                        },
                    },
                } },
                { 'ocamllsp' },
                { 'ols' },
                { 'perlnavigator' },
                { 'intelephense' },
                { 'pyright' },
                { 'r_language_server' },
                { 'ruby_lsp' },
                { 'rust_analyzer', {
                    settings = {
                        ['rust_analyzer'] = {
                            checkOnSave = {
                                command = 'clippy',
                            },
                        },
                    },
                } },
                { 'ts_ls', {
                    filetypes = {
                        'javascript',
                        'javascriptreact',
                        'typescript',
                        'typescriptreact',
                    },
                } },
                { 'zls' },
            }

            for _, server in ipairs(servers) do
                enable_lsp(server[1], server[2])
            end

            enable_lsp('emmet_ls', {
                filetypes = {
                    'html',
                    'css',
                    'javascriptreact',
                    'typescriptreact',
                },
            })
        end,
    },
    { 'hrsh7th/nvim-cmp', dependencies = { 'hrsh7th/cmp-nvim-lsp' } },
}
