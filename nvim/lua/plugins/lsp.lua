return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({})
        end,
    },

    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'arduino_language_server',
                    'bashls',
                    'clangd',
                    'fortls',
                    'tsserver',
                    'julials',
                    'ltex',
                    'lua_ls',
                    'marksman',
                    'matlab_ls',
                    'pyright',
                    'rust_analyzer',
                    'taplo',
                    'typst_lsp',
                    'vimls',
                    'yamlls',
                },
            })
        end,
    },

    {
        'neovim/nvim-lspconfig',
        keys = {
            { '<leader>lh', '<cmd>lua vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())<cr>', desc = 'inlay hints' },
        },
        config = function()
            require('lspconfig').arduino_language_server.setup({})
            require('lspconfig').bashls.setup({})
            require('lspconfig').clangd.setup({})
            require('lspconfig').fortls.setup({})
            require('lspconfig').tsserver.setup({})
            require('lspconfig').julials.setup({})
            require('lspconfig').ltex.setup({})
            require('lspconfig').lua_ls.setup({})
            require('lspconfig').marksman.setup({})
            require('lspconfig').matlab_ls.setup({})
            require('lspconfig').pyright.setup({})
            require('lspconfig').rust_analyzer.setup({})
            require('lspconfig').taplo.setup({})
            require('lspconfig').typst_lsp.setup({})
            require('lspconfig').vimls.setup({})
            require('lspconfig').yamlls.setup({})
        end,
    },
}
