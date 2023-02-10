return {
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- will be automatically installed with mason and loaded with lspconfig
                pyright = {},
                julials = {},
                rust_analyzer = {},
            },
        },
        {
            "jose-elias-alvarez/null-ls.nvim",
            -- opts = function()
            --   local nls = require("null-ls")
            --   return {
            --       sources = {
            --           nls.builtins.formatting.autopep8,
            --       },
            --   }
            -- end,
            opts = {
                sources = {
                    require("null-ls").builtins.formatting.autopep8,
                },
            }
        },
    },
}
